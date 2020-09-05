//
//  MultipleSelectionViewController.swift
//  doodleblue
//
//  Created by Priyadharshini Tamilarasan on 05/09/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import UIKit

class MultiHeaderReusableCell: UICollectionReusableView {
    @IBOutlet weak var headerButton: UIButton!
}

class MultipleCell: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var name: UILabel!
}

class MultipleSelectionViewController: UIViewController {

    @IBOutlet weak var multiCollectionView: UICollectionView!
    
    var showCollection = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        multiCollectionView.allowsMultipleSelection = true
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

extension MultipleSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showCollection ? DogList.dogList.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = multiCollectionView.dequeueReusableCell(withReuseIdentifier: "MultipleCell", for: indexPath) as! MultipleCell
        
        cell.name.text! = DogList.dogList[indexPath.item].name
        cell.image.image = DogList.dogList[indexPath.item].image
        
        if DogList.multipleSelection.contains(DogList.dogList[indexPath.item].name){
            cell.checkmarkImage.tintColor = .white
        }else{
            cell.checkmarkImage.tintColor = .clear
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = multiCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MultiHeaderReusableCell", for: indexPath) as! MultiHeaderReusableCell
        
        headerView.headerButton.addTarget(self, action: #selector(handleCollection), for: .touchUpInside)
    
        return headerView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = multiCollectionView.cellForItem(at: indexPath) as! MultipleCell
        cell.checkmarkImage.tintColor = .white
        DogList.multipleSelection.insert(cell.name.text!)
//        print(DogList.multipleSelection)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = multiCollectionView.cellForItem(at: indexPath) as! MultipleCell
        cell.checkmarkImage.tintColor = .clear
        DogList.multipleSelection.remove(cell.name.text!)
//        print(DogList.multipleSelection)
    }
    
    @objc func handleCollection(){
        
        showCollection.toggle()
        multiCollectionView.reloadData()
        
    }
    
}

