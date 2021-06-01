//
//  ViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 19/5/21.
//

import UIKit
import CardSlider

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class HomeScreen: UIViewController, UINavigationControllerDelegate, CardSliderDataSource {
    
    let urlString = "https://hp-api.herokuapp.com/api/characters"
    var dataTask: URLSessionDataTask?
    var data = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageP = getImage(from: "https://i.pinimg.com/736x/8b/ff/89/8bff8941157e5598ee4313e2faab1410.jpg") {
            data.append(Item(image: imageP, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: imageP, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: imageP, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: imageP, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let characterSliderController = CardSliderViewController.with(dataSource: self)
        
        addChild(characterSliderController)
        view.addSubview(characterSliderController.view)
        characterSliderController.didMove(toParent: self)
        characterSliderController.modalPresentationStyle = .fullScreen
    }
    
    func getImage(from string: String) -> UIImage? {
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
        data[index]
    }
    
    func numberOfItems() -> Int {
        data.count
    }
 
}




