//
//  ViewControllerExamen.swift
//  Densidad
//
//  Created by Hector de luna on 4/7/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class ViewControllerExamen: UIViewController, examenProblem {

    var temas = [Tema]()
    var problemas = [Problema]()
    var problemasResueltos = [Problema]()
    var info : Informacion!
    
    @IBOutlet weak var lbPuntaje: UILabel!
    @IBOutlet weak var lbCalif: UILabel!
    
    @IBOutlet weak var btInicio: UIButton!
    
    var cantidad = 5
    var puntaje : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        info = Informacion()
        temas = info.getTemas()
        for tema in temas {
            problemas += tema.problemas
        }
        btInicio.layer.cornerRadius = 10
        btInicio.layer.borderWidth = 0
        
        lbCalif.layer.cornerRadius = 10
        lbCalif.layer.borderWidth = 0
    }
    
    func calificacion(calif : Double) {
        puntaje = round(calif)
        lbCalif.text = String(describing: puntaje!)
        /*
        if puntaje < 70 {
            lbCalif.backgroundColor = .red
        }
        else {
            lbCalif.backgroundColor = .green
        }
        */
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista = segue.destination as! ViewControllerProblema
        
        if (problemas.count <= 0) {
            for tema in temas {
                problemas += tema.problemas
            }
        }
        var i = 0
        while i < cantidad && problemas.count > 0 {
            let rnd = Int.random(in: 0 ... problemas.count - 1)
            vista.problemas.append(problemas[rnd])
            problemasResueltos.append(problemas[rnd])
            problemas.remove(at: rnd)
            i = i + 1
        }
        vista.examen = true
        vista.delegate = self
        
    }
    

}
