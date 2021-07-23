//
//  HousesScreenViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 1/6/21.
//

import UIKit
import CollectionViewPagingLayout

class CharactersScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var prueba: [String] = ["3gjN2Y","prueba2","apple-iphone-wallpaper-harry-potter","prueba2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView(){

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        prueba.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CharactersCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell")
        }
        cell.imageCollectionViewCell.contentMode = UIView.ContentMode.scaleAspectFit
        cell.imageCollectionViewCell.clipsToBounds = true
        cell.imageCollectionViewCell.image = UIImage(named: prueba[indexPath.row])
        cell.imageCollectionViewCell.layer.cornerRadius = 50.0
        
        return cell
    }

}
