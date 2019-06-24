//
//  Extension.swift
//  aaa
//
//  Created by 陈羽如 on 2019/4/26.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func loadFromNet(imageUrl: String){
        do{
            let url = URL(string: imageUrl)
            let nsdata = try Data(contentsOf: url!)
            self.image = UIImage(data: nsdata, scale: 1)
            self.contentMode = .scaleAspectFill
        }
        catch{
            
        }
    }
}
