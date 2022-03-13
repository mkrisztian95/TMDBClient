//
//  MovieDetailsCell.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

class MovieDetailsCell: BaseCollectionNibCell {

    // MARK: - IBOutlets 
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(type: DetailsItem, value: String) {
        self.titleLabel.text = type.title
        self.valueLabel.text = value
        self.bgView.backgroundColor = type.color
    }
}
