//
//  CollectionView.swift
//  Picha
//
//  Created by Edith Dande on 13/06/2023.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private var labels = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen"]
    
    private var mapicha : [picha] = []
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        //        extractMapichaFromJsonObject()
        cell.setImageFromURL(url: URL(string: mapicha[indexPath.row].urls?.small ?? "")!)
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
        
        extractMapichaFromJsonObject()
        
    }
    
    func extractMapichaFromJsonObject() {
        print("fetching API")
        Utils().callEndpoint(urlString: "https://api.unsplash.com/photos?client_id=BynWB-cZ3gnxyOiLK8FV2ojXYFfVc9gpwIFfgLeSGX8") { result in
            print("starting")
            
            switch result {
            case .success(let data):
                // Handle the response data
                let decoder = JSONDecoder()
                print("decoding pichas")
                do {
                    
                    self.mapicha = try decoder.decode([picha].self, from: data)
                    print(self.mapicha.count)
                    DispatchQueue.main.async {
                        self.reloadData()
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
                
            case .failure(let error):
                // Handle the error
                print("Error:", error)
            }
        }

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return mapicha.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: self.frame.width * 0.45, height: self.frame.height * 0.40)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
