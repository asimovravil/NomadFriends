//
//  SettingsViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class lalallafqjqfjqwf12321312ViewController: UIViewController {
    
    var settingsSettings = UIImageView()
    var tableViewSettings = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSettingsViews()
        setupSettingsNavigationBar()
    }
    
    @objc private func rateUsButtonTouch() {
        let appName = "Avix"
        
        if let url = URL(string: "https://itunes.apple.com/search?term=\(appName)&entity=software") {
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let results = json["results"] as? [[String: Any]],
                           let firstResult = results.first,
                           let appID = firstResult["trackId"] as? Int {
                            self.appStore(for: appID)
                        }
                    } catch {
                        print("JSON parsing error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
    
    private func appStore(for appID: Int) {
        let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review")!
        
        if UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        } else {
            print("Unable to open App Store URL")
        }
    }
    
    private func shareAppButtonTouch() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func switchChanged(_ sender : UISwitch){
        if sender.isOn {
            print("On")
        } else {
            print("No")
        }
    }
}

extension lalallafqjqfjqwf12321312ViewController {
    func setupSettingsViews() {
        settingsSettings.image = UIImage(named: "background")
        settingsSettings.layer.masksToBounds = true
        settingsSettings.contentMode = .scaleAspectFill
        settingsSettings.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsSettings)
        
        tableViewSettings.register(dwdwql13cbwedqwTableViewCell.self, forCellReuseIdentifier: dwdwql13cbwedqwTableViewCell.reuseID)
        tableViewSettings.layer.cornerRadius = 15
        tableViewSettings.dataSource = self
        tableViewSettings.delegate = self
        tableViewSettings.isScrollEnabled = false
        tableViewSettings.rowHeight = 44
        tableViewSettings.backgroundColor = UIColor(
            red: 43.0/255.0,
            green: 0.0/255.0,
            blue: 83.0/255.0,
            alpha: 1.0
        )
        
        tableViewSettings.showsVerticalScrollIndicator = false
        tableViewSettings.separatorStyle = .none
        tableViewSettings.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewSettings)
        
        NSLayoutConstraint.activate([
            settingsSettings.topAnchor.constraint(equalTo: view.topAnchor),
            settingsSettings.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsSettings.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsSettings.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableViewSettings.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            tableViewSettings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableViewSettings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableViewSettings.heightAnchor.constraint(equalToConstant: 176),
        ])
    }
    
    private func setupSettingsNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: "settingsNav"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}

extension lalallafqjqfjqwf12321312ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dwdwql13cbwedqwTableViewCell.reuseID, for: indexPath) as? dwdwql13cbwedqwTableViewCell else {
            fatalError("Could not cast to SettingsTableViewCell")
        }
        cell.backgroundColor = .clear
        
        switch indexPath.row {
        case 0:
            cell.titleCellSettings.text = "Notifications"
            
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(true, animated: true)
            switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 1:
            cell.titleCellSettings.text = "Privacy Policy"
        case 2:
            cell.titleCellSettings.text = "Rate Us"
        case 3:
            cell.titleCellSettings.text = "Share App"
        default:
            cell.titleCellSettings.text = "Unknown"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            break
            
        case 1:
            break
            
        case 2:
            rateUsButtonTouch()
            break
            
        case 3:
            shareAppButtonTouch()
            break
            
        default:
            break
        }
    }
}



