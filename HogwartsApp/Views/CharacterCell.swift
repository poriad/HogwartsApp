//
//  CharacterCell.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 1/7/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterInfo: UILabel!
    @IBOutlet var characterButton: UIButton!
    var colorForCellSelected: UIColor!
    var messageForButton: String!
    
    weak var navigationController: UINavigationController?
    
    @IBAction func showMoreDetails(sender: AnyObject) {
        let alertController = UIAlertController(title: "Details", message: messageForButton, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = colorForCellSelected
            characterButton.backgroundColor = .white
            characterButton.tintColor = colorForCellSelected
            
            characterName.textColor = .white
            
            characterInfo.textColor = .white
            
            characterImage.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        } else {
            contentView.backgroundColor = .white
            characterButton.backgroundColor = colorForCellSelected
            characterButton.tintColor = .white
            
            characterName.textColor = colorForCellSelected
            
            characterInfo.textColor = .black
            
            characterImage.layer.borderColor = colorForCellSelected.cgColor
        }
    }
    
}
