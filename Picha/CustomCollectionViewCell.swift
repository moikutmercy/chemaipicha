//
//  CustomCollectionViewCell.swift
//  Picha
//
//  Created by Edith Dande on 13/06/2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pichaImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set the cell's background color to black
        
        self.contentView.backgroundColor = UIColor.black
        pichaImageView.layer.cornerRadius = 10.0
        pichaImageView.contentMode = .scaleAspectFill

    }
        
    func setImageFromURL(url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error loading image from URL: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.pichaImageView.image = image
                } else {
                    print("Error creating image fron data")
                }
            }
        }.resume()
    }
}
