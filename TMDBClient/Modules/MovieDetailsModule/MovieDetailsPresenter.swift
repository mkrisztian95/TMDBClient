//
//  MovieDetailsPresenter.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation

protocol MovieDetailsAction: BasePresenter {
    func didTapBackButton()
}

final class MovieDetailsPresenter: MovieDetailsAction {
    // MARK: - Public properties
    unowned var view: MovieDetailViewActions

    // MARK: - Private Properties
    private let movieId: Int

    // MARK: - Initialization
    init(view: MovieDetailViewActions, movieId: Int) {
        self.view = view
        self.movieId = movieId
    }

    func configureView() {
        MovieDetilsApi(movieId: movieId).getMovieDetails()
            .onSuccess { model in
                self.view.setState(vm: .init(model: model))
            }
            .onFailure { err in
                Logger.logError(err: err)
            }
    }

    func didTapBackButton() {
        self.view.closeModule(animated: true)
    }
}
