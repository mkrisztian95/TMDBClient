//
//  SearchPresenter.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation

protocol SearchAction: BasePresenter {
    func updateSearchRequest(with text: String)
    func loadMore(with text: String)
    func resetPage()
    func didSelectRow(at index: IndexPath)
    func liveSearch(with text: String)
    var movies: [MovieCellViewModel] { get }
}

final class SearchPresenter: SearchAction {

    // MARK: - Public properties
    unowned var view: SearchViewActions
    var movies: [MovieCellViewModel] {
        return moviesVM
    }

    // MARK: - Private Properties
    private var currentPage: Int = 1
    private var moviesVM: [MovieCellViewModel] = []
    private var timer = Timer()

    // MARK: - Initialization
    init(view: SearchViewActions) {
        self.view = view
    }

    func configureView() {
        self.view.setState()
    }

    func resetPage() {
        currentPage = 1
    }

    func updateSearchRequest(with text: String) {
        SearchAPI().performSearchRequest(with: text, page: currentPage)
            .onSuccess {[weak self] wrapper in
                guard let strongSelf = self else { return }
                if let result = wrapper.results {
                    strongSelf.moviesVM.append(contentsOf: result.map({ item in
                        return MovieCellViewModel(model: item)
                    }))
                    strongSelf.view.setState()
                }
            }
            .onComplete {[weak self] _ in
                self?.view.closeToHeader()
            }
            .onFailure { err in
                Logger.logError(err: err)
            }
    }

    func didSelectRow(at index: IndexPath) {
        self.view.open(module: MovieDetailsModule(movieId: self.movies[index.row].id))
    }

    func loadMore(with text: String) {
        self.currentPage += 1
        updateSearchRequest(with: text)
    }

    func liveSearch(with text: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: {[weak self] _ in
            self?.moviesVM.removeAll()
            self?.resetPage()
            self?.updateSearchRequest(with: text)
        })
    }
}
