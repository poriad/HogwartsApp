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

class ViewController: UIViewController, CardSliderDataSource {
    
    var characters = [Character]()
    var data = [Item]()
    var imageP : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = getImage(from: "https://hp-api.herokuapp.com/images/harry.jpg") {
            data.append(Item(image: image, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: image, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: image, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
            data.append(Item(image: image, rating: nil, title: "Hola", subtitle: "Adios", description: "Vaya descripcion nano"))
        }
       
        
        
        let urlString = "https://hp-api.herokuapp.com/api/characters"
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Welcome!"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Characters.self, from: json) {
            characters = jsonPetitions.characters
            print(characters)
        }
        
    }
    
    func getImage(from string: String) -> UIImage? {
        //2. Get valid URL
        guard let url = URL(string: string)
            else {
                print("Unable to create URL")
                return nil
        }

        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url, options: [])

            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }

        return image
    }
    
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        data.count
    }
}




