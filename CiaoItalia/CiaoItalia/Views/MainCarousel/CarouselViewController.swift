//
//  MainCarouselView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 07/04/25.
//

import UIKit

protocol MainCarouselCardViewDelegate: AnyObject {
    func mainCarouselCardViewDidTap(_ cell: MainCarouselCardView)
}

class CarouselViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MainCarouselCardViewDelegate {
    
    private let items = [("squareImageTest", "Title 1"),
                         ("squareImageTest", "Title 2"),
                         ("squareImageTest", "Title 3")]
    
    let isScreenWide = UIScreen.main.bounds.width > 405
    private var currentIndex: Int = 0
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "MainScreenLeftArrow")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapLeft), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "MainScreenRightArrow")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapRight), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = items.count
        pc.currentPage = 0
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.dotDetail
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.allowsSelection = false
        cv.register(MainCarouselCardView.self, forCellWithReuseIdentifier: "CarouselCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.addSubview(leftArrowButton)
        view.addSubview(rightArrowButton)
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            leftArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            rightArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: isScreenWide ? 250.0 : 210.0)
        ])
    }
    
    @objc private func didTapLeft() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }
    
    @objc private func didTapRight() {
        guard currentIndex < items.count - 1 else { return }
        currentIndex += 1
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cardWidth = view.bounds.width * 0.9
        let horizontalInset = (view.bounds.width - cardWidth) / 2
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! MainCarouselCardView
        let (imageName, title) = items[indexPath.item]
        cell.configure(withImageName: imageName, title: title)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardWidth = view.bounds.width * 0.9
        let cardHeight = cardWidth * 1.3
        return CGSize(width: cardWidth, height: cardHeight)
    }
    
    
    func mainCarouselCardViewDidTap(_ cell: MainCarouselCardView) {
        let mockVC = MockViewController()
        
        if let navController = self.navigationController {
            navController.pushViewController(mockVC, animated: true)
        } else {
            mockVC.modalPresentationStyle = .fullScreen
            present(mockVC, animated: true, completion: nil)
        }
    }
}


#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}
