//
//  UserCell.swift
//  ProgrammaticUserCells
//
//  Created by casandra grullon on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UserCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    public func configureCell(for user: User) {
        userNameLabel.text = "\(user.name.first) \(user.name.last)"
        imageView.getImage(with: user.picture.thumbnail) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(systemName: "person")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
}
