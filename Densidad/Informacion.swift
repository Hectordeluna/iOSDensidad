//
//  Informacion.swift
//  Densidad
//
//  Created by Hector de luna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class Informacion: NSObject {
    
    override init () {
        super.init()
    }
    
    func getTemas() -> [Tema] {
        var localTema = [Tema]()
        var problemas = [Problema]()
        var arrDiccionarios: NSArray!
        let path = Bundle.main.path(forResource: "Preguntas", ofType: "plist")
        arrDiccionarios = NSArray(contentsOfFile: path!)
        
        for i in 0...arrDiccionarios.count-1 {
            let dicc = arrDiccionarios[i] as! NSDictionary
            let nombre = (dicc.value(forKey: "nombre") as! String)
            let redaccion = (dicc.value(forKey: "redaccion") as! String)
            let imagen = (dicc.value(forKey: "imagen") as! String)
            
            var arrProblemas: NSArray!
            arrProblemas = (dicc.value(forKey: "Problemas") as! NSArray)
            for j in 0...arrProblemas.count-1 {
                let diccProblema = arrProblemas[j] as! NSDictionary
                let titulo = (diccProblema.value(forKey: "titulo") as! String)
                let redaccionP = (diccProblema.value(forKey: "redaccion") as! String)
                let respuesta = (diccProblema.value(forKey: "respuesta") as! Double)
                let dificultad = (diccProblema.value(forKey: "dificultad") as! String)
                
                let problema = Problema(titulo: titulo, redaccion: redaccionP, respuesta: respuesta, dificultad: dificultad)
                problemas.append(problema)
            }
            
            let tema = Tema(nombre: nombre, redaccion: redaccion, imagen: UIImage(named: imagen)!, problemas: problemas)
            
            localTema.append(tema)
            problemas.removeAll()
        }
        
        return localTema
/*
        problema = Problema(titulo: "Extra",redaccion: "Andrea (1) y Carolina (2) tienen cada una un cilindro y quieren saber cuál cilindro tiene mayor densidad. El cilindro de Andrea (1) pesa 320 g y tiene un volumen de 1050 cm³ mientras que el cilindro de Carolina (2) pesa 2000 g y tiene un volumen de 500 cm³. ¿Cuál cilindro tiene mayor densidad?", respuesta: 2)
        problemas.append(problema)
        problema = Problema(titulo: "Masa",redaccion: "Utiliza la fórmula de densidad para calcular la masa que tiene 24 litros de una sustancia y cuya densidad es 30(kg/L)", respuesta: 720)
        problemas.append(problema)
 
 */
    }
    
    
    
}
