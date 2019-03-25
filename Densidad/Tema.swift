//
//  Tema.swift
//  Densidad
//
//  Created by Hector de luna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class Tema: NSObject {

    var nombre : String!
    var redaccion : String!
    var imagen : UIImage!
    var problemas = [Problema]()
    
    init (nombre : String, redaccion : String, imagen : UIImage, problemas : [Problema]) {
        self.nombre = nombre
        self.redaccion = redaccion
        self.imagen = imagen
        self.problemas = problemas
    }
    
}
