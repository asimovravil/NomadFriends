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
    var cameraImageProfile = UIImageView()
    var editButtonProfile = UIButton()
    var levelsImageProfile = UIImageView()
    var levelsLabelProfile = UILabel()
    var levelsCoinsProfile = UILabel()
    var friendsLabelProfile = UILabel()
    var cardProfileViewProfile = UIImageView()
    var deleteButtonProfile = UIButton()
    var setnameTextFieldProfile = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupProfileViews()
        setupProfileNavigationBar()
        loadProfileImageProfileChponk()
        loadUsernameProfileChponk()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cameraImageProfile.layer.cornerRadius = 60
    }
    
    @objc private func deleteButtonProfileChponk() {
        UserDefaults.standard.removeObject(forKey: "userProfileImage")
        UserDefaults.standard.removeObject(forKey: "username")
        
        cameraImageProfile.image = UIImage(named: "cameraImage")
        setnameTextFieldProfile.text = ""
    }
    
    func loadProfileImageProfileChponk() {
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            cameraImageProfile.image = image
        }
    }
    
    func loadUsernameProfileChponk() {
        if let username = UserDefaults.standard.string(forKey: "username") {
            setnameTextFieldProfile.text = username
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
        
        cameraImageProfile.image = UIImage(named: "cameraImage")
        cameraImageProfile.layer.masksToBounds = true
        cameraImageProfile.contentMode = .scaleAspectFill
        cameraImageProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraImageProfile)
        
        editButtonProfile.setImage(UIImage(named: "editButton"), for: .normal)
        editButtonProfile.addTarget(self, action: #selector(editButtonTouchProfileChponk), for: .touchUpInside)
        editButtonProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButtonProfile)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 24)!
        ]
        setnameTextFieldProfile.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes)
        setnameTextFieldProfile.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        setnameTextFieldProfile.textAlignment = .center
        setnameTextFieldProfile.layer.cornerRadius = 10
        setnameTextFieldProfile.textColor = .white
        setnameTextFieldProfile.keyboardType = .default
        setnameTextFieldProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setnameTextFieldProfile)
        
        cardProfileViewProfile.image = UIImage(named: "cardProfile")
        cardProfileViewProfile.layer.masksToBounds = true
        cardProfileViewProfile.contentMode = .scaleAspectFill
        cardProfileViewProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardProfileViewProfile)
        
        levelsImageProfile.image = UIImage(named: "levelImage")
        levelsImageProfile.layer.masksToBounds = true
        levelsImageProfile.contentMode = .scaleAspectFill
        levelsImageProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsImageProfile)
        
        levelsLabelProfile.text = "Levels"
        levelsLabelProfile.textColor = .white
        levelsLabelProfile.numberOfLines = 0
        levelsLabelProfile.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsLabelProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsLabelProfile)
        
        levelsCoinsProfile.text = "0"
        levelsCoinsProfile.textColor = .white
        levelsCoinsProfile.numberOfLines = 0
        levelsCoinsProfile.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsCoinsProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsCoinsProfile)
        
        friendsLabelProfile.text = "0"
        friendsLabelProfile.textColor = .white
        friendsLabelProfile.numberOfLines = 0
        friendsLabelProfile.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        friendsLabelProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(friendsLabelProfile)
        
        deleteButtonProfile.setImage(UIImage(named: "deleteAccount"), for: .normal)
        deleteButtonProfile.addTarget(self, action: #selector(deleteButtonProfileChponk), for: .touchUpInside)
        deleteButtonProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButtonProfile)
        
        NSLayoutConstraint.activate([
            profileProfile.topAnchor.constraint(equalTo: view.topAnchor),
            profileProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileProfile.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cameraImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraImageProfile.widthAnchor.constraint(equalToConstant: 120),
            cameraImageProfile.heightAnchor.constraint(equalToConstant: 120),
            
            setnameTextFieldProfile.topAnchor.constraint(equalTo: cameraImageProfile.bottomAnchor, constant: 16),
            setnameTextFieldProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardProfileViewProfile.topAnchor.constraint(equalTo: cameraImageProfile.bottomAnchor, constant: 70),
            cardProfileViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            levelsImageProfile.topAnchor.constraint(equalTo: cardProfileViewProfile.topAnchor, constant: 16),
            levelsImageProfile.leadingAnchor.constraint(equalTo: cardProfileViewProfile.centerXAnchor, constant: -50),
            
            levelsLabelProfile.topAnchor.constraint(equalTo: cardProfileViewProfile.topAnchor, constant: 19),
            levelsLabelProfile.trailingAnchor.constraint(equalTo: cardProfileViewProfile.centerXAnchor, constant: 50),
            
            levelsCoinsProfile.topAnchor.constraint(equalTo: levelsImageProfile.bottomAnchor, constant: 26),
            levelsCoinsProfile.leadingAnchor.constraint(equalTo: cardProfileViewProfile.leadingAnchor, constant: 80),
            
            friendsLabelProfile.topAnchor.constraint(equalTo: levelsImageProfile.bottomAnchor, constant: 26),
            friendsLabelProfile.trailingAnchor.constraint(equalTo: cardProfileViewProfile.trailingAnchor, constant: -92),
            
            editButtonProfile.bottomAnchor.constraint(equalTo: cameraImageProfile.bottomAnchor),
            editButtonProfile.trailingAnchor.constraint(equalTo: cameraImageProfile.trailingAnchor),
            
            deleteButtonProfile.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            deleteButtonProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cameraImageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            ])
        } else {
            NSLayoutConstraint.activate([
                cameraImageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
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
    
    @objc private func editButtonTouchProfileChponk() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePickerProfileChponk()
                }
            }
        } else if status == .authorized {
            self.presentImagePickerProfileChponk()
        }
    }

    func presentImagePickerProfileChponk() {
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // В методе, где вы устанавливаете изображение на кнопку:
    func imagePickerControllerProfileChponk(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            let resizedImage = resizeImageProfileChponk(image: selectedImage, targetSize: cameraImageProfile.bounds.size)

            // Сохранение изображения
            saveImageToLocalStorageProfileChponk(resizedImage)

            cameraImageProfile.image = resizedImage
        }

        dismiss(animated: true, completion: nil)
    }
    
    func saveImageToLocalStorageProfileChponk(_ image: UIImage) {
        if let imageData = image.pngData() {
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")
        }
    }
    
    func resizeImageProfileChponk(image: UIImage, targetSize: CGSize) -> UIImage {
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
