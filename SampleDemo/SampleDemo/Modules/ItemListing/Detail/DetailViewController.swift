//
//  DetailViewController.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import UIKit

class DetailViewController: UIViewController {

    var item: RelatedTopic!
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = item.text
        lblDescription.text = item.result
        
        guard item.icon.url != "" , let url = URL(string: "\(item.firstURL)\(item.icon.url)") else {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(systemName: "photo.fill")
            }
            return }
        
        _ = UIImage.downloadImage(url: url, completion: { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.imageView.image = image
                } else {
                    self.imageView.image = UIImage(systemName: "photo.fill")
                }
            }
        })
        
    }
}
