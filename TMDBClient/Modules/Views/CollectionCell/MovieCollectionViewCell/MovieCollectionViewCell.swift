//
//  MovieCollectionViewCell.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit
import Kingfisher
import AARatingBar

class MovieCollectionViewCell: BaseCollectionNibCell {

    // MARK: - IBOutlets
    @IBOutlet weak var flagView: UILabel!
    @IBOutlet weak var ratingView: AARatingBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    // MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    // MARK: - Public Methods
    func setUp(vm: MovieCellViewModel) {
        self.titleLabel.text = vm.title
        self.ratingView.value = vm.voteFormatted ?? 0.0
        if let url = vm.posterUrl {
            self.posterImageView.kf.setImage(with: url, placeholder: R.image.icoNoResults())
        }
        self.flagView.text = vm.country
    }
}
