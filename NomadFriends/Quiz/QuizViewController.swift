//
//  QuizViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

final class QuizViewController: UIViewController {
                
    var backgroundView = UIImageView()
    var answeredQuestionsCount = 0
    var friends: [FriendInfo] = []
    var currentPlayerIndex: Int = 0
    var selectedLevelIndex: Int?
    var countLabel = UILabel()
    var tableView = UITableView(frame: .zero, style: .plain)
    var roundImage = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    func updateCountLabel(with currentQuestion: Int, totalQuestions: Int) {
        countLabel.text = "\(currentQuestion)/\(totalQuestions)"
    }
    
    func didAnswerQuestion(correctly: Bool) {
        if correctly {
            friends[currentPlayerIndex].score += 1
        }
        
        currentPlayerIndex = (currentPlayerIndex + 1) % friends.count
        tableView.reloadData()

        answeredQuestionsCount += 1

        if answeredQuestionsCount == 10 {
            navigateToLeaderboard()
        }
    }

    private func navigateToLeaderboard() {
        
    }
}

extension QuizViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        tableView.register(QuizTableViewCell.self, forCellReuseIdentifier: QuizTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 730
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        roundImage.image = UIImage(named: "round1")
        roundImage.layer.masksToBounds = true
        roundImage.contentMode = .scaleAspectFill
        roundImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Question"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImage)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension QuizViewController: UITableViewDataSource, UITableViewDelegate, QuizTableViewCellDelegate {
    func didAnswerQuestion(correctAnswers: Int) {
        friends[currentPlayerIndex].score = correctAnswers
        currentPlayerIndex = (currentPlayerIndex + 1) % friends.count
        tableView.reloadData()

        answeredQuestionsCount += 1

        if answeredQuestionsCount == 10 {
            navigateToLeaderboard()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizTableViewCell.id, for: indexPath) as? QuizTableViewCell else {
            fatalError("Could not cast to QuizTableViewCell")
        }
        cell.navigationController = self.navigationController
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
