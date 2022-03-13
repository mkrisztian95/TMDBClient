//
//  MovieDetailsViewModel.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation

class MovieDetailsViewModel {
    let title: String
    let popularity: String
    var poster: URL?
    let productions: String
    let releaseDate: String
    let revenue: String
    let vote: String
    let budget: String
    let overView: String

    init(model: MovieDetailsModel) {
        self.overView = model.overView ?? ""
        self.title = model.title ?? ""
        self.popularity = "\(model.popularity ?? 0.0)"
        self.productions = (model.productions ?? []).compactMap {$0.name}.joined(separator: "\n")
        self.releaseDate = model.releaseDate?.getDate()?.getPrettyDate() ?? "--"
        self.revenue = "$\(model.revenue ?? 0.0)"
        self.vote = "\(model.vote ?? 0.0)"
        self.budget = "$\(model.budget ?? 0)"
        if let posterUrl = URL(string: URLs.assetURL + (model.poster ?? "")) {
            self.poster = posterUrl
        }
    }

    func getValue(by type: DetailsItem) -> String {
        switch type {
        case .overview:
            return overView
        case .popularity:
            return popularity
        case .releaseDate:
            return releaseDate
        case .budget:
            return budget
        case .productions:
            return productions
        case .revenue:
            return revenue
        case .vote:
            return vote
        }
    }
}
