//
//  CollectionViewTableViewCell.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

     static let identifier = "CollectionViewTableViewCell"

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.backgroundColor = .systemIndigo
     }

     required init?(coder: NSCoder) {
         fatalError()
     }

     /*
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }*/

 }
