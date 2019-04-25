//
//  ViewControllerEstudiar.swift
//  Densidad
//
//  Created by Rafael Serna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class ViewControllerEstudiar: UIViewController {

    @IBOutlet weak var imgTema: UIImageView!
    @IBOutlet weak var txtInformacion: UITextView!
    
    var titulo : String!
    var imagen : UIImage!
    var informacion : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //lblTituloTema.text = titulo
        imgTema.image = imagen
        txtInformacion.text = informacion
        self.title = titulo
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
