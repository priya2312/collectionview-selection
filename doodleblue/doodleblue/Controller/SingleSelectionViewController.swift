//
//  SingleSelectionViewController.swift
//  doodleblue
//
//  Created by Priyadharshini Tamilarasan on 05/09/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import UIKit

class SingleHeaderReusableCell: UICollectionReusableView{
    @IBOutlet weak var headerButton: UIButton!
}

class SingleCell: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var checkmarkImage: UIImageView!
}

class SingleSelectionViewController: UIViewController {

    @IBOutlet weak var singleCollectionView: UICollectionView!
    
    var showCollection = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        singleCollectionView.allowsMultipleSelection = false
        
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

extension SingleSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return showCollection ? DogList.dogList.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = singleCollectionView.dequeueReusableCell(withReuseIdentifier: "SingleCell", for: indexPath) as! SingleCell
        
        cell.name.text! = DogList.dogList[indexPath.item].name
        cell.image.image = DogList.dogList[indexPath.item].image
        
        if DogList.singleSelection == DogList.dogList[indexPath.item].name {
            cell.checkmarkImage.tintColor = .white
        }else{
            cell.checkmarkImage.tintColor = .clear
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = singleCollectionView.cellForItem(at: indexPath) as! SingleCell
        cell.checkmarkImage.tintColor = .white
        DogList.singleSelection = DogList.dogList[indexPath.item].name
        showCollection = false
        singleCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = singleCollectionView.cellForItem(at: indexPath) as! SingleCell
        cell.checkmarkImage.tintColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = singleCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SingleHeaderReusableCell", for: indexPath) as! SingleHeaderReusableCell
        
        headerView.headerButton.addTarget(self, action: #selector(handleCollection), for: .touchUpInside)
    
        return headerView
        
    }
    
    @objc func handleCollection(){
        
        showCollection.toggle()
        singleCollectionView.reloadData()
        
    }
    
}
