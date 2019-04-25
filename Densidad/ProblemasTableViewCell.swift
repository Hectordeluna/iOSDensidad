//
//  ProblemasTableViewCell.swift
//  Densidad
//
//  Created by Hector de luna on 4/25/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class ProblemasTableViewCell: UITableViewCell {

    @IBOutlet weak var dificultad: UILabel!
    @IBOutlet weak var numero: UILabel!
    @IBOutlet weak var lblTitulo3: UILabel!
    @IBOutlet weak var viewBg: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.layer.cornerRadius = 10
        viewBg.layer.borderWidth = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
