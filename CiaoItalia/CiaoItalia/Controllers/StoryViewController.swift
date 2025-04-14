//
//  ContentViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 08/04/25.
//
import UIKit

class StoryViewController: UIViewController, ContentDelegate {
    lazy var headerImage = UIImageView()
  
    lazy var titleLabel = UILabel()
    lazy var repertoryVC = RepertoryViewController()
    var words: [any ContentType] = []
    lazy var segmentedControl = UISegmentedControl(items: ["Repertório", "Diálogo"])
    lazy var backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
    }()
    init(content:[any ContentType]) {
        super.init(nibName: nil, bundle: nil)
        self.words = content
        if let header = content.first?.header, let title = content.first?.title {
            headerImage.image = UIImage(named: header)
            titleLabel = FuzzyFontLabel(text: title, textStyle: .largeTitle)
            
        } else {
            print("content está vazio")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        repertoryVC.delegate = self
        addChild(repertoryVC)
        view.addSubview(repertoryVC.view)
        repertoryVC.view.translatesAutoresizingMaskIntoConstraints = false
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        setupView()
        repertoryVC.didMove(toParent: self)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor),
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            repertoryVC.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            repertoryVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            repertoryVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            repertoryVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        repertoryVC.setupConstraints()
    }
    func setupView(){
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGray6.withAlphaComponent(0.2)
        segmentedControl.selectedSegmentTintColor =  UIColor(named: "background")
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(changeTableView(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        titleLabel.textColor = UIColor(named: "textColor")
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false 
        view.addSubview(titleLabel)
        //setar a fonte
    }
    
    @objc func changeTableView(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            repertoryVC.view.isHidden = false
        case 1:
            repertoryVC.view.gisHidden = true
        default:
            print("algo deu errado")
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("tableView frame: \(repertoryVC.view.frame)")
    }

}

  

#Preview {
    StoryViewController(content:Food.allCases)
}
