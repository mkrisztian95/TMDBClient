//
//  ViewController.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: RoundedCornerView!
    @IBOutlet weak var robotHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBlockHeight: NSLayoutConstraint!
    @IBOutlet weak var robotIcon: UIImageView!
    @IBOutlet weak var searchTextFieldTrailing: NSLayoutConstraint!
    @IBOutlet weak var searchTextFieldLeading: NSLayoutConstraint!
    @IBOutlet weak var robotIcoTop: NSLayoutConstraint!
    @IBOutlet weak var robotIcoLeading: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var mainViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    private var isCollapsed: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardShowNotification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }

    @IBAction func didTapSubmitButton(_ sender: Any) {
        if let text = self.searchTextField.text {
            SearchAPI().performSearchRequest(with: text)
                .onComplete { _ in
                    self.isCollapsed = true
                    self.searchTextField.endEditing(true)
                    self.submitButton.isHidden = true
                    UIView.animate(withDuration: 0.3) {
                        self.mainView.leftBottomRadius = 25.0
                        self.mainView.rightBottomRadius = 25.0
                        self.robotIcoTop.constant = 35.0
                        self.robotIcoLeading.constant = 24.0
                        self.robotHeight.constant = 50.0
                        self.searchTextFieldTrailing.constant = 24.0
                        self.searchTextFieldLeading.constant = self.robotIcoLeading.constant + 100.0
                        self.searchBlockHeight.constant = 55
                        self.mainViewBottomConstraint.constant = self.view.frame.height - 100
                        self.view.layoutIfNeeded()
                    }
                }
        }
    }

    @objc
    private func handle(keyboardShowNotification notification: Notification) {
        if !isCollapsed, let userInfo = notification.userInfo,
            let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            UIView.animate(withDuration: 0.3) {
                [self.titleLabel, self.subtitleLabel].forEach { label in
                    label?.layer.opacity = 0
                    label?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                }
                self.mainViewBottomConstraint.constant += keyboardRectangle.height
                self.robotHeight.constant /= 1.5
                self.view.layoutIfNeeded()
            } completion: { _ in
                [self.titleLabel, self.subtitleLabel].forEach { label in
                    label?.isHidden = true
                }
            }
        }
    }

    @IBAction func didChangedValue(_ sender: Any) {
        guard let text = searchTextField.text else { return }
        if !isCollapsed {
            self.submitButton.isEnabled = text.isEmpty ? false : true
            self.submitButton.backgroundColor = UIColor(named: text.isEmpty ? "base-app-orange-inactive" : "base-app-orange-active")
        } else {
            SearchAPI().performSearchRequest(with: text)
                .onComplete { _ in

                }
        }

    }
}

extension ViewController {
    struct Constants {
        static let mainViewBottomInset: CGFloat = 78.0
    }
}
