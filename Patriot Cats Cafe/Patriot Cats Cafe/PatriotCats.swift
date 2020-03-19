//
//  PatriotCats.swift
//  Patriot Cats Cafe
//
//  Created by user155347 on 10/28/19.
//  Copyright © 2019 Learning Mobile Apps. All rights reserved.
//

import Foundation
import UIKit
class PatriotCats {
    var name:String = ""
    var sex:String = ""
    var age:String = ""
    var description:String = ""
    var image = UIImage()
    init() {
        name = "Unnamed"
    }
    init(CatName:String, CatImage:String) {
        name = CatName
        image = UIImage(named: CatImage) ?? UIImage()
    }
}
