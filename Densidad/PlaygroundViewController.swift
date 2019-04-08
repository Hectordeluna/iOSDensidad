//
//  PlaygroundViewController.swift
//  Densidad
//
//  Created by Eduardo Toraya on 4/7/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class PlaygroundViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // Labels y slider
    
    @IBOutlet weak var Contenedor: UIView!
    @IBOutlet weak var pslider: UISlider!
    @IBOutlet weak var pdensidad: UILabel!
    @IBOutlet weak var pmasa: UILabel!
    @IBOutlet weak var pvolumen: UILabel!
    
    

    var Colores = [UIColor.gray, UIColor.red, UIColor.green, UIColor.orange, UIColor.blue, UIColor.yellow]
    
    var nombres = ["Agua", "Mercurio"]
    
    var sustancias = [Sustancia]()
    
    var densidad: Double!
    var volumen: Double!
    var masa: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let o1 = Sustancia(color: UIColor.blue, nombre: "Agua", densidad: 1.0)
        let o2 = Sustancia(color: UIColor.gray, nombre: "Mercurio", densidad: 5.427)
        sustancias.append(o1)
        sustancias.append(o2)
        volumen = 200
        masa = 0
        densidad = 1
        pdensidad.text = String(densidad)
        pmasa.text = String(masa)
        pvolumen.text = String(volumen)
        Contenedor.backgroundColor = UIColor.blue
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Mueve(_ sender: UISlider) {
        volumen = Double(CGFloat(sender.value) * self.view.frame.size.width)
        pvolumen.text? = String(masa)
        
        masa = densidad*volumen
        pmasa.text = String(masa)
        
        //Contenedor.backgroundColor
    }
    
    //TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sustancias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = sustancias[indexPath.row].color.withAlphaComponent(0.75)
        cell.textLabel?.text =  sustancias[indexPath.row].nombre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pdensidad.text = String(sustancias[indexPath.row].densidad)
        densidad = sustancias[indexPath.row].densidad
        
        masa = densidad*volumen
        pmasa.text = String(masa)
        
        Contenedor.backgroundColor = sustancias[indexPath.row].color
    }
    



    
//
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = sustancias[fromIndexPath.row]
        sustancias[fromIndexPath.row] = sustancias[to.row]
        sustancias[to.row] = temp
    }
//
//
//
//    // Override to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
   }
//
//    //HEIGHT
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
//
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}