//
//  DetailsItem.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

enum DetailsItem: String, CaseIterable {
    case overview
    case popularity
    case releaseDate
    case budget
    case productions
    case revenue
    case vote

    var title: String {
        switch self {
        case .overview:
            return R.string.localizable.overview()
        case .popularity:
            return R.string.localizable.popularity()
        case .releaseDate:
            return R.string.localizable.releaseDate()
        case .budget:
            return R.string.localizable.budget()
        case .productions:
            return R.string.localizable.productions()
        case .revenue:
            return R.string.localizable.revenue()
        case .vote:
            return R.string.localizable.vote()
        }
    }

    var color: UIColor? {
        switch self {
        case .overview:
            return R.color.overviewColor()?.withAlphaComponent(0.5)
        case .popularity:
            return R.color.popularityColor()?.withAlphaComponent(0.5)
        case .releaseDate:
            return R.color.releaseDateColor()?.withAlphaComponent(0.5)
        case .budget:
            return R.color.budgetColor()?.withAlphaComponent(0.5)
        case .productions:
            return R.color.productionsColor()?.withAlphaComponent(0.5)
        case .revenue:
            return R.color.revenueColor()?.withAlphaComponent(0.5)
        case .vote:
            return R.color.voteColor()?.withAlphaComponent(0.5)
        }
    }
}
