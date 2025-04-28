import UIKit

class DemoViewController: UIPageViewController {

    let isScreenWide = UIScreen.main.bounds.width > 440
    
    var pages = [UIViewController]()

    let nextButton = UIButton()
    let backButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    var backButtonBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
}

extension DemoViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

        let page1 = OnboardingPagesViewController(imageName: "polaroid1", titleText: "Cada página traz uma nova situação", subtitleText: "Vivencie desafios reais de viagem e aprenda expressões para guardar na memória.", imageAccessibilityLabel: "Polaroid Meu Diário de Viagem")
        let page2 = OnboardingPagesViewController(imageName: "polaroid2", titleText: "Seu diário revela momentos únicos", subtitleText: "Explore o idioma em experiências autênticas e fale como um verdadeiro local.", imageAccessibilityLabel: "Polaroids Edificios na Cidade e Cafeteria")
        let page3 = OnboardingPagesViewController(imageName: "polaroid3", titleText: "Escute o idioma ganhando vida", subtitleText: "O italiano ganha vida quando você escuta, explora e sente cada palavra.\nÉ hora de abrir seu diário de viagem!", imageAccessibilityLabel: "Polaroid Mesa com Pratos de Comida")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .darkGrey
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.darkGrey, for: .normal)
        nextButton.layer.cornerRadius = 12
        nextButton.setTitle("Avançar", for: .normal)
        nextButton.backgroundColor = .mustard.withAlphaComponent(0.5)
        nextButton.layer.borderColor = UIColor.darkYellow.cgColor
        nextButton.layer.borderWidth = 2
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        nextButton.accessibilityTraits = .button
        nextButton.accessibilityIdentifier = "Botão de onboarding"
        nextButton.accessibilityHint = "Toque para interagir"
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitleColor(.darkGrey, for: .normal)
        backButton.layer.cornerRadius = 12
        backButton.setTitle("Voltar", for: .normal)
        backButton.accessibilityTraits = .button
        backButton.accessibilityLabel = "Botão de voltar página"
        backButton.accessibilityIdentifier = "Botão de onboarding"
        backButton.accessibilityHint = "Toque para interagir"
        backButton.backgroundColor = .mustard.withAlphaComponent(0.5)
        backButton.layer.borderColor = UIColor.darkYellow.cgColor
        backButton.layer.borderWidth = 2
        backButton.addTarget(self, action: #selector(backTapped(_:)), for: .primaryActionTriggered)
        
        if isScreenWide {
            nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .medium)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        } else {
            nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
    }
    
    func layout() {
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor,constant: 24),
            
            view.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 24),
            view.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 24),
            
            view.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: -24),
        ])
        
        backButtonBottomAnchor = view.bottomAnchor.constraint(equalTo: backButton.bottomAnchor, constant: -90)
        backButtonBottomAnchor?.isActive = true
        
        
        if isScreenWide {
                NSLayoutConstraint.activate([
                    nextButton.widthAnchor.constraint(equalToConstant: 160),
                    nextButton.heightAnchor.constraint(equalToConstant: 60),
                    backButton.widthAnchor.constraint(equalToConstant: 160),
                    backButton.heightAnchor.constraint(equalToConstant: 60)
                ])
        } else {
            NSLayoutConstraint.activate([
                nextButton.widthAnchor.constraint(equalToConstant: 90),
                nextButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 90),
                backButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
    }
}

// MARK: - DataSource

extension DemoViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return nil               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return nil              // wrap first
        }
    }
}

// MARK: - Delegates

extension DemoViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
        animateControlsIfNeeded()
    }
    
    private func animateControlsIfNeeded() {
        let lastPage = pageControl.currentPage == pages.count - 1
        let firstPage = pageControl.currentPage == 0
        
        if lastPage {
            nextButton.setTitle("Continuar", for: .normal)
            nextButton.accessibilityLabel = "Botão de continuar"

        } else {
            nextButton.setTitle("Avançar", for: .normal)
            nextButton.accessibilityLabel = "Botão de avançar página"

        }
        
        if firstPage {
            hideControls()
        } else {
            showControls()
        }
        
        self.view.layoutIfNeeded()

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    private func hideControls() {
        backButtonBottomAnchor?.constant = -90
        }

        private func showControls() {
            backButtonBottomAnchor?.constant = 24
        }
    
}

// MARK: - Actions

extension DemoViewController {
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlsIfNeeded()
    }
    
    @objc func nextTapped(_ sender: UIButton) {
        if pageControl.currentPage == pages.count - 1 {
            let nextVC = UINavigationController(rootViewController: CarouselContainerViewController())
            nextVC.modalPresentationStyle = .fullScreen
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = .moveIn
            transition.subtype = .fromRight
            view.window!.layer.add(transition, forKey: kCATransition)
            UserDefaults.standard.hasBoarded = true
            present(nextVC, animated: false, completion: nil)
        } else {
            pageControl.currentPage += 1
            goToNextPage()
            animateControlsIfNeeded()
        }
    }
    
    @objc func backTapped(_ sender: UIButton) {
        if pageControl.currentPage > 0 {
            pageControl.currentPage -= 1
            goToPreviousPage()
            animateControlsIfNeeded()
        }
    }

}

// MARK: - Extensions

extension UIPageViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
        }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .reverse, animated: animated, completion: completion)
    }
}

#Preview {
//    OnBoardingMainViewController()
    DemoViewController()
}
