//
//  Extension.swift
//  abc
//
//  Created by 陈羽如 on 2019/5/5.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func downloadAsyncForm(url:String){
        let urlNet = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlNet!)
        { (data, response, error) in
            if let nsd = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: nsd, scale: 1)
                    self.contentMode = .scaleAspectFit
                }
                
            }
        }
        task.resume()
    }
}
