//
//  MovieDetailsView.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit
import Kingfisher

protocol MovieDetailViewActions: BaseView {
    func setState(vm: MovieDetailsViewModel)
}

class MovieDetailsView: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsCollection: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!

    // MARK: - Parameters
    var cells: [DetailsItem] = DetailsItem.allCases
    var vm: MovieDetailsViewModel?

    var presenter: MovieDetailsAction!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailsCollection.register(MovieDetailsCell.nib, forCellWithReuseIdentifier: MovieDetailsCell.reuseID)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.configureView()
    }

    // MARK: - IBAactions
    @IBAction func didTapBackButton(_ sender: Any) {
        presenter.didTapBackButton()
    }
}

// MARK: - MovieDetailsView + MovieDetailViewActions
extension MovieDetailsView: MovieDetailViewActions {
    func setState(vm: MovieDetailsViewModel) {
        self.vm = vm
        self.titleLabel.text = vm.title
        if let url = vm.poster {
            self.backgroundImage.kf.setImage(with: url)
            self.backgroundImage.addBlur()
        }
        self.detailsCollection.reloadData()
    }
}
