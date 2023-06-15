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
        print("loading pichas")
        print(mapicha.count)
        print(mapicha[indexPath.row].urls?.small)
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
        print("loading file")
        guard let jsonData = Utils().loadJSONData(from: "picha_response") else {
            fatalError("Could not convert data")
        }
        print(jsonData)
    
    let decoder = JSONDecoder()
        print("decoding pichas")
        do {
            let mypichas = try decoder.decode(pichni.self, from: jsonData)
            self.mapicha = mypichas.pichas ?? []
        } catch {
            print("Error decoding data from file: \(error)")
            
        }
//        guard let mypichas = try? decoder.decode(pichni.self, from: jsonData) else {
//            fatalError("There was a problem decoding the data...")
//        }
        
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
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


