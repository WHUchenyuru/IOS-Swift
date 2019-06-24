//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by 陈羽如 on 2019/4/12.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {

    var font: UIFont!
    var favorite: Bool = false
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv" + "WwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite
    }
    
    @IBAction func sliderFontSize(_ sender: UISlider) {
        let newSize = roundf(sender.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(_ sender: UISwitch) {
        let favoriteList = FavoritesList.sharedFavoritesList
        if sender.isOn{
            favoriteList.addFavorite(fontName: font.fontName)
        }else{
            favoriteList.removeFavorite(fontName: font.fontName)
        }
    }
    
}
