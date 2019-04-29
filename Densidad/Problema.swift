//
//  Problema.swift
//  Densidad
//
//  Created by Hector de luna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class Problema: NSObject {
    
    var redaccion : String!
    var respuesta : Double!
    var titulo : String!
    var dificultad: String!
    
    init(titulo : String, redaccion : String, respuesta : Double, dificultad : String) {
        self.titulo = titulo
        self.redaccion = redaccion
        self.respuesta = respuesta
        self.dificultad = dificultad
    }
    

}
