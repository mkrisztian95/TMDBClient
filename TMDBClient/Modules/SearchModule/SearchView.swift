//
//  ViewController.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import UIKit

protocol SearchViewActions: BaseView {
    func setState()
    func closeToHeader()
}

class SearchView: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var mainView: RoundedCornerView!
    @IBOutlet private weak var robotIcon: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    @IBOutlet private weak var collectionViewContainer: UIView!
    @IBOutlet private weak var searchTextFieldTrailing: NSLayoutConstraint!
    @IBOutlet private weak var searchTextFieldLeading: NSLayoutConstraint!
    @IBOutlet private weak var robotHeight: NSLayoutConstraint!
    @IBOutlet private weak var searchBlockHeight: NSLayoutConstraint!
    @IBOutlet private weak var robotIcoTop: NSLayoutConstraint!
    @IBOutlet private weak var robotIcoLeading: NSLayoutConstraint!
    @IBOutlet private weak var mainViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Private Properties
    private var isCollapsed: Bool = false
    private var isKeyboardOpened: Bool = false
    private var currentPage: Int = 1

    // MARK: - public properties
    var presenter: SearchAction!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesCollectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseID)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardShowNotification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        self.collectionViewContainer.isHidden = true
    }

    // MARK: - Obj listeners
    @objc
    private func handle(keyboardShowNotification notification: Notification) {
        if !isCollapsed, !isKeyboardOpened, let userInfo = notification.userInfo,
            let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            UIView.animate(withDuration: Constants.animationDuration) {
                [self.titleLabel, self.subtitleLabel].forEach { label in
                    label?.layer.opacity = 0
                    label?.transform = CGAffineTransform(scaleX: Constants.TitleLabel.xTransform, y: Constants.TitleLabel.yTransform)
                }
                self.mainViewBottomConstraint.constant += keyboardRectangle.height
                self.robotHeight.constant /= Constants.robotHeightCoeff
                self.view.layoutIfNeeded()
            } completion: { _ in
                [self.titleLabel, self.subtitleLabel].forEach { label in
                    label?.isHidden = true
                }
            }
        }
        isKeyboardOpened = true
    }

    // MARK: - IBActions
    @IBAction func didTapSubmitButton(_ sender: Any) {
        guard let text = self.searchTextField.text else { return }
        presenter.updateSearchRequest(with: text)
    }

    @IBAction func didChangedValue(_ sender: Any) {
        guard let text = searchTextField.text else { return }
        if !isCollapsed {
            self.submitButton.isEnabled = text.isEmpty ? false : true
            self.submitButton.backgroundColor = text.isEmpty ? R.color.baseAppOrangeInactive() : R.color.baseAppOrangeActive()
        } else {
            presenter.liveSearch(with: text)
        }
    }
}

// MARK: - SearchView + SearchViewActions
extension SearchView: SearchViewActions {
    func setState() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.moviesCollectionView.reloadData()
    }

    func closeToHeader() {
        self.isCollapsed = true
        self.searchTextField.endEditing(true)
        self.submitButton.isHidden = true
        UIView.animate(withDuration: Constants.animationDuration) {
            self.mainView.leftBottomRadius = Constants.ClosedHeader.mainViewBottomRadius
            self.mainView.rightBottomRadius = Constants.ClosedHeader.mainViewBottomRadius
            self.robotIcoTop.constant = Constants.ClosedHeader.RobotIcon.topInset
            self.robotIcoLeading.constant = Constants.ClosedHeader.RobotIcon.leading
            self.robotHeight.constant = Constants.ClosedHeader.RobotIcon.height
            self.searchTextFieldTrailing.constant = Constants.ClosedHeader.SearchTextField.trailing
            self.searchTextFieldLeading.constant = self.robotIcoLeading.constant + Constants.ClosedHeader.SearchTextField.leading
            self.searchBlockHeight.constant = Constants.ClosedHeader.SearchBlock.height
            self.mainViewBottomConstraint.constant = self.view.frame.height - Constants.ClosedHeader.SearchBlock.leading
            self.view.bringSubviewToFront(self.mainView)
            self.view.bringSubviewToFront(self.collectionViewContainer)
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.collectionViewContainer.isHidden = false
        }
    }
}
