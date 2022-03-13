//
//  SearchModule.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

final class SearchModule: BaseModule {
    private let view: SearchView
    private let presenter: SearchPresenter

    init() {
        view = R.storyboard.searchView.searchView()! // swiftlint:disable:this force_unwrapping
        presenter = SearchPresenter(view: view)
        view.presenter = presenter
    }

    func viewController() -> UIViewController {
        return view
    }
}
