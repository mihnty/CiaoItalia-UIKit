//
//  ExpressionsViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//

import UIKit
// import Speech

class ExpressionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate/*, SFSpeechRecognizerDelegate*/ {

    var expressions: Expressions
    var filteredExpressions: [ExpressionInfo]
    var isRecording = false
    private let bgPracticeVC = PracticeBackgroundViewController()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mediumGray
        label.textAlignment = .left
        return label
    }()

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    /*
    var speechRecognizer: SFSpeechRecognizer?
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    var audioEngine: AVAudioEngine?
    */

    init(expressions: Expressions){
        self.expressions = expressions
        self.filteredExpressions = expressions.expressionList
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExpressions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = filteredExpressions[indexPath.row]
        guard let cell = expressionsTableView.dequeueReusableCell(withIdentifier: WordCardCell.identifier, for: indexPath ) as? WordCardCell else {
            return UITableViewCell()
        }
        cell.configure(with: line)
        return cell
    }

    lazy var expressionsTableView: UITableView = {
        let expressionsTableView = UITableView()
        expressionsTableView.translatesAutoresizingMaskIntoConstraints = false
        expressionsTableView.dataSource = self
        expressionsTableView.delegate = self
        expressionsTableView.register(WordCardCell.self, forCellReuseIdentifier: WordCardCell.identifier)
        return expressionsTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .mediumGray
        setup()
        // setupSpeechRecognition()
    }

    private func setup() {
        setupBg()
        setupTitle()
        setupSearchBar()
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
    }

    func setupBg() {
        addChild(bgPracticeVC)
        view.addSubview(bgPracticeVC.view)
        bgPracticeVC.view.translatesAutoresizingMaskIntoConstraints = false
        bgPracticeVC.didMove(toParent: self)
    }

    private func setupTitle() {
        let titleFont = FuzzyFontLabel(text: expressions.title, textStyle: .title1)
        titleLabel.font = titleFont.font
        titleLabel.text = expressions.title
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        //searchBar.showsBookmarkButton = true
        //searchBar.setImage(UIImage(systemName: "mic.fill"), for: .bookmark, state: .normal)
        searchBar.delegate = self
    }

    private func setupViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(expressionsTableView)
    }

    private func setupViewAttributes() {
        view.backgroundColor = .clear
        expressionsTableView.backgroundColor = .clear
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),

            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),

            expressionsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            expressionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expressionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expressionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if query.isEmpty {
            filteredExpressions = expressions.expressionList
        } else {
            filteredExpressions = expressions.expressionList.filter { line in
                line.italian.localizedCaseInsensitiveContains(query)
                || line.keywords.contains { $0.localizedCaseInsensitiveContains(query) }
            }
        }
        expressionsTableView.reloadData()
    }

    /*
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if isRecording {
            stopVoiceSearch()
        } else {
            startVoiceSearch()
        }
        isRecording.toggle()
        updateMicIcon()
    }

    private func setupSpeechRecognition() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.speechRecognizer = SFSpeechRecognizer()
                    self.speechRecognizer?.delegate = self
                default:
                    print("Speech recognition authorization denied.")
                }
            }
        }
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if isRecording {
            stopVoiceSearch()
        } else {
            startVoiceSearch()
        }
        isRecording.toggle()
        updateMicIcon()
    }

    private func startVoiceSearch() {
        searchBar.resignFirstResponder()
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        audioEngine = AVAudioEngine()
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let inputNode = audioEngine?.inputNode else { return }
        guard let recognitionRequest = recognitionRequest else { return }
        recognitionRequest.shouldReportPartialResults = true
        speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            if let result = result {
                self.searchBar.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
            }
            if isFinal {
                self.audioEngine?.stop()
                inputNode.removeTap(onBus: 0)
            }
        }
        let format = inputNode.inputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine?.prepare()
        try? audioEngine?.start()
    }

    private func stopVoiceSearch(){
        recognitionTask?.cancel()
        recognitionTask = nil
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        recognitionRequest = nil
        audioEngine = nil
    }

    private func updateMicIcon() {
        let micColor: UIColor = isRecording ? .systemRed : .label
        if let micImage = UIImage(systemName: "mic.fill")?.withTintColor(micColor, renderingMode: .alwaysOriginal) {
            searchBar.setImage(micImage, for: .bookmark, state: .normal)
        }
    }
    */
}

#Preview {
    ExpressionsViewController(expressions: FirstWords())
}
