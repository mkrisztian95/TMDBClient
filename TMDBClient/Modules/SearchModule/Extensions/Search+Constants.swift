//
//  Search+Constants.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

extension SearchView {
    struct Constants {
        struct TitleLabel {
            static let xTransform: CGFloat = 0.01
            static let yTransform: CGFloat = 0.01
        }

        struct ClosedHeader {
            struct RobotIcon {
                static let topInset: CGFloat = 35.0
                static let leading: CGFloat = 24.0
                static let height: CGFloat = 50.0
            }

            struct SearchTextField {
                static let leading: CGFloat = 100.0
                static let trailing: CGFloat = 24.0
            }

            struct SearchBlock {
                static let height: CGFloat = 55.0
                static let leading: CGFloat = 100.0
            }
            static let mainViewBottomRadius: CGFloat = 0.0
        }

        static let numberOfItemsInRow: CGFloat = 2.0
        static let gapBetweenItemsInRow: CGFloat = 2.0
        static let preloadIndex: Int = 2

        static let mainViewBottomInset: CGFloat = 78.0
        static let animationDuration: Double = 0.3
        static let robotHeightCoeff: CGFloat = 1.5

    }
}
