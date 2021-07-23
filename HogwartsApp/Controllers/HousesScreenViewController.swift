//
//  HousesScreenViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 2/6/21.
//

import UIKit

class HousesScreenViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var houseCell: [House] = [
        House(name: "Gryffindor", image: UIImage(named: "Gryffindor")!),
        House(name: "Slytherin", image: UIImage(named: "Slytherin")!),
        House(name: "Ravenclaw", image: UIImage(named: "Ravenclaw")!),
        House(name: "Hufflepuff", image: UIImage(named: "Hufflepuff")!)
    ]
    
    
    
    var colorCell: [String] = ["#b6252aff","#009042ff","#5b92bdff","#d3b23aff"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Houses"
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houseCell.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HouseCell", for: indexPath) as? HouseCell else {
            fatalError("Dequeue Cell Failed")
        }
        cell.houseName.backgroundColor = UIColor.white
        cell.houseName.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);
        cell.houseImage.image = houseCell[indexPath.item].image
        cell.houseName.attributedText = getAttributedTextWithOutline(text: houseCell[indexPath.item].name, outlineColor: UIColor.black, insideColor: UIColor(hex: colorCell[indexPath.item])!)
        cell.layer.cornerRadius = 100
        cell.layer.backgroundColor = UIColor(hex: colorCell[indexPath.item])?.cgColor
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

            //Briefly fade the cell on selection
            UIView.animate(withDuration: 0.3,
                           animations: {
                            //Fade-out
                            cell?.transform = CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95)
            }) { (completed) in
                UIView.animate(withDuration: 0.3,
                               animations: {
                                //Fade-out
                                cell?.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                })
            }
        
        if let vc = storyboard?.instantiateViewController(identifier: "CharacterTableView") as? HouseDetailController {
        
            HarryPortterAPI.shared.loadCharacterByhouse(house: houseCell[indexPath.item].name) { responseObject, error in
                
                guard let charactersByHouse = responseObject else {
                    print(error.debugDescription)
                    return
                }
                vc.characters = charactersByHouse
                vc.colorCell = UIColor(hex: self.colorCell[indexPath.item])
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: (collectionView.bounds.width - 30), height: 350)
            return cellSize
    }
    
    func getAttributedTextWithOutline(text: String, outlineColor: UIColor, insideColor: UIColor, strokeWidth: Double? = -2.00) -> NSAttributedString {
        let attrString = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.strokeColor: outlineColor,
                NSAttributedString.Key.foregroundColor: insideColor,
                NSAttributedString.Key.strokeWidth: strokeWidth!,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)
            ]
        )
        
        return attrString
    }
    
}
