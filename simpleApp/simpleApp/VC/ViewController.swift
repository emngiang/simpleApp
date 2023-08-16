//
//  ViewController.swift
//  simpleApp
//
//  Created by Emma Giang on 8/16/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLikeButton()
    }

    private func setupLikeButton() {
        let likeButton = UIButton(type: .system)
        likeButton.setTitle("Tap Here", for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
               
        // Shadow
        likeButton.layer.shadowColor = UIColor.black.cgColor
        likeButton.layer.shadowOpacity = 0.5
        likeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        likeButton.layer.shadowRadius = 4.0
       
        likeButton.clipsToBounds = false

        likeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(likeButton)

        NSLayoutConstraint.activate([
            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 150),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func likeButtonTapped() {
        showLikeAnimation()
    }

    private func showLikeAnimation() {
        let likeIcon = UIImageView(image: UIImage(named: "likeIcon.jpeg"))
        likeIcon.translatesAutoresizingMaskIntoConstraints = false
        likeIcon.alpha = 0
        view.addSubview(likeIcon)

        NSLayoutConstraint.activate([
            likeIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            likeIcon.widthAnchor.constraint(equalToConstant: 80),
            likeIcon.heightAnchor.constraint(equalToConstant: 80)
        ])

        // Animation
        UIView.animate(withDuration: 0.5, animations: {
            likeIcon.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                likeIcon.alpha = 0
            }) { _ in
                likeIcon.removeFromSuperview()
            }
        }
    }
}

