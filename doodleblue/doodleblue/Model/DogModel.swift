//
//  DogModel.swift
//  doodleblue
//
//  Created by Priyadharshini Tamilarasan on 05/09/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import Foundation
import UIKit

struct Dog: Hashable {
    var name: String = ""
    var image: UIImage?
}

struct DogList {
    
    static var dogList: [Dog] = [
        Dog(name: "Dalmatian", image: #imageLiteral(resourceName: "dalmatian")),
        Dog(name: "Labrador", image: #imageLiteral(resourceName: "labrador")),
        Dog(name: "St Bernard", image: #imageLiteral(resourceName: "stbernard")),
        Dog(name: "Rottweiler", image: #imageLiteral(resourceName: "rottweiler")),
        Dog(name: "Weimaraner", image: #imageLiteral(resourceName: "weimaraner")),
        Dog(name: "Dachshund", image: #imageLiteral(resourceName: "dachshund")),
        Dog(name: "Husky", image: #imageLiteral(resourceName: "husky")),
        Dog(name: "German Shepherd", image: #imageLiteral(resourceName: "germanshepherd")),
        Dog(name: "Pug", image: #imageLiteral(resourceName: "pug"))
    ]
    
    static var singleSelection: String?
    static var multipleSelection: Set<String> = []
        
}
