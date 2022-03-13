//
//  MovieDetailsModule.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

final class MovieDetailsModule: BaseModule {
    private let view: MovieDetailsView
    private let presenter: MovieDetailsPresenter

    init(movieId: Int) {
        view = R.storyboard.movieDetailsView.movieDetailsView()! // swiftlint:disable:this force_unwrapping
        presenter = MovieDetailsPresenter(view: view, movieId: movieId)
        view.presenter = presenter
    }

    func viewController() -> UIViewController {
        return view
    }
}
