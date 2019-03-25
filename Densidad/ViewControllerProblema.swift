//
//  ViewControllerProblema.swift
//  Densidad
//
//  Created by Rafael Serna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class ViewControllerProblema: UIViewController {

    @IBOutlet weak var imgProblema: UIImageView!
    @IBOutlet weak var txtPregunta: UITextView!
    @IBOutlet weak var tfRespuesta: UITextField!
    @IBOutlet weak var lblSolucion: UILabel!
    
    var pregunta : String!
    var respuesta : Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtPregunta.text = pregunta
        lblSolucion.text = String(describing: respuesta)
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
        if let num = Double(tfRespuesta.text!) {
            if num == respuesta {
                let alert = UIAlertController(title: "Respuesta correcta!", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Respuesta incorrecta!", message: "Vuelvelo a intentar!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Intentar", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
