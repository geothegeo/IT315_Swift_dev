//
//  ViewController.swift
//  Patriot Cats Cafe
//
//  Created by user155347 on 10/28/19.
//  This App is developed as an educational project. Certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidlines and are restricted from further use
//  Copyright © 2019 Learning Mobile Apps. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var catSound: AVAudioPlayer!
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtSex: UILabel!
    @IBOutlet weak var txtAge: UILabel!
    @IBOutlet weak var txtDescription: UILabel!

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var imgCats: UIImageView!
    
    @IBAction func btnRandCat(_ sender: Any) {
        setUI()
        catSound.play()
    }
    
    @IBAction func btnLink(_ sender: Any) {
        let app = UIApplication.shared
        let urlAddress = "https://www.patriotpawsabilities.com"
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeArray()
        catSound = try?
        AVAudioPlayer(contentsOf:  URL(fileURLWithPath:Bundle.main.path(forResource: "cat_meow2", ofType: "wav")!))
        setUI()
    }

    func setUserElements() {
        let selectedCat = catObjectArray.randomElement()
        lblName.text = selectedCat?.name
        lblSex.text = selectedCat?.sex
        lblAge.text = selectedCat?.age
        imgCats.image = selectedCat?.image
        lblDescription.text = selectedCat?.description
        if imgCats.alpha == 0 {
            UIView.animate(withDuration: 3.0,
                           animations: {
                            self.txtName.alpha = 1.0
                            self.txtSex.alpha = 1.0
                            self.txtAge.alpha = 1.0
                            self.txtDescription.alpha = 1.0
                            self.imgCats.alpha = 1.0
                            self.lblName.alpha = 1.0
                            self.lblSex.alpha = 1.0
                            self.lblAge.alpha = 1.0
                            self.lblDescription.alpha = 1.0
            })
        }
    }
    
    func setUI() {
        setUserElements()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        txtName.alpha = 0
        txtSex.alpha = 0
        txtAge.alpha = 0
        txtDescription.alpha = 0
        imgCats.alpha = 0
        lblName.alpha = 0
        lblSex.alpha = 0
        lblAge.alpha = 0
        lblDescription.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setUI()
    }
    var catObjectArray = [PatriotCats]()
    
    func initializeArray() {
        
        let cat1 = PatriotCats(CatName: "Matilda", CatImage: "CatImg/Cat1.JPEG")
        catObjectArray.append(cat1)
        cat1.sex = "Female"
        cat1.age = "2 years"
        cat1.description = "Shiny Black, short-hair"
        
        let cat2 = PatriotCats(CatName: "Greywind", CatImage: "CatImg/Cat2.JPEG")
        catObjectArray.append(cat2)
        cat2.sex = "Female"
        cat2.age = "1 year"
        cat2.description = "Gray and white, short-hair"
        
        let cat3 = PatriotCats(CatName: "Camilla", CatImage: "CatImg/Cat3.JPG")
        catObjectArray.append(cat3)
        cat3.sex = "Female"
        cat3.age = "2 years"
        cat3.description = "Gray and white, short-hair"
    }
    
}

