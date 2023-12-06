//
//  StartAPartyViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

final class dwq1gnrvxqViewController: UIViewController {

    var partyStart = UIImageView()
    var numberOfPlayers = 2
    var numberOfFriendsAmount = 2
    
    var startAPartyButtonStartParty = UIButton()
    var tableViewStartParty = UITableView(frame: .zero, style: .plain)
    var numberFriendsLabelStartParty = UILabel()
    var minusButtonStartParty = UIButton()
    var amountFriendsStartParty = UILabel()
    var plusButtonStartParty = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(vmvmvmvmvm312312), name: NSNotification.Name("PlayerNameChanged"), object: nil)
        ef9wf994123213()
        bvbsdvsv616612312()
    }
    
    @objc func vmvmvmvmvm312312() {
        startAPartyButtonStartParty.isEnabled = net040140214()
    }
    
    @objc func qwqwqw123131() {
        numberOfPlayers -= 1
        numberOfFriendsAmount -= 1
        tableViewStartParty.reloadData()
        
        amountFriendsStartParty.text = "\(numberOfFriendsAmount)"
        
        if numberOfPlayers > 0 {
            plusButtonStartParty.isEnabled = true
        }
        
        if numberOfPlayers < 3 {
            minusButtonStartParty.isEnabled = false
        }
        
        vmvmvmvmvm312312()
    }
    
    @objc func ererererr21313() {
        numberOfPlayers += 1
        numberOfFriendsAmount += 1
        minusButtonStartParty.isEnabled = true
        tableViewStartParty.reloadData()
        
        amountFriendsStartParty.text = "\(numberOfFriendsAmount)"
        
        if numberOfPlayers >= 6 {
            plusButtonStartParty.isEnabled = false
        }
        
        vmvmvmvmvm312312()
    }
    
    @objc func ytyttyyy9898989() {
        let choiceController = ahaheaqwddqwd123123ViewController()
        choiceController.friends = ha934949449()
        self.navigationController?.pushViewController(choiceController, animated: true)
    }

    private func ha934949449() -> [FriendInfo] {
        var friends: [FriendInfo] = []
        for i in 0..<numberOfPlayers {
            if let cell = tableViewStartParty.cellForRow(at: IndexPath(row: i, section: 0)) as? ddqwdqd1124121TableViewCell {
                let name = cell.nameFriendTextFieldStartParty.text ?? "Player \(i + 1)"
                var imageName = cell.selectedImageName
                imageName = imageName.replacingOccurrences(of: "Active", with: "")
                friends.append(FriendInfo(name: name, imageName: imageName))
            }
        }
        return friends
    }
    
    func net040140214() -> Bool {
        for i in 0..<numberOfPlayers {
            if let cell = tableViewStartParty.cellForRow(at: IndexPath(row: i, section: 0)) as? ddqwdqd1124121TableViewCell,
               cell.nameFriendTextFieldStartParty.text?.count ?? 0 < 3 {
                return false
            }
        }
        return true
    }
}

extension dwq1gnrvxqViewController {
    func ef9wf994123213() {
        partyStart.image = UIImage(named: "background")
        partyStart.layer.masksToBounds = true
        partyStart.contentMode = .scaleAspectFill
        partyStart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(partyStart)
        
        startAPartyButtonStartParty.setImage(UIImage(named: "startAParty"), for: .normal)
        startAPartyButtonStartParty.addTarget(self, action: #selector(ytyttyyy9898989), for: .touchUpInside)
        startAPartyButtonStartParty.isEnabled = false
        startAPartyButtonStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAPartyButtonStartParty)
        
        tableViewStartParty.register(ddqwdqd1124121TableViewCell.self, forCellReuseIdentifier: ddqwdqd1124121TableViewCell.id)
        tableViewStartParty.dataSource = self
        tableViewStartParty.delegate = self
        tableViewStartParty.showsVerticalScrollIndicator = false
        tableViewStartParty.backgroundColor = .clear
        tableViewStartParty.separatorStyle = .none
        tableViewStartParty.rowHeight = 200
        tableViewStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewStartParty)
        
        numberFriendsLabelStartParty.text = "Number of players"
        numberFriendsLabelStartParty.textColor = .white
        numberFriendsLabelStartParty.numberOfLines = 0
        numberFriendsLabelStartParty.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        numberFriendsLabelStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numberFriendsLabelStartParty)
        
        minusButtonStartParty.setImage(UIImage(named: "minus"), for: .normal)
        minusButtonStartParty.addTarget(self, action: #selector(qwqwqw123131), for: .touchUpInside)
        minusButtonStartParty.isEnabled = false
        minusButtonStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minusButtonStartParty)
        
        amountFriendsStartParty.text = "\(numberOfFriendsAmount)"
        amountFriendsStartParty.textColor = .white
        amountFriendsStartParty.numberOfLines = 0
        amountFriendsStartParty.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        amountFriendsStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountFriendsStartParty)
        
        plusButtonStartParty.setImage(UIImage(named: "plus"), for: .normal)
        plusButtonStartParty.addTarget(self, action: #selector(ererererr21313), for: .touchUpInside)
        plusButtonStartParty.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButtonStartParty)
        
        NSLayoutConstraint.activate([
            partyStart.topAnchor.constraint(equalTo: view.topAnchor),
            partyStart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            partyStart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            partyStart.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            numberFriendsLabelStartParty.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            numberFriendsLabelStartParty.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            plusButtonStartParty.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            plusButtonStartParty.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            amountFriendsStartParty.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            amountFriendsStartParty.trailingAnchor.constraint(equalTo: plusButtonStartParty.leadingAnchor, constant: -20),
            
            minusButtonStartParty.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            minusButtonStartParty.trailingAnchor.constraint(equalTo: amountFriendsStartParty.leadingAnchor, constant: -20),
            
            tableViewStartParty.topAnchor.constraint(equalTo: plusButtonStartParty.bottomAnchor, constant: 24),
            tableViewStartParty.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewStartParty.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewStartParty.bottomAnchor.constraint(equalTo: startAPartyButtonStartParty.topAnchor, constant: -5),
            
            startAPartyButtonStartParty.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            startAPartyButtonStartParty.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func bvbsdvsv616612312() {
        let titleLabel = UILabel()
        titleLabel.text = "Add Players"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension dwq1gnrvxqViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ddqwdqd1124121TableViewCell.id, for: indexPath) as? ddqwdqd1124121TableViewCell else {
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
