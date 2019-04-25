//
//  ViewControllerProblema.swift
//  Densidad
//
//  Created by Rafael Serna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

protocol examenProblem {
    func calificacion(calif : Double)
}

class ViewControllerProblema: UIViewController {

    @IBOutlet weak var imgProblema: UIImageView!
    @IBOutlet weak var txtPregunta: UITextView!
    @IBOutlet weak var tfRespuesta: UITextField!
    @IBOutlet weak var lblSolucion: UILabel!
    
    var tema: String!
    var problemas = [Problema]()
    var pregunta : String!
    var respuesta : Double!
    
    var numero = 0
    var examen = false
    var puntaje = 0.0
    
    var delegate : examenProblem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cargarPregunta()
        self.title = tema
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
        if let num = Double(tfRespuesta.text!) {
            if num == respuesta {
                if examen {
                    puntaje = puntaje + Double((100.0 / Double(problemas.count)))
                    print(puntaje)
                    numero = numero + 1
                    cargarPregunta()
                } else {
                let alert = UIAlertController(title: "Respuesta correcta!", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                }
            } else {
                if examen {
                    numero = numero + 1
                    cargarPregunta()
                } else {
                let alert = UIAlertController(title: "Respuesta incorrecta!", message: "Vuelvelo a intentar!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Intentar", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                }
            }
        }
    }
    
    func cargarPregunta() {
        if (numero >= problemas.count) {
            self.delegate?.calificacion(calif: puntaje)
            dismiss(animated: true, completion: nil)
            return
        }
        
        txtPregunta.text = problemas[numero].redaccion
        respuesta = problemas[numero].respuesta
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if examen {
            let vista = segue.destination as! ViewControllerExamen
            vista.puntaje = puntaje
        }
    }
    

}
