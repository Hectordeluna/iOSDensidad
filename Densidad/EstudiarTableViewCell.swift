//
//  EstudiarTableViewCell.swift
//  Densidad
//
//  Created by Rafael Serna on 4/8/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class EstudiarTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblTitulo2: UILabel!
    @IBOutlet weak var lblTitulo3: UILabel!
    @IBOutlet weak var viewBg: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBg.layer.cornerRadius = 10
        viewBg.layer.borderWidth = 0
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
