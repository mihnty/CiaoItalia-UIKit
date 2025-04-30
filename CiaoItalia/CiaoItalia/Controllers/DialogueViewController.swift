import UIKit

class DialogueViewController: UIViewController,
                              UITableViewDataSource,
                              UITableViewDelegate,
                              SpeechManagerDelegate {
    var dialogue: [DialogueItem]
    var isAudioPlaying = false
    private var currentSpeaking: IndexPath?

    init(dialogue: [DialogueItem]) {
        self.dialogue = dialogue
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        SpeechManager.shared.delegate = self
        setupTableView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dialogue.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dialogue[indexPath.row]
        switch item {
        case .title(let text):
            guard let cell = dialogueTableView.dequeueReusableCell(
                withIdentifier: TitleCell.identifier,
                for: indexPath
            ) as? TitleCell else {
                return UITableViewCell()
            }
            cell.configure(with: text)
            return cell

        case .dialogue(let line):
            guard let cell = dialogueTableView.dequeueReusableCell(
                withIdentifier: DialogueCell.identifier,
                for: indexPath
            ) as? DialogueCell else {
                return UITableViewCell()
            }
            cell.configure(with: line)
            cell.setPlayable(!isAudioPlaying)
            if indexPath == currentSpeaking && isAudioPlaying {
                cell.setSpeakingOn()
            } else {
                cell.setSpeakingOff()
            }
            return cell

        case .end(let text):
            guard let cell = dialogueTableView.dequeueReusableCell(
                withIdentifier: EndCell.identifier,
                for: indexPath
            ) as? EndCell else {
                return UITableViewCell()
            }
            cell.configure(with: text)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case .dialogue(let line) = dialogue[indexPath.row] else { return }
        SpeechManager.shared.speak(line.italian, indexPath: indexPath)
    }

    func startSpeech() {
        isAudioPlaying = true
        if let ip = SpeechManager.shared.indexPath {
            changeWhoIsSpeaking(indexPath: ip)
        }
        reloadAllCells()
    }

    func changeWhoIsSpeaking(indexPath: IndexPath) {
        if let old = currentSpeaking,
           let oldCell = dialogueTableView.cellForRow(at: old) as? DialogueCell {
            oldCell.setSpeakingOff()
        }
        if let newCell = dialogueTableView.cellForRow(at: indexPath) as? DialogueCell {
            newCell.setSpeakingOn()
        }
        currentSpeaking = indexPath
    }

    func finishSpeech() {
        isAudioPlaying = false
        if let ip = currentSpeaking,
           let cell = dialogueTableView.cellForRow(at: ip) as? DialogueCell {
            cell.setSpeakingOff()
        }
        currentSpeaking = nil
        reloadAllCells()
    }

    private lazy var dialogueTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        tv.register(DialogueCell.self, forCellReuseIdentifier: DialogueCell.identifier)
        tv.register(EndCell.self, forCellReuseIdentifier: EndCell.identifier)
        return tv
    }()

    private func setupTableView() {
        view.addSubview(dialogueTableView)
        view.backgroundColor = .clear
        dialogueTableView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            dialogueTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            dialogueTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dialogueTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dialogueTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func reloadAllCells() {
        dialogueTableView.visibleCells.forEach { cell in
            if let c = cell as? DialogueCell,
               let ip = dialogueTableView.indexPath(for: c) {
                c.setPlayable(!isAudioPlaying)
                if ip == currentSpeaking && isAudioPlaying {
                    c.setSpeakingOn()
                } else {
                    c.setSpeakingOff()
                }
            }
        }
    }
}

#Preview{
    UINavigationController(rootViewController: CarouselContainerViewController())
}
