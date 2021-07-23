//
//  HouseDetailControllerTableViewController.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 27/6/21.
//

import UIKit

class HouseDetailController: UITableViewController {
    
    var characters: [Character]?
    
    var colorCell: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 160
        tableView.backgroundView = UIImageView(image: UIImage(named: "AnotherWallpaper"))
        tableView.rowHeight = UITableView.automaticDimension
        
        title = characters?[0].house
        
        tableView.tableFooterView = UIView()
        tableView.separatorColor = colorCell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let characters = characters else {
            fatalError("Not Working")
        }
        
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else {
            fatalError("Cells not working")
        }
        
        cell.characterButton.setTitle("More Details...", for: .normal)
        cell.characterButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        cell.characterButton.backgroundColor = colorCell
        cell.characterButton.titleLabel?.numberOfLines = 0
        cell.characterButton.layer.cornerRadius = 10.00
        cell.characterButton.tintColor = .white
        
        if let imageCharacters = ImageUtils.getImage(from: characters![indexPath.row].image) {
            cell.characterImage.image = imageCharacters
        } else {
            cell.characterImage.image = ImageUtils.getImage(from: "https://i.pinimg.com/736x/3d/72/9c/3d729c2339f5a88643944ccea827cd20.jpg")
        }
        
        cell.characterImage.layer.borderColor = colorCell.cgColor
        cell.characterImage.layer.borderWidth = 1.5
        
        cell.characterName.attributedText = NSAttributedString(string: characters?[indexPath.row].name ?? "Not found", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        cell.characterName.textColor = colorCell
        cell.characterInfo.text = """
Actor: \(characters![indexPath.row].actor)
Specie: \(characters![indexPath.row].species.capitalizingFirstLetter())
Date of Birth: \(characters![indexPath.row].dateOfBirth.isEmpty ? "Unknown" : characters![indexPath.row].dateOfBirth)
Ancestry: \(characters![indexPath.row].ancestry.isEmpty ? "Unknown" : characters![indexPath.row].ancestry.capitalizingFirstLetter())
Patronus: \(characters![indexPath.row].patronus.isEmpty ? "Unknown" : characters![indexPath.row].patronus.capitalizingFirstLetter())
"""
        cell.characterInfo.addInterlineSpacing(spacingValue: 6)
        
        // Info to Send
        cell.colorForCellSelected = colorCell
        cell.navigationController = self.navigationController
        cell.messageForButton = """
            Hair Color: \(characters![indexPath.row].hairColour)
            Eye Color: \(characters![indexPath.row].eyeColour)
            Alive: \(characters![indexPath.row].alive == true ? "Yes" : "No")
            """
    
        if (characters![indexPath.row].hogwartsStudent == true) {
            cell.messageForButton.append("\nHogwarts Student: Yes")
        }
        
        if (characters![indexPath.row].hogwartsStaff == true) {
            cell.messageForButton.append("\nHogwarts Staff: Yes")
        }
        
        return cell
    }
}
