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

extension String {
    var expression: NSExpression {
        return NSExpression(format: self)
    }
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
    
    
    var masa : Double!
    var longitud : Double!
    var densidad : Double!
    var area : Double!
    var ancho : Double!
    var volumen : Double!
    var altura : Double!
    var radio : Double!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cargarPregunta()
        self.title = tema
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
        if let num = Double(tfRespuesta.text!) {
            if (num >= respuesta * 0.99 && num <= respuesta * 1.01) {
                if examen {
                    puntaje = puntaje + Double((100.0 / Double(problemas.count)))
                    print(puntaje)
                    numero = numero + 1
                    tfRespuesta.text = ""
                    cargarPregunta()
                } else {
                let alert = UIAlertController(title: "Respuesta correcta!", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                }
            } else {
                if examen {
                    numero = numero + 1
                    tfRespuesta.text = ""
                    cargarPregunta()
                } else {
                let alert = UIAlertController(title: "Respuesta incorrecta!", message: "Vuelvelo a intentar!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Intentar", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                }
            }
        }
    }
    
    func obtenerObjeto() -> String {
        
        let objetos = ["un rectangulo","un cuadrado","una esfera","un circulo","un objeto"]

        let rnd = Int.random(in: 0 ... (objetos.count - 1))
        return objetos[rnd]
    }
    
    func cargarPregunta() {
        if (numero >= problemas.count) {
            self.delegate?.calificacion(calif: puntaje)
            dismiss(animated: true, completion: nil)
            return
        }
        
        var redaccion = problemas[numero].redaccion!
        
        masa = Double(Int.random(in: 1 ... 21))
        longitud = Double(Int.random(in: 1 ... 21))
        densidad = Double(Int.random(in: 1 ... 21))
        area = Double(Int.random(in: 1 ... 21))
        ancho = Double(Int.random(in: 1 ... 21))
        volumen = Double(Int.random(in: 1 ... 21))
        altura = Double(Int.random(in: 1 ... 21))
        radio = Double(Int.random(in: 1 ... 21))


        let diccionario = ["{m}": masa, "{l}" : longitud, "{d}" : densidad, "{a}" : area, "{n}" : ancho, "{v}" : volumen, "{h}" : altura, "{x}" : radio]
        
        
        var formulaValue = problemas[numero].formula!
        for (originalWord, newWord) in diccionario {
            formulaValue = formulaValue.replacingOccurrences(of:originalWord, with:String(format:"%f", newWord!), options: .literal, range: nil)
        }
        
        let expresion = NSExpression(format: formulaValue)
        print(expresion)

        if let resultado = expresion.expressionValue(with: nil, context: nil) as? Double {
            respuesta = resultado
            print(respuesta)
        }
        /*
        if let resultado = problemas[numero].formula.expression.expressionValue(with: diccionario, context: nil) as? Double {
            
        }*/
        
        for (originalWord, newWord) in diccionario {
            redaccion = redaccion.replacingOccurrences(of:originalWord, with:String(format:"%.2f", newWord!), options: .literal, range: nil)
        }
        redaccion = redaccion.replacingOccurrences(of:"{o}", with:obtenerObjeto(), options: .literal, range: nil)

        txtPregunta.text = redaccion
        //respuesta = problemas[numero].respuesta
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
