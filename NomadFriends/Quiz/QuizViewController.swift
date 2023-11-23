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
        
        setupViews()
        setupNavigationBar()
        setupFriendLabelsAndImages()
    }
    
    func setupLabel(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func setupImageView(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createVerticalStackView(withImageView imageView: UIImageView, andLabel label: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

        if answeredQuestionsCount >= 1 {
            navigateToLeaderboard()
        }
    }

    private func navigateToLeaderboard() {
        let controller = BonusViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupFriendLabelsAndImages() {
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
                setupLabel(pair.0, withText: "Friend")
                setupImageView(pair.1, withImageName: "friend1")
            }
        }
    }
}

extension QuizViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        setupImageView(friend1Image, withImageName: "friend1")
        setupImageView(friend2Image, withImageName: "friend2")
        setupImageView(friend3Image, withImageName: "friend3")
        setupImageView(friend4Image, withImageName: "friend4")
        setupImageView(friend5Image, withImageName: "friend5")
        setupImageView(friend6Image, withImageName: "friend6")
        
        setupLabel(friend1Label, withText: "Jane")
        setupLabel(friend2Label, withText: "Jack")
        setupLabel(friend3Label, withText: "Steven")
        setupLabel(friend4Label, withText: "Mary")
        setupLabel(friend5Label, withText: "Stefani")
        setupLabel(friend6Label, withText: "Mike")
        
        let friend1Stack = createVerticalStackView(withImageView: friend1Image, andLabel: friend1Label)
        let friend2Stack = createVerticalStackView(withImageView: friend2Image, andLabel: friend2Label)
        let friend3Stack = createVerticalStackView(withImageView: friend3Image, andLabel: friend3Label)
        let friend4Stack = createVerticalStackView(withImageView: friend4Image, andLabel: friend4Label)
        let friend5Stack = createVerticalStackView(withImageView: friend5Image, andLabel: friend5Label)
        let friend6Stack = createVerticalStackView(withImageView: friend6Image, andLabel: friend6Label)
        
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

        if answeredQuestionsCount >= 1 {
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
