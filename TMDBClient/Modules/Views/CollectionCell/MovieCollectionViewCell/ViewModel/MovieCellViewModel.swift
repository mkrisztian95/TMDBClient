//
//  MovieCellViewModel.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

typealias Action = () -> Void

class MovieCellViewModel {
    let id: Int
    let title: String
    var overView: String?
    var posterUrl: URL?
    var backDropUrl: URL?
    var popularityFormatted: String?
    var voteFormatted: Double?
    var country: String

    init(model: SearchItemModel) {
        self.id = model.id ?? 0
        self.title = "\(model.title ?? "") \n \(model.originalTitle ?? "")"
        self.overView = model.overview
        self.popularityFormatted = "\(model.popularity ?? 0.0)"
        self.voteFormatted = (model.vote ?? 0.0)  / 2
        if let posterUrl = URL(string: URLs.assetURL + (model.poster ?? "")) {
            self.posterUrl = posterUrl
        }

        if let posterUrl = URL(string: URLs.assetURL + (model.backdrop ?? "")) {
            self.backDropUrl = posterUrl
        }
        self.country = (model.language ?? "").uppercased()
    }
}
