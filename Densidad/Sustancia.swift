//
//  Sustancia.swift
//  Densidad
//
//  Created by Eduardo Toraya on 4/7/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class Sustancia: NSObject {

    var color: UIColor!
    var nombre: String!
    var densidad: Double!
    
    init (color : UIColor, nombre : String, densidad: Double) {
        self.color = color
        self.nombre = nombre
        self.densidad = densidad
        
    }
}
