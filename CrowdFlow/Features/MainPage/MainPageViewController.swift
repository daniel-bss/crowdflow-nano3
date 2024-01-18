//
//  MainPageViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

enum MainPageSection {
    case trainInformation
    case mainFeatures(iconStrings: [String], textStrings: [String])
    case lifestyle(imageStrings: [String])
    case promotions(imageStrings: [String])
    case newsAndStories(imageStrings: [String], titleStrings: [String], timeDescStrings: [String])
}

class MainPageViewController: UIViewController {
    
    // MARK: DATA PROPERTIES
    var sections = [MainPageSection]()
    let sectionStrings = ["", "Main Features", "Lifestyle", "Promotions", "News & Stories"]

    // MARK: UI COMPONENTS
    let locationView = UIView()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIdx, _ in
            switch sectionIdx {
            case 0:
                return Self.createInformationSection()
            case 1:
                return Self.createMainFeaturesSection()
            case 2:
                return Self.createLifestyleSection()
            case 3:
                return Self.createPromotionSection()
            default:
                return Self.createNewsSection()
            }
        }
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        
        configureData()
        setupLocationView()
        setupCollectionView()
    }
    
    private func configureData() {
        self.sections.append(.trainInformation)
        
        self.sections.append(
            .mainFeatures(
                iconStrings: ["ticket.fill", "clock.fill", "train.side.front.car", "map.fill", "building.2.fill", "ellipsis"],
                textStrings: ["Ticket", "Schedule", "Carriage", "Maps", "Nearby", "More"]
            )
        )
        
        self.sections.append(.lifestyle(imageStrings: (0...7).compactMap({"lifestyle-icon-\($0)"})))
        
        self.sections.append(.promotions(imageStrings: (0...3).compactMap({"promotions-\($0)"})))
        
        self.sections.append(
            .newsAndStories(
                imageStrings: (0...2).compactMap({"newsstories-\($0)"}),
                titleStrings: ["Apple Academy & MRT-J App Launches New Feature to Help Commuters Know The Number of Available Seats", "Addressing Passenger Queues, with MRT Jakarta With Apple Academy Introduces Crows Distribution Feature", "Next Month, Riding MRT Jakarta Can Be Paid Using QRIS"],
                timeDescStrings: ["5 hours ago", "2 days ago", "5 days ago"]
            )
        )
    }
    
    private func setupLocationView() {
        locationView.backgroundColor = .lightBlue
        locationView.layer.zPosition = 999
        
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
        collectionView.register(MainFeaturesCollectionViewCell.self, forCellWithReuseIdentifier: MainFeaturesCollectionViewCell.identifier)
        collectionView.register(LifestyleCollectionViewCell.self, forCellWithReuseIdentifier: LifestyleCollectionViewCell.identifier)
        collectionView.register(PromotionsCollectionViewCell.self, forCellWithReuseIdentifier: PromotionsCollectionViewCell.identifier)
        collectionView.register(NewsAndStoriesCollectionViewCell.self, forCellWithReuseIdentifier: NewsAndStoriesCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: locationView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: CREATE SECTIONS - static funcs
    
    static func createInformationSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 339
        let cellHeight: CGFloat = 176
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -6)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(197)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(64)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    static func createMainFeaturesSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 65.63
        let cellHeight: CGFloat = 90.07
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -3)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(107)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
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
    
    static func createLifestyleSection() -> NSCollectionLayoutSection {
        let cellSize: CGFloat = 65.63
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellSize + horizontalPadding),
                heightDimension: .absolute(cellSize)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -3)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellSize + horizontalPadding),
                heightDimension: .absolute(cellSize + 17)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
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
    
    static func createPromotionSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 332.29
        let cellHeight: CGFloat = 165.84
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -6)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight + 15.63)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28 + 16.37)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    static func createNewsSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 332.29
        let cellHeight: CGFloat = 258
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -1)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight + 10)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28 + 15.53)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let mainPageSection = self.sections[section]
        
        switch mainPageSection {
        case .mainFeatures(let iconStrings, _):
            return iconStrings.count
        case .lifestyle(let imageStrings):
            return imageStrings.count
        case .promotions(let imageStrings):
            return imageStrings.count
        case .newsAndStories(let imageStrings, _, _):
            return imageStrings.count
        default:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.sections[indexPath.section]
        
        switch section {
        case .mainFeatures(let iconStrings, let textStrings):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainFeaturesCollectionViewCell.identifier, for: indexPath) as! MainFeaturesCollectionViewCell
            cell.configure(iconString: iconStrings[indexPath.row], textString: textStrings[indexPath.row])
            return cell
        case .lifestyle(let imageStrings):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LifestyleCollectionViewCell.identifier, for: indexPath) as! LifestyleCollectionViewCell
            cell.configure(imageString: imageStrings[indexPath.row])
            return cell
        case .promotions(let imageStrings):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionsCollectionViewCell.identifier, for: indexPath) as! PromotionsCollectionViewCell
            cell.configure(imageString: imageStrings[indexPath.row])
            return cell
        case .newsAndStories(let imageStrings, let titleStrings, let timeDescStrings):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsAndStoriesCollectionViewCell.identifier, for: indexPath) as! NewsAndStoriesCollectionViewCell
            cell.configure(
                imageString: imageStrings[indexPath.row],
                titleString: titleStrings[indexPath.row],
                timeDescString: timeDescStrings[indexPath.row]
            )
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainInformationCollectionViewCell.identifier, for: indexPath)
            return cell
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pageSection = self.sections[indexPath.section]
        
        switch pageSection {
        case .promotions(_), .newsAndStories(_, _, _):
            let alert = UIAlertController(title: "Sorry!", message: "These \"Promotions\" and \"News\" are just dummy data, intentionally to be non functional", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            break
        default:
            print("x")
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset > 0 {
            self.locationView.setupShadow()
            locationView.layer.shadowOpacity = Float(min((yOffset / 30), 1)) * 0.35
        } else {
            self.locationView.layer.shadowOpacity = 0
        }
    }
    
}
