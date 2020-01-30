//
//  DetailController.swift
//  ProgrammaticUserCells
//
//  Created by casandra grullon on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class DetailController: UIViewController {

    private var detailView = DetailView()
    
    var user: User?
    
    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateUI()
    }
    
    private func updateUI() {
        guard let user = user else {
            return
        }
        detailView.user = user
        detailView.userAgeLabel.text = "\(user.dob.age) years old"
        detailView.userNameLabel.text = "\(user.name.first) \(user.name.last)"
        detailView.userLocationLabel.text = "\(user.location.city), \(user.location.state)"
        detailView.userImage.getImage(with: user.picture.large) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.detailView.userImage.image = UIImage(systemName: "person")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.userImage.image = image
                }
            }
        }
        
        
    }

}
