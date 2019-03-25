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
        var problema = Problema(titulo: "1 - Juan - Facil",redaccion: "Juan trabaja en un laboratorio calculando la densidad de ciertos objetos. Él tiene que calcular la densidad de un objeto cuyo peso es 350(g) y su capacidad es de 700 (cm³) ¿Cuál es la densidad del objeto?", respuesta: 0.33)
        problemas.append(problema)
        problema = Problema(titulo: "2 - Cilindro - Medio",redaccion: "Un cilindro tiene un diámetro de 15(cm) y una altura de 14(cm), mientras que la masa del líquido que contiene es de 250(g). Calcula su densidad", respuesta: 0.32)
        problemas.append(problema)
        var tema = Tema(nombre: "Densidad", redaccion: "La densidad sirve para comparar la cantidad de masa en un volumen específico.", imagen: UIImage(named: "DensidadFormula")!, problemas: problemas)
        localTema.append(tema)
        
        problemas = [Problema]()
        
        problema = Problema(titulo: "1 - Daniel - Dificil",redaccion: "Daniel lleva una lata llena de un líquido. La lata tiene un diámetro de 12(cm) y una altura de 17(cm), mientras que la masa del líquido es de 400(g). Calcula su densidad relativa.", respuesta: 0.37)
        problemas.append(problema)
        
        var tema2 = Tema(nombre: "Densidad relativa", redaccion: "La densidad relativa sirve para comparar la densidad de un objeto o sustancia con la de referencia que en la mayoría de los casos es la densidad del agua que se utiliza como punto de referencia.", imagen: UIImage(named: "DensidadRelativa")!, problemas: problemas)
            localTema.append(tema2)
        return localTema
/*
        problema = Problema(titulo: "Extra",redaccion: "Andrea (1) y Carolina (2) tienen cada una un cilindro y quieren saber cuál cilindro tiene mayor densidad. El cilindro de Andrea (1) pesa 320 g y tiene un volumen de 1050 cm³ mientras que el cilindro de Carolina (2) pesa 2000 g y tiene un volumen de 500 cm³. ¿Cuál cilindro tiene mayor densidad?", respuesta: 2)
        problemas.append(problema)
        problema = Problema(titulo: "Masa",redaccion: "Utiliza la fórmula de densidad para calcular la masa que tiene 24 litros de una sustancia y cuya densidad es 30(kg/L)", respuesta: 720)
        problemas.append(problema)
 
 */
    }
    
    
    
}
