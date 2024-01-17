//
//  OnboardingViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let numberOfItems = 5
    let contents = [
        OnboardingContent(imageString: "onboarding-0", title: "Welcome to a Seamless Journey with MRT-J App", subTitle: "Experience a new level of convenience, comfort, and efficiency as you embark on your daily commute with MRT Jakarta"),
        OnboardingContent(imageString: "onboarding-1", title: "Book Your MRT Jakarta Ride with Ease", subTitle: "Say goodbye to long queues and waiting times, and say hello to convenient and efficient booking right at your fingertips."),
        OnboardingContent(imageString: "onboarding-2", title: "Embark on an Unforgettable Journey with the MRT-J App", subTitle: "Discover a whole new way to explore the vibrant city of Jakarta and create unforgettable memories along the way.")
    ]
    
    var currentPageIdx: Int = 0
    
    let logoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    let button = PrimaryButton(text: "Next")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLogoStackView()
        setupCollectionView()
        setupPageControl()
        setupButton()
    }
    
    private func setupLogoStackView() {
        view.addSubview(logoStackView)
        
        logoStackView.alignment = .center
        logoStackView.spacing = 12.7 - 4
        
        let logo1_imageView = UIImageView(image: UIImage(named: "mrtjakarta"))
        let logo2_imageView = UIImageView(image: UIImage(named: "jaklingko"))
        
        logo1_imageView.contentMode = .scaleAspectFill
        logo2_imageView.contentMode = .scaleAspectFill
        
        logo1_imageView.frame.size = CGSize(width: 125.72, height: 35.51)
        logo2_imageView.frame.size = CGSize(width: 49.38, height: 49.38)
        
        logoStackView.addArrangedSubview(logo1_imageView)
        logoStackView.addArrangedSubview(logo2_imageView)
        
        logo1_imageView.translatesAutoresizingMaskIntoConstraints = false
        logo2_imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75 - 5),
            logoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoStackView.widthAnchor.constraint(equalToConstant: 188),
            logoStackView.heightAnchor.constraint(equalToConstant: 49),
            
            logo1_imageView.leadingAnchor.constraint(equalTo: logoStackView.leadingAnchor),
            logo1_imageView.centerYAnchor.constraint(equalTo: logoStackView.centerYAnchor),
            logo1_imageView.widthAnchor.constraint(equalToConstant: logo1_imageView.width),
            logo1_imageView.heightAnchor.constraint(equalToConstant: logo1_imageView.height),
            
            logo2_imageView.trailingAnchor.constraint(equalTo: logoStackView.trailingAnchor),
            logo2_imageView.centerYAnchor.constraint(equalTo: logoStackView.centerYAnchor),
            logo2_imageView.widthAnchor.constraint(equalToConstant: logo2_imageView.width),
            logo2_imageView.heightAnchor.constraint(equalToConstant: logo2_imageView.height),
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: logoStackView.bottomAnchor, constant: 19.62 + 5),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupPageControl() {
        view.addSubview(pageControl)
        
        pageControl.backgroundColor = .white
        pageControl.numberOfPages = self.contents.count
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = .customWhite
        pageControl.currentPageIndicatorTintColor = .darkBlue2
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 17 + 3),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 11),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func setupButton() {
        view.addSubview(button)
        
        button.delegate = self
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 63 - 3),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: button.width),
            button.heightAnchor.constraint(equalToConstant: button.height),
        ])
    }

}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(content: contents[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.currentPageIdx = Int(floorf(Float(scrollView.contentOffset.x) / Float(self.collectionView.width)))
        pageControl.currentPage = currentPageIdx
    }
    
}

extension OnboardingViewController: PrimaryButtonDelegate {
    
    func buttonTapped() {
        
        if self.currentPageIdx != self.contents.count - 1 {
            self.currentPageIdx += 1
            
            collectionView.setContentOffset(CGPoint(x: CGFloat(self.currentPageIdx) * self.collectionView.width, y: 0), animated: true)
        } else {
            UserDefaults.standard.setValue(true, forKey: "didSeeOnboardingPage")
            let vc = MainPageViewController()
            vc.modalPresentationStyle = .fullScreen

            self.present(vc, animated: true)
        }
    }
    
}
