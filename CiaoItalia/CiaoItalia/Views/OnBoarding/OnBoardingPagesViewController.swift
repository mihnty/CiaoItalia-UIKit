import UIKit

class OnboardingPagesViewController: UIViewController {
    
    let isScreenWide = UIScreen.main.bounds.width > 405

    let stackView = UIStackView()
    let imageView = UIImageView()
    
    private let titleLabel: FuzzyFontLabel
    private let subtitleLabel: NormalFontLabel
    
    init(imageName: String, titleText: String, subtitleText: String, imageAccessibilityLabel: String) {
        self.titleLabel = FuzzyFontLabel(text: titleText, textStyle: isScreenWide ? .largeTitle : .title1, textColor: .darkGrey)
        self.subtitleLabel = NormalFontLabel(text: subtitleText, textStyle: isScreenWide ? .largeTitle : .body, textColor: .darkGrey, textWeight: .medium)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.isAccessibilityElement = true
        self.imageView.accessibilityLabel = imageAccessibilityLabel

        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingPagesViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
    }
        
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

        ])
        
        if (isScreenWide) {
            NSLayoutConstraint.activate([
                               
                imageView.widthAnchor.constraint(equalToConstant: 700),
                imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -240),
                
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 80),

            ])
        } else {
            NSLayoutConstraint.activate([

                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -20),

                
                imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
                imageView.widthAnchor.constraint(equalToConstant: 270),
                imageView.heightAnchor.constraint(equalToConstant: 300),
//                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

//                imageView.widthAnchor.constraint(equalToConstant: 200),

            ])
        }
    }
}

#Preview {
//    OnboardingPagesViewController(
//        imageName: "polaroid1",
//        titleText: "Cada página traz uma nova situação",
//        subtitleText: "Vivencie desafios reais de viagem e aprenda expressões para guardar na memória."
//    )
    OnBoardingMainViewController()
}

