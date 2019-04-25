//
//  SimuladorTableViewCell.swift
//  Densidad
//
//  Created by Rafael Serna on 4/25/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class SimuladorTableViewCell: UITableViewCell {

    @IBOutlet weak var vColor: UIView!
    @IBOutlet weak var lblNombre: UILabel!
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
