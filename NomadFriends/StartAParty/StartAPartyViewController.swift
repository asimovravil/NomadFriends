//
//  StartAPartyViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

final class StartAPartyViewController: UIViewController {

    var partyStart = UIImageView()
    var numberOfPlayers = 2
    var numberOfFriendsAmount = 2
    
    var startAPartyButton = UIButton()
    var tableView = UITableView(frame: .zero, style: .plain)
    var numberFriendsLabel = UILabel()
    var minusButton = UIButton()
    var amountFriends = UILabel()
    var plusButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(playerNameChanged), name: NSNotification.Name("PlayerNameChanged"), object: nil)
        setupGoStartViews()
        setupGoStartNavigationBar()
    }
    
    @objc func playerNameChanged() {
        startAPartyButton.isEnabled = validatePlayerNames()
    }
    
    @objc func minusButtonPressed() {
        numberOfPlayers -= 1
        numberOfFriendsAmount -= 1
        tableView.reloadData()
        
        amountFriends.text = "\(numberOfFriendsAmount)"
        
        if numberOfPlayers > 0 {
            plusButton.isEnabled = true
        }
        
        if numberOfPlayers < 3 {
            minusButton.isEnabled = false
        }
        
        playerNameChanged()
    }
    
    @objc func plusButtonPressed() {
        numberOfPlayers += 1
        numberOfFriendsAmount += 1
        minusButton.isEnabled = true
        tableView.reloadData()
        
        amountFriends.text = "\(numberOfFriendsAmount)"
        
        if numberOfPlayers >= 6 {
            plusButton.isEnabled = false
        }
        
        playerNameChanged()
    }
    
    @objc func createButtonPressed() {
        let choiceController = ChoiceViewController()
        choiceController.friends = fetchFriendsData()
        self.navigationController?.pushViewController(choiceController, animated: true)
    }

    private func fetchFriendsData() -> [FriendInfo] {
        var friends: [FriendInfo] = []
        for i in 0..<numberOfPlayers {
            if let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? StartAPartyTableViewCell {
                let name = cell.nameFriendTextField.text ?? "Player \(i + 1)"
                var imageName = cell.selectedImageName
                imageName = imageName.replacingOccurrences(of: "Active", with: "")
                friends.append(FriendInfo(name: name, imageName: imageName))
            }
        }
        return friends
    }
    
    func validatePlayerNames() -> Bool {
        for i in 0..<numberOfPlayers {
            if let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? StartAPartyTableViewCell,
               cell.nameFriendTextField.text?.count ?? 0 < 3 {
                return false
            }
        }
        return true
    }
}

extension StartAPartyViewController {
    func setupGoStartViews() {
        partyStart.image = UIImage(named: "background")
        partyStart.layer.masksToBounds = true
        partyStart.contentMode = .scaleAspectFill
        partyStart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(partyStart)
        
        startAPartyButton.setImage(UIImage(named: "startAParty"), for: .normal)
        startAPartyButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        startAPartyButton.isEnabled = false
        startAPartyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAPartyButton)
        
        tableView.register(StartAPartyTableViewCell.self, forCellReuseIdentifier: StartAPartyTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 200
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        numberFriendsLabel.text = "Number of players"
        numberFriendsLabel.textColor = .white
        numberFriendsLabel.numberOfLines = 0
        numberFriendsLabel.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        numberFriendsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numberFriendsLabel)
        
        minusButton.setImage(UIImage(named: "minus"), for: .normal)
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        minusButton.isEnabled = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minusButton)
        
        amountFriends.text = "\(numberOfFriendsAmount)"
        amountFriends.textColor = .white
        amountFriends.numberOfLines = 0
        amountFriends.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        amountFriends.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountFriends)
        
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            partyStart.topAnchor.constraint(equalTo: view.topAnchor),
            partyStart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            partyStart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            partyStart.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            numberFriendsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            numberFriendsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            plusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            amountFriends.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            amountFriends.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -20),
            
            minusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            minusButton.trailingAnchor.constraint(equalTo: amountFriends.leadingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: startAPartyButton.topAnchor, constant: -44),
            
            startAPartyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            startAPartyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupGoStartNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Add Players"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension StartAPartyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StartAPartyTableViewCell.id, for: indexPath) as? StartAPartyTableViewCell else {
            fatalError("Could not cast to StartAPartyTableViewCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.configure(with: "Player \(indexPath.row + 1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
