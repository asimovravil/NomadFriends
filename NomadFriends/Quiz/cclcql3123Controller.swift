//
//  QuizViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

final class cclcql3123Controller: UIViewController {
                    
    var quizAk = UIImageView()
    var answeredQuestionsCountQuiz = 0
    var friends: [FriendInfo] = []
    var currentPlayerIndex: Int = 0
    var selectedLevelIndex: Int?
    var countLabelQuiz = UILabel()
    var tableViewQuiz = UITableView(frame: .zero, style: .plain)
    var roundImageQuiz = UIImageView()
    
    var stackView = UIStackView()
    var friend1Image = UIImageView()
    var friend2Image = UIImageView()
    var friend3Image = UIImageView()
    var friend4Image = UIImageView()
    var friend5Image = UIImageView()
    var friend6Image = UIImageView()
    
    var friend1Label = UILabel()
    var friend2Label = UILabel()
    var friend3Label = UILabel()
    var friend4Label = UILabel()
    var friend5Label = UILabel()
    var friend6Label = UILabel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cdqdwwqw53253()
        vxmvcxnvmv21241()
        dadada321321()
    }
    
    func vnjfdvjdv12123(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func xgasgxasxsaxs231312(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func cnxzczdwqqqwqd1212(withImageView imageView: UIImageView, andLabel label: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func asxaxaxsa12131231(with currentQuestion: Int, totalQuestions: Int) {
        countLabelQuiz.text = "\(currentQuestion)/\(totalQuestions)"
    }
    
    func cascascbj12312323(correctly: Bool) {
        if correctly {
            friends[currentPlayerIndex].score += 1
        }
        
        currentPlayerIndex = (currentPlayerIndex + 1) % friends.count
        tableViewQuiz.reloadData()

        answeredQuestionsCountQuiz += 1

        if answeredQuestionsCountQuiz >= 10 {
            netnetnetnetn2424()
        }
    }

    private func netnetnetnetn2424() {
        let controller = gerge4312414214ViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func dadada321321() {
        let labelImagePairs = [
            (friend1Label, friend1Image),
            (friend2Label, friend2Image),
            (friend3Label, friend3Image),
            (friend4Label, friend4Image),
            (friend5Label, friend5Image),
            (friend6Label, friend6Image)
        ]

        let maxPlayers = min(friends.count, 6)

        for (index, pair) in labelImagePairs.enumerated() {
            if index < maxPlayers {
                let friend = friends[index]
                pair.0.text = friend.name
                let imageName = friend.imageName.isEmpty ? "friend1" : friend.imageName
                pair.1.image = UIImage(named: imageName)
                pair.0.isHidden = false
                pair.1.isHidden = false
            } else {
                vnjfdvjdv12123(pair.0, withText: "Friend")
                xgasgxasxsaxs231312(pair.1, withImageName: "friend1")
            }
        }
    }
}

extension cclcql3123Controller {
    func cdqdwwqw53253() {
        quizAk.image = UIImage(named: "backgroundFootball")
        quizAk.layer.masksToBounds = true
        quizAk.contentMode = .scaleAspectFill
        quizAk.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quizAk)
        
        xgasgxasxsaxs231312(friend1Image, withImageName: "friend1")
        xgasgxasxsaxs231312(friend2Image, withImageName: "friend2")
        xgasgxasxsaxs231312(friend3Image, withImageName: "friend3")
        xgasgxasxsaxs231312(friend4Image, withImageName: "friend4")
        xgasgxasxsaxs231312(friend5Image, withImageName: "friend5")
        xgasgxasxsaxs231312(friend6Image, withImageName: "friend6")
        
        vnjfdvjdv12123(friend1Label, withText: "Jane")
        vnjfdvjdv12123(friend2Label, withText: "Jack")
        vnjfdvjdv12123(friend3Label, withText: "Steven")
        vnjfdvjdv12123(friend4Label, withText: "Mary")
        vnjfdvjdv12123(friend5Label, withText: "Stefani")
        vnjfdvjdv12123(friend6Label, withText: "Mike")
        
        let friend1Stack = cnxzczdwqqqwqd1212(withImageView: friend1Image, andLabel: friend1Label)
        let friend2Stack = cnxzczdwqqqwqd1212(withImageView: friend2Image, andLabel: friend2Label)
        let friend3Stack = cnxzczdwqqqwqd1212(withImageView: friend3Image, andLabel: friend3Label)
        let friend4Stack = cnxzczdwqqqwqd1212(withImageView: friend4Image, andLabel: friend4Label)
        let friend5Stack = cnxzczdwqqqwqd1212(withImageView: friend5Image, andLabel: friend5Label)
        let friend6Stack = cnxzczdwqqqwqd1212(withImageView: friend6Image, andLabel: friend6Label)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(friend1Stack)
        stackView.addArrangedSubview(friend2Stack)
        stackView.addArrangedSubview(friend3Stack)
        stackView.addArrangedSubview(friend4Stack)
        stackView.addArrangedSubview(friend5Stack)
        stackView.addArrangedSubview(friend6Stack)
        view.addSubview(stackView)
        
        tableViewQuiz.register(mnmnbnfn41233TableViewCell.self, forCellReuseIdentifier: mnmnbnfn41233TableViewCell.id)
        tableViewQuiz.dataSource = self
        tableViewQuiz.delegate = self
        tableViewQuiz.backgroundColor = .clear
        tableViewQuiz.rowHeight = 730
        tableViewQuiz.showsVerticalScrollIndicator = false
        tableViewQuiz.separatorStyle = .none
        tableViewQuiz.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewQuiz)
        
        roundImageQuiz.image = UIImage(named: "round1")
        roundImageQuiz.layer.masksToBounds = true
        roundImageQuiz.contentMode = .scaleAspectFill
        roundImageQuiz.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            quizAk.topAnchor.constraint(equalTo: view.topAnchor),
            quizAk.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizAk.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizAk.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableViewQuiz.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewQuiz.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewQuiz.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewQuiz.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
    
    private func vxmvcxnvmv21241() {
        let titleLabel = UILabel()
        titleLabel.text = "Question"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImageQuiz)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension cclcql3123Controller: UITableViewDataSource, UITableViewDelegate, QuizTableViewCellDelegatedqwdq12421421421 {
    func didAnswerQuestionADdwdkDKdLoh(correctAnswers: Int) {
        friends[currentPlayerIndex].score = correctAnswers
        currentPlayerIndex = (currentPlayerIndex + 1) % friends.count
        tableViewQuiz.reloadData()

        answeredQuestionsCountQuiz += 1

        if answeredQuestionsCountQuiz >= 10 {
            netnetnetnetn2424()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: mnmnbnfn41233TableViewCell.id, for: indexPath) as? mnmnbnfn41233TableViewCell else {
            fatalError("Could not cast to QuizTableViewCell")
        }
        cell.navigationControllerQuizChponk = self.navigationController
        cell.quizViewController = self
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
