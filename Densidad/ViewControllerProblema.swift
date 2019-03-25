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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
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
