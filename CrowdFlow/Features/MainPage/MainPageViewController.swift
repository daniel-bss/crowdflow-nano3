//
//  MainPageViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

class MainPageViewController: UIViewController {
    
    let sectionStrings = ["", "Main Features", "Lifestyle", "Promotion", "News & Stories"]

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIdx, _ in
            switch sectionIdx {
            case 0:
                return Self.createLargeCellSection()
            case 1, 2:
                return Self.createSmallCellSection()
            default:
                return Self.createOtherCellSection()
            }
        }
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        return collectionView
    }()
    
    let locationView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLocationView()
        setupCollectionView()
    }
    
    private func setupLocationView() {
        locationView.backgroundColor = .lightBlue
        
        let icon = UIImageView(image: UIImage(systemName: "location.circle.fill"))
        icon.tintColor = .darkBlue
        icon.frame.size = CGSize(width: 16, height: 16)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Senayan Station, South Jakarta, Indonesia."
        descriptionLabel.font = .poppinsRegular(size: 12)
        descriptionLabel.textColor = .textBlue
        descriptionLabel.sizeToFit()
            
        view.addSubview(locationView)
        locationView.addSubview(icon)
        locationView.addSubview(descriptionLabel)
        
        locationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationView.heightAnchor.constraint(equalToConstant: 34),
        ])
        
        icon.frame = CGRect(x: 16, y: 34 / 2 - icon.height / 2, width: icon.width, height: icon.height)
        descriptionLabel.frame = CGRect(x: icon.right + 7, y: icon.frame.midY - descriptionLabel.height / 2, width: descriptionLabel.width, height: descriptionLabel.height)
        
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        
        collectionView.register(MainSectionCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainSectionCollectionReusableView.identifier)
        collectionView.register(OtherSectionCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherSectionCollectionReusableView.identifier)
        
        collectionView.register(TrainInformationCollectionViewCell.self, forCellWithReuseIdentifier: TrainInformationCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: locationView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: CREATE SECTIONS - static funcs
    
    static func createLargeCellSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 339
        let cellHeight: CGFloat = 176
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(197)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(64)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    static func createSmallCellSection() -> NSCollectionLayoutSection {
        let cellSize: CGFloat = 65.63
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellSize + horizontalPadding),
                heightDimension: .absolute(cellSize)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 13)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellSize + horizontalPadding),
                heightDimension: .absolute(107)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(41)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    static func createOtherCellSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 339
        let cellHeight: CGFloat = 176
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(41)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainInformationCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: MainSectionCollectionReusableView.identifier,
                for: indexPath
            ) as! MainSectionCollectionReusableView
            
            header.configure()
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: OtherSectionCollectionReusableView.identifier,
                for: indexPath
            ) as! OtherSectionCollectionReusableView
            
            header.configure(text: self.sectionStrings[indexPath.section])
            return header
        }
    }
    
}
