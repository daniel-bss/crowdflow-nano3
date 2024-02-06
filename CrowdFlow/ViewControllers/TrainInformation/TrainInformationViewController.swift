//
//  TrainInformationViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit
import CocoaMQTT

enum TrainInformationSection {
    case trainDetailsInformation
    case totalSeatsInformation
    case carsInformation
    case seatsInformation
}

class TrainInformationViewController: UIViewController {
    
    // MARK: INIT
    let trainInformation: TrainInformationData
    let id: Int
    
    init(id: Int, trainInformation: TrainInformationData) {
        self.id = id
        self.trainInformation = trainInformation
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: COMPONENTS
    
    var viewModel = TrainInformationViewModel()
    var sections = [TrainInformationSection]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIdx, _ in
            let section = self.sections[sectionIdx]
            switch section {
            case .trainDetailsInformation:
                return Self.createTrainDetailsInformationSection()
            case .totalSeatsInformation:
                return Self.createTotalSeatsInformationSection()
            case .carsInformation:
                return Self.createCarsInformationSection()
            case .seatsInformation:
                return Self.createSeatsInformationSection()
            }
        }
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        return collectionView
    }()
    
    var mqtt: CocoaMQTT5!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        self.navigationItem.hidesBackButton = true
        
        setupNavbar()
        setupMQTT()
        
        configureData()
        setupCollectionView()
    }
    
    private func setupNavbar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left.circle.fill"), style: .plain, target: self, action: #selector(onClickBackButton))
        
        let label = UILabel()
        label.text = "Train Details Information"
        label.font = .poppinsSemiBold(size: 17)
        label.textColor = .white
        
        navigationItem.titleView = label
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(OtherSectionCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherSectionCollectionReusableView.identifier)
        
        collectionView.register(TrainDetailsCollectionViewCell.self, forCellWithReuseIdentifier: TrainDetailsCollectionViewCell.identifier)
        collectionView.register(TotalSeatsCollectionViewCell.self, forCellWithReuseIdentifier: TotalSeatsCollectionViewCell.identifier)
        collectionView.register(CarsCollectionViewCell.self, forCellWithReuseIdentifier: CarsCollectionViewCell.identifier)
        collectionView.register(AvailableSeatsCollectionViewCell.self, forCellWithReuseIdentifier: AvailableSeatsCollectionViewCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureData() {
        self.sections.append(.trainDetailsInformation)
        self.sections.append(.totalSeatsInformation)
        self.sections.append(.carsInformation)
        self.sections.append(.seatsInformation)
        
        self.viewModel.finalDestination = trainInformation.finalDestination
        self.viewModel.startFrom = trainInformation.startFrom
        self.viewModel.arrivingAt = trainInformation.arrivingAt
        self.viewModel.carCells = self.trainInformation.cars.compactMap({ trainCar in
            return CarCell(
                id: trainCar.id,
                isTapped: false,
                regularSeat: trainCar.regularSeat,
                prioritySeat: trainCar.prioritySeat,
                bicycleArea: trainCar.bicycleArea
            )
        })
        self.viewModel.carCells[0].isTapped = true
    }
    
    func printing() {
        for car in viewModel.carCells {
            print("Car \(car.id)\(car.isTapped ? " - isTapped" : "")")
            print("Regular Seat:", car.regularSeat)
            print("Priority Seat:", car.prioritySeat)
            print("Bicycle Area:", car.bicycleArea)
            print()
        }
    }
    
    // MARK: CREATE SECTION - static funcs
    
    static func createTrainDetailsInformationSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 358
        let cellHeight: CGFloat = 249
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth),
                heightDimension: .absolute(cellHeight)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(249)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    static func createTotalSeatsInformationSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 358
        let cellHeight: CGFloat = 65
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth),
                heightDimension: .absolute(cellHeight)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(cellHeight + 16 * 2)
            ),
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    static func createCarsInformationSection() -> NSCollectionLayoutSection {
        let cellWidth: CGFloat = 98
        let cellHeight: CGFloat = 40
        let horizontalPadding: CGFloat = 10
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(cellHeight)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -11)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth + horizontalPadding),
                heightDimension: .absolute(40 + 16)
            ),
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    static func createSeatsInformationSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(115)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(115)
            ),
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(29 + 16)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        return section
    }
    
    @objc func onClickBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: MQTT SETUPS
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    private func setupMQTT() {
        NotificationCenter.default.addObserver(self, selector: #selector(didActivate), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didEnterBackgroundNotification, object: nil)
        
        var connected: Bool = false
        
        let clientID = "CrowdFlow-App" + String(ProcessInfo().processIdentifier)

        mqtt = CocoaMQTT5(clientID: clientID, host: "broker.emqx.io", port: 1883)
        
        // will message topic and connection
        mqtt.willMessage = CocoaMQTT5Message(topic: "/will", string: "dieout")
        mqtt.keepAlive = 60
        
        connected = mqtt.connect()
        if connected {
            print("Connected to the broker")
        } else {
            print("Not connected to the broker")
        }
        
        mqtt.delegate = self
    }
    
    @objc func didActivate(){
        let _ = mqtt.connect()
    }
    
    // disconnect mqtt object when enters background
    @objc func didEnterBackground(){
        mqtt.disconnect()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

extension TrainInformationViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let pageSection = self.sections[section]
        switch pageSection {
        case .trainDetailsInformation:
            return 1
        case .totalSeatsInformation:
            return 1
        case .carsInformation:
            return 6
        case .seatsInformation:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let carViewModel: CarCell = viewModel.carCells.filter { carCell in
            return carCell.isTapped
        }.first!
        
        let section = self.sections[indexPath.section]
        switch section {
        case .trainDetailsInformation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainDetailsCollectionViewCell.identifier, for: indexPath) as! TrainDetailsCollectionViewCell
            cell.configure(id: self.id, viewModel: viewModel)
            return cell
        case .totalSeatsInformation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TotalSeatsCollectionViewCell.identifier, for: indexPath) as! TotalSeatsCollectionViewCell
            cell.configure(carViewModel: carViewModel)
            return cell
        case .carsInformation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarsCollectionViewCell.identifier, for: indexPath) as! CarsCollectionViewCell
            cell.configure(carViewModel: viewModel.carCells[indexPath.row])
            return cell
        case .seatsInformation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableSeatsCollectionViewCell.identifier, for: indexPath) as! AvailableSeatsCollectionViewCell
            cell.configure(carViewModel: carViewModel)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        switch section {
        case .carsInformation:
            var z = 0
            for carCell in viewModel.carCells {
                if z == indexPath.row {
                    carCell.isTapped = true
                } else {
                    carCell.isTapped = false
                }
                    
                z += 1
            }
            collectionView.reloadData()
            break
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = self.sections[indexPath.section]
        switch section {
        case .seatsInformation:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherSectionCollectionReusableView.identifier, for: indexPath) as! OtherSectionCollectionReusableView
            header.configure(text: "Available Seats")
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
