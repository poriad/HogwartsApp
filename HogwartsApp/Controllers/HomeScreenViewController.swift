//
//  ViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 19/5/21.
//

import UIKit
import CardSlider

class HomeScreenViewController: UIViewController, UINavigationControllerDelegate, CardSliderDataSource {
    
    let urlString = "https://hp-api.herokuapp.com/api/characters"
    var dataTask: URLSessionDataTask?
    var data = [Item]()
    var colors = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageP = ImageUtils.getImage(from: "https://i.pinimg.com/736x/8b/ff/89/8bff8941157e5598ee4313e2faab1410.jpg") {
            data.append(Item(image: imageP, rating: 4, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: imageP, rating: 3, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: imageP, rating: 2, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
        }
        if let imageTwo = ImageUtils.getImage(from: "https://wallpaperboat.com/wp-content/uploads/2019/06/harry-potter-19-1.jpg") {
            data.append(Item(image: imageTwo, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let characterSliderController = CardSliderViewController.with(dataSource: self)
        
        addChild(characterSliderController)
        view.addSubview(characterSliderController.view)
        characterSliderController.didMove(toParent: self)
        characterSliderController.modalPresentationStyle = .automatic
    }

    func loadCharacters() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Request failed: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            guard let content = String(data: data, encoding: .utf8) else {
                print("Content decoding failed")
                return
            }
            
            print("Request successful: \(content)")
            
            // If we need to update the UI with the content we must do it on the main thread
//            DispatchQueue.main.async {
//                updateUI()
//            }
        }.resume()
    }

    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        data.count
    }
 
}




