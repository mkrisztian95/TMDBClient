//
//  Search+Collection.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import UIKit

extension SearchView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseID, for: indexPath) as? MovieCollectionViewCell {
            cell.setUp(vm: presenter.movies[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widht = self.view.frame.width / Constants.numberOfItemsInRow - Constants.gapBetweenItemsInRow
        let height = widht * Constants.numberOfItemsInRow
        return CGSize(width: widht, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastElement = presenter.movies.count - Constants.preloadIndex
        if indexPath.row == lastElement {
            guard let text = searchTextField.text else { return }
            presenter.loadMore(with: text)
        }
    }
}
