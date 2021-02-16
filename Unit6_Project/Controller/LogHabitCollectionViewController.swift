//
//  LogHabitCollectionViewController.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-12.
//

import UIKit


class LogHabitCollectionViewController: HabitCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex,
                                                      environment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 && self.model.favoriteHabits.count > 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension:
                                                        .fractionalWidth(0.45),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 12,
                                                             leading: 12, bottom: 12, trailing: 12)
                
                let groupSize = NSCollectionLayoutSize(widthDimension:
                                                        .fractionalWidth(1), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                                                                groupSize, subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                                leading: 0, bottom: 20, trailing: 0)
                return section
            } else {
                let itemSize: NSCollectionLayoutSize =
                    NSCollectionLayoutSize(widthDimension:
                                            .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize: NSCollectionLayoutSize =
                    NSCollectionLayoutSize(widthDimension:
                                            .fractionalWidth(1), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                                                                groupSize, subitem: item, count: 2)
                group.interItemSpacing = .fixed(8)
                group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 10, bottom: 0, trailing: 10)
                
                let headerSize: NSCollectionLayoutSize =
                    NSCollectionLayoutSize(widthDimension:
                                            .fractionalWidth(1), heightDimension: .absolute(36))
                let sectionHeader =
                    NSCollectionLayoutBoundarySupplementaryItem(layoutSize:
                                                                    headerSize, elementKind:
                                                                        UICollectionView.elementKindSectionFooter,
                                                                alignment: .top)
                sectionHeader.edgeSpacing =
                    NSCollectionLayoutEdgeSpacing(leading: nil, top: nil,
                                                  trailing: nil, bottom: .fixed(40))
                sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                                leading: 0, bottom: 20, trailing: 0)
                section.boundarySupplementaryItems = [sectionHeader]
                section.interGroupSpacing = 10
                
                return section
            }
        }
    }
    
    override func configureCell(_ cell: PrimarySecondaryTextCollectionViewCell, withItem item: ViewModel.Item) {
        cell.primaryTextLabel.text = item.habit.name
        cell.layer.cornerRadius = 8
        if Settings.shared.favoriteHabits.contains(item.habit) {
            cell.backgroundColor = favoriteHabitColor
        } else {
            cell.backgroundColor = .systemGray6
        }
    }
}

extension LogHabitCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        let loggedHabit = LoggedHabit(userID: Settings.shared.currentUser.id, habitName: item.habit.name, timeStamp: Date())
        LogHabitRequest(trackedEvent: loggedHabit).send { _ in }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
