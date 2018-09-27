//
//  ViewController.swift
//  ImageViewer
//
//  Created by Bold Lion on 26.09.18.
//  Copyright © 2018 Bold Lion. All rights reserved.
//

import UIKit

class ImageViewerTableView: UITableViewController {

    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getImages()
        title = "Image Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    fileprivate func getImages() {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("img") {
                pictures.append(item)
            }
        }
    }
    
    func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
}

extension ImageViewerTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let previewVC = storyboard?.instantiateViewController(withIdentifier: "PreviewImageViewController") as? PreviewImageViewController {
            previewVC.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(previewVC, animated: true)
        }
    }
}
