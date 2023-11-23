//
//  ProfileViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit
import Photos

class ProfileViewController: UIViewController {
    
    var profileProfile = UIImageView()
    var cameraImageView = UIImageView()
    var editButton = UIButton()
    var levelsImage = UIImageView()
    var levelsLabel = UILabel()
    var levelsCoins = UILabel()
    var friendsLabel = UILabel()
    var cardProfileView = UIImageView()
    var deleteButton = UIButton()
    var setnameTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupProfileViews()
        setupProfileNavigationBar()
        loadProfileImage()
        loadUsername()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cameraImageView.layer.cornerRadius = 60
    }
    
    @objc private func deleteButtonTouch() {
        UserDefaults.standard.removeObject(forKey: "userProfileImage")
        UserDefaults.standard.removeObject(forKey: "username")
        
        cameraImageView.image = UIImage(named: "cameraImage")
        setnameTextField.text = ""
    }
    
    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            cameraImageView.image = image
        }
    }
    
    func loadUsername() {
        if let username = UserDefaults.standard.string(forKey: "username") {
            setnameTextField.text = username
        }
    }
}

extension ProfileViewController {
    private func setupProfileViews() {
        profileProfile.image = UIImage(named: "profileBackground")
        profileProfile.layer.masksToBounds = true
        profileProfile.contentMode = .scaleAspectFill
        profileProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileProfile)
        
        cameraImageView.image = UIImage(named: "cameraImage")
        cameraImageView.layer.masksToBounds = true
        cameraImageView.contentMode = .scaleAspectFill
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraImageView)
        
        editButton.setImage(UIImage(named: "editButton"), for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTouch), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 24)!
        ]
        setnameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes)
        setnameTextField.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        setnameTextField.textAlignment = .center
        setnameTextField.layer.cornerRadius = 10
        setnameTextField.textColor = .white
        setnameTextField.keyboardType = .default
        setnameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setnameTextField)
        
        cardProfileView.image = UIImage(named: "cardProfile")
        cardProfileView.layer.masksToBounds = true
        cardProfileView.contentMode = .scaleAspectFill
        cardProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardProfileView)
        
        levelsImage.image = UIImage(named: "levelImage")
        levelsImage.layer.masksToBounds = true
        levelsImage.contentMode = .scaleAspectFill
        levelsImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsImage)
        
        levelsLabel.text = "Levels"
        levelsLabel.textColor = .white
        levelsLabel.numberOfLines = 0
        levelsLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsLabel)
        
        levelsCoins.text = "0"
        levelsCoins.textColor = .white
        levelsCoins.numberOfLines = 0
        levelsCoins.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsCoins.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsCoins)
        
        friendsLabel.text = "0"
        friendsLabel.textColor = .white
        friendsLabel.numberOfLines = 0
        friendsLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        friendsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(friendsLabel)
        
        deleteButton.setImage(UIImage(named: "deleteAccount"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTouch), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            profileProfile.topAnchor.constraint(equalTo: view.topAnchor),
            profileProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileProfile.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cameraImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraImageView.widthAnchor.constraint(equalToConstant: 120),
            cameraImageView.heightAnchor.constraint(equalToConstant: 120),
            
            setnameTextField.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 16),
            setnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardProfileView.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 70),
            cardProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            levelsImage.topAnchor.constraint(equalTo: cardProfileView.topAnchor, constant: 16),
            levelsImage.leadingAnchor.constraint(equalTo: cardProfileView.centerXAnchor, constant: -50),
            
            levelsLabel.topAnchor.constraint(equalTo: cardProfileView.topAnchor, constant: 19),
            levelsLabel.trailingAnchor.constraint(equalTo: cardProfileView.centerXAnchor, constant: 50),
            
            levelsCoins.topAnchor.constraint(equalTo: levelsImage.bottomAnchor, constant: 26),
            levelsCoins.leadingAnchor.constraint(equalTo: cardProfileView.leadingAnchor, constant: 80),
            
            friendsLabel.topAnchor.constraint(equalTo: levelsImage.bottomAnchor, constant: 26),
            friendsLabel.trailingAnchor.constraint(equalTo: cardProfileView.trailingAnchor, constant: -92),
            
            editButton.bottomAnchor.constraint(equalTo: cameraImageView.bottomAnchor),
            editButton.trailingAnchor.constraint(equalTo: cameraImageView.trailingAnchor),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cameraImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            ])
        } else {
            NSLayoutConstraint.activate([
                cameraImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            ])
        }
    }
    
    private func setupProfileNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: "profileNav"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc private func editButtonTouch() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePicker()
                }
            }
        } else if status == .authorized {
            self.presentImagePicker()
        }
    }

    func presentImagePicker() {
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // В методе, где вы устанавливаете изображение на кнопку:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            let resizedImage = resizeImage(image: selectedImage, targetSize: cameraImageView.bounds.size)

            // Сохранение изображения
            saveImageToLocalStorage(resizedImage)

            cameraImageView.image = resizedImage
        }

        dismiss(animated: true, completion: nil)
    }
    
    func saveImageToLocalStorage(_ image: UIImage) {
        if let imageData = image.pngData() {
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Определяем "масштабный коэффициент" как минимум из двух отношений
        _ = min(widthRatio, heightRatio)

        let scaledImageSize = CGSize(width: 120, height: 120)

        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }

        return scaledImage
    }
}
