//
//  ImageUtils.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 2/6/21.
//

import UIKit

class ImageUtils {
    
    static func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string)
            else {
                print("Unable to create URL")
                return nil
        }

        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }

        return image
    }
}
