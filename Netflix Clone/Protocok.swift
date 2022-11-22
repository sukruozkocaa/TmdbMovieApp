//
//  Protocok.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 21.11.2022.
//

import Foundation

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
}
