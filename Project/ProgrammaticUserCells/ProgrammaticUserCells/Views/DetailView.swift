//
//  DetailView.swift
//  ProgrammaticUserCells
//
//  Created by casandra grullon on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class DetailView: UIView {

    public var user: User?
    
    public lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    public lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    public lazy var userAgeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    public lazy var userLocationLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setupUserImageConstraints()
        setupUserNameConstraints()
        setupUserAgeConstraints()
        setupLocationConstraints()
    }

    private func setupUserImageConstraints() {
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    private func setupUserNameConstraints() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
        ])
    }
    private func setupUserAgeConstraints() {
        addSubview(userAgeLabel)
        userAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userAgeLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            userAgeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userAgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
        ])
    }
    private func setupLocationConstraints() {
        addSubview(userLocationLabel)
        userLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userLocationLabel.topAnchor.constraint(equalToSystemSpacingBelow: userAgeLabel.bottomAnchor, multiplier: 20),
            userLocationLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 20),
            userLocationLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 20)
        ])
    }
    
}
