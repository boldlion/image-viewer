//
//  PreviewImageViewController.swift
//  ImageViewer
//
//  Created by Bold Lion on 27.09.18.
//  Copyright © 2018 Bold Lion. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController {
    
    @IBOutlet weak var previewImage: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        if let image = selectedImage {
            previewImage.image = UIImage(named: image)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }
}
