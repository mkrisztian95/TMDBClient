//
//  MovieDetailsView+Collections.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import UIKit

extension MovieDetailsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vm != nil ? cells.count : 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let vm = self.vm else { return UICollectionViewCell() }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseID, for: indexPath) as? MovieDetailsCell {
            let type = cells[indexPath.row]
            cell.setUp(type: type, value: vm.getValue(by: type))
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch cells[indexPath.row] {
        case .overview:
            let width = collectionView.frame.width
            let height = width / 2
            return CGSize(width: width, height: height)

        default:
            let width = collectionView.frame.width  / 2 - 8
            let height = width
            return CGSize(width: width, height: height)
        }
    }
}
