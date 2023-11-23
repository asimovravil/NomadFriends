//
//  StartAPartyTableViewCell.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

final class ddqwdqd1124121TableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var selectedImageName: String = ""
    
    var isFriend1ButtonActive = false
    var isFriend2ButtonActive = false
    var isFriend3ButtonActive = false
    var isFriend4ButtonActive = false
    var isFriend5ButtonActive = false
    var isFriend6ButtonActive = false
    
    var playerLabel = UILabel()
    
    var cardFriends = UIImageView()
    var stackView = UIStackView()
    var friend1Button = UIButton()
    var friend2Button = UIButton()
    var friend3Button = UIButton()
    var friend4Button = UIButton()
    var friend5Button = UIButton()
    var friend6Button = UIButton()

    var nameFriendTextFieldStartParty = UITextField()
    
    var playerName: String? {
        didSet {
            playerLabel.text = playerName
        }
    }
        
    static let id = String(describing: ddqwdqd1124121TableViewCell.self)
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dyewdy71921983jdedjqwdq()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetButtonsStartPartyChponk() {
        isFriend1ButtonActive = false
        isFriend2ButtonActive = false
        isFriend3ButtonActive = false
        isFriend4ButtonActive = false
        isFriend5ButtonActive = false
        isFriend6ButtonActive = false
        
        friend1Button.setImage(UIImage(named: "friend1"), for: .normal)
        friend2Button.setImage(UIImage(named: "friend2"), for: .normal)
        friend3Button.setImage(UIImage(named: "friend3"), for: .normal)
        friend4Button.setImage(UIImage(named: "friend4"), for: .normal)
        friend5Button.setImage(UIImage(named: "friend5"), for: .normal)
        friend6Button.setImage(UIImage(named: "friend6"), for: .normal)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func configure(with playerName: String) {
        self.playerName = playerName
    }
    
    @objc func opopoppopoop4234234() {
        resetButtonsStartPartyChponk()
        isFriend1ButtonActive = true
        selectedImageName = "friend1Active"

        let imageName = isFriend1ButtonActive ? "friend1Active" : "friend1"
        friend1Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func asasasasa332131() {
        resetButtonsStartPartyChponk()
        isFriend2ButtonActive.toggle()
        selectedImageName = "friend2Active"

        let imageName = isFriend2ButtonActive ? "friend2Active" : "friend2"
        friend2Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func fdfdfdfd8348428() {
        resetButtonsStartPartyChponk()
        isFriend3ButtonActive.toggle()
        selectedImageName = "friend3Active"

        let imageName = isFriend3ButtonActive ? "friend3Active" : "friend3"
        friend3Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func ghghghgh87654421() {
        resetButtonsStartPartyChponk()
        isFriend4ButtonActive.toggle()
        selectedImageName = "friend4Active"

        let imageName = isFriend4ButtonActive ? "friend4Active" : "friend4"
        friend4Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func vjjjgjwgjejwgewjgg() {
        resetButtonsStartPartyChponk()
        isFriend4ButtonActive.toggle()
        selectedImageName = "friend5Active"

        let imageName = isFriend4ButtonActive ? "friend5Active" : "friend5"
        friend5Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func zcxbccmnasbc() {
        resetButtonsStartPartyChponk()
        isFriend4ButtonActive.toggle()
        selectedImageName = "friend6Active"

        let imageName = isFriend4ButtonActive ? "friend6Active" : "friend6"
        friend6Button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func zcacrazrtcactztxqwxx(_ textField: UITextField) {
        NotificationCenter.default.post(name: NSNotification.Name("PlayerNameChanged"), object: nil)
    }
}

extension ddqwdqd1124121TableViewCell {
    func dyewdy71921983jdedjqwdq() {
        stackView.addArrangedSubview(friend1Button)
        stackView.addArrangedSubview(friend2Button)
        stackView.addArrangedSubview(friend3Button)
        stackView.addArrangedSubview(friend4Button)
        stackView.addArrangedSubview(friend5Button)
        stackView.addArrangedSubview(friend6Button)
        
        cardFriends.image = UIImage(named: "cardFriends")
        cardFriends.layer.masksToBounds = true
        cardFriends.contentMode = .scaleAspectFill
        cardFriends.layer.cornerRadius = 20
        cardFriends.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardFriends)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        friend1Button.setImage(UIImage(named: "friend1"), for: .normal)
        friend1Button.addTarget(self, action: #selector(opopoppopoop4234234), for: .touchUpInside)
        friend1Button.translatesAutoresizingMaskIntoConstraints = false
        
        friend2Button.setImage(UIImage(named: "friend2"), for: .normal)
        friend2Button.addTarget(self, action: #selector(asasasasa332131), for: .touchUpInside)
        friend2Button.translatesAutoresizingMaskIntoConstraints = false
        
        friend3Button.setImage(UIImage(named: "friend3"), for: .normal)
        friend3Button.addTarget(self, action: #selector(fdfdfdfd8348428), for: .touchUpInside)
        friend3Button.translatesAutoresizingMaskIntoConstraints = false
        
        friend4Button.setImage(UIImage(named: "friend4"), for: .normal)
        friend4Button.addTarget(self, action: #selector(ghghghgh87654421), for: .touchUpInside)
        friend4Button.translatesAutoresizingMaskIntoConstraints = false
        
        friend5Button.setImage(UIImage(named: "friend5"), for: .normal)
        friend5Button.addTarget(self, action: #selector(vjjjgjwgjejwgewjgg), for: .touchUpInside)
        friend5Button.translatesAutoresizingMaskIntoConstraints = false
        
        friend6Button.setImage(UIImage(named: "friend6"), for: .normal)
        friend6Button.addTarget(self, action: #selector(zcxbccmnasbc), for: .touchUpInside)
        friend6Button.translatesAutoresizingMaskIntoConstraints = false
        
        playerLabel.text = "Player"
        playerLabel.font = UIFont(name: "Ubuntu-Regular", size: 24)
        playerLabel.textColor = .white
        playerLabel.textAlignment = .left
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(playerLabel)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 16)!
        ]
        nameFriendTextFieldStartParty.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes)
        nameFriendTextFieldStartParty.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        nameFriendTextFieldStartParty.textAlignment = .center
        nameFriendTextFieldStartParty.layer.cornerRadius = 20
        nameFriendTextFieldStartParty.textColor = .white
        nameFriendTextFieldStartParty.autocorrectionType = .no
        nameFriendTextFieldStartParty.keyboardType = .default
        nameFriendTextFieldStartParty.backgroundColor = UIColor(red: 123/255.0, green: 0/255.0, blue: 165/255.0, alpha: 1.0)
        nameFriendTextFieldStartParty.delegate = self
        nameFriendTextFieldStartParty.addTarget(self, action: #selector(zcacrazrtcactztxqwxx), for: .editingChanged)
        nameFriendTextFieldStartParty.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameFriendTextFieldStartParty)
        
        NSLayoutConstraint.activate([
            cardFriends.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardFriends.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardFriends.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardFriends.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            playerLabel.topAnchor.constraint(equalTo: cardFriends.topAnchor, constant: 16),
            playerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 11),
            stackView.leadingAnchor.constraint(equalTo: cardFriends.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: cardFriends.trailingAnchor, constant: -16),
            
            nameFriendTextFieldStartParty.bottomAnchor.constraint(equalTo: cardFriends.bottomAnchor, constant: -16),
            nameFriendTextFieldStartParty.leadingAnchor.constraint(equalTo: cardFriends.leadingAnchor, constant: 16),
            nameFriendTextFieldStartParty.trailingAnchor.constraint(equalTo: cardFriends.trailingAnchor, constant: -16),
            nameFriendTextFieldStartParty.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
