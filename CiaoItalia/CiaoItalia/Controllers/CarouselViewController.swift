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
    
    private let realItems = [("caffetteria", "ida ao café", "Polaroid cafeteria"),
                         ("suitcase", "arrumando a mala", "Polaroid aberta com roupas dentro"),
                         ("trainStation", "pegando o trem", "Polaroid plataforma de trem"),
                         ("hotel", "no hotel", "Polaroid fachada de hotel"),
                         ("city", "turistando", "Polaroid de edifícios"),
                         ("restaurant", "almoço pela rua", "Polaroid de mesa com comidas"),
    ] as [(String,String,String)]
    
    private lazy var items: [(String,String,String)] = {
      var copy = realItems
      copy.insert(realItems.last!, at: 0)
      copy.append(realItems.first!)
      return copy
    }()
    private let contents: [any ContentType.Type] = [Coffee.self, Suitcase.self, Train.self, Hotel.self, Touristing.self, Food.self]
    let isScreenWide = UIScreen.main.bounds.width > 405
    private var currentIndex: Int = 1
    
    private let arrowSize: CGFloat = 64
        
    private lazy var leftArrowButton: UIButton  = makeArrowButton(direction: .left, buttonAccessibilityLabel: "Botão de voltar polaroid para esquerda")
   
        
    private lazy var rightArrowButton: UIButton = makeArrowButton(direction: .right, buttonAccessibilityLabel: "Botão de passar polaroid para direita")
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = realItems.count
        pc.currentPage  = 0
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
            leftArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: isScreenWide ? 60 : 16),
            
            rightArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: isScreenWide ? -60 : -16),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: isScreenWide ? 340.0 : 210.0)
        ])
        
        if(isScreenWide){
            NSLayoutConstraint.activate([
                rightArrowButton.widthAnchor.constraint(equalToConstant: arrowSize),
                rightArrowButton.heightAnchor.constraint(equalTo: rightArrowButton.widthAnchor),
                
                leftArrowButton.widthAnchor.constraint(equalToConstant: arrowSize),
                leftArrowButton.heightAnchor.constraint(equalTo: rightArrowButton.widthAnchor),
            ])
        }
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      if collectionView.contentOffset.x == 0 {
        let ip = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: ip, at: .centeredHorizontally, animated: false)
        pageControl.currentPage = currentIndex - 1
      }
    }
    
    private func setArrowButtonsEnabled(_ enabled: Bool) {
        leftArrowButton.isEnabled  = enabled
        rightArrowButton.isEnabled = enabled
        let alpha: CGFloat = enabled ? 1.0 : 0.5
        leftArrowButton.alpha  = alpha
        rightArrowButton.alpha = alpha
    }
    
    @objc func didTapLeft() {
        guard leftArrowButton.isEnabled else { return }
        setArrowButtonsEnabled(false)
        currentIndex -= 1
        
        let ip = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: ip, at: .centeredHorizontally, animated: true)
        if currentIndex == 0 {
            currentIndex = realItems.count
            let jump = IndexPath(item: currentIndex, section: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.collectionView.scrollToItem(at: jump, at: .centeredHorizontally, animated: false)
            }
        }
        pageControl.currentPage = (currentIndex - 1) % realItems.count
    }

    @objc func didTapRight() {
        guard rightArrowButton.isEnabled else { return }
        setArrowButtonsEnabled(false)
        currentIndex += 1
        
        let ip = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: ip, at: .centeredHorizontally, animated: true)
        if currentIndex == items.count - 1 {
            currentIndex = 1
            let jump = IndexPath(item: currentIndex, section: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.collectionView.scrollToItem(at: jump, at: .centeredHorizontally, animated: false)
            }
        }
        pageControl.currentPage = (currentIndex - 1) % realItems.count
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        setArrowButtonsEnabled(true)
    }
    
    private func makeArrowButton(direction: ArrowDirection, buttonAccessibilityLabel: String) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        if let img = UIImage(named: direction.imageName) {
            btn.setImage(img, for: .normal)
        }
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment   = .fill
        btn.addTarget(self, action: direction.action, for: .touchUpInside)
        btn.accessibilityLabel = buttonAccessibilityLabel
        btn.accessibilityTraits = .button
        btn.accessibilityIdentifier = "Botão do carrossel de imagens"
        btn.accessibilityHint = "Toque para interagir"
        return btn
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
        let (imageName, title, label) = items[indexPath.item]
        cell.configure(withImageName: imageName, title: title, label: label)
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
        guard leftArrowButton.isEnabled && rightArrowButton.isEnabled else { return }
        let mockVC = MockViewController()
        let content = contents[currentIndex - 1]
        print(content.self)
        if let navController = self.navigationController {
            navController.pushViewController(StoryViewController(content: content.allCases as! [any ContentType]), animated: true)
        } else {
            mockVC.modalPresentationStyle = .fullScreen
            present(mockVC, animated: true, completion: nil)
        }
    }
}


#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}
