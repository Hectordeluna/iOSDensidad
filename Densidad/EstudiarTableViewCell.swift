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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
