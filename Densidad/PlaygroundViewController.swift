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
    
    @IBOutlet weak var Figura: UIView!
    @IBOutlet weak var pslider: UISlider!
    @IBOutlet weak var pdensidad: UILabel!
    @IBOutlet weak var pmasa: UILabel!
    @IBOutlet weak var pvolumen: UILabel!
    
    @IBOutlet weak var labelVolCalc: UILabel!
    @IBOutlet weak var labelMasaCalc: UILabel!
    

    var Colores = [UIColor.gray, UIColor.red, UIColor.green, UIColor.orange, UIColor.blue, UIColor.yellow]
    
    var nombres = ["Agua", "Mercurio", "Madera", "Fierro", "Plomo", "Oro", "Marmol"]
    
    var sustancias = [Sustancia]()
    
    var densidad: Double!
    var volumen: Double!
    var masa: Double!
    
    var number1: Int!
    var number2: Int!
    var number3: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let o1 = Sustancia(color: UIColor.blue, nombre: "Agua", densidad: 1.00)
        let o2 = Sustancia(color: UIColor.gray, nombre: "Mercurio", densidad: 5.43)
        let o3 = Sustancia(color: UIColor.yellow, nombre: "Oro", densidad: 19.30)
        let o4 = Sustancia(color: UIColor.brown, nombre: "Madera", densidad: 0.50)
        let o5 = Sustancia(color: UIColor.darkGray, nombre: "Fierro", densidad: 7.80)
        let o6 = Sustancia(color: UIColor.gray, nombre: "Plomo", densidad: 11.40)
        let o7 = Sustancia(color: UIColor.orange, nombre: "Marmol", densidad: 2.60)
        
        sustancias.append(o1)
        sustancias.append(o2)
        sustancias.append(o3)
        sustancias.append(o4)
        sustancias.append(o5)
        sustancias.append(o6)
        sustancias.append(o7)
        
        
        volumen = 200
        masa = 200
        densidad = 1
        pdensidad.text = String(densidad)
        pmasa.text = String(masa)
        pvolumen.text = String(volumen)
        Figura.backgroundColor = UIColor.blue
        
        number1 = Int.random(in: 0 ..< 375)
        labelVolCalc.text = "V= " + String(number1)
        number2 = Int.random(in: 0 ..< 6)
        labelMasaCalc.text = "M = " + String(format: "%.2f",Double(number1)*sustancias[number2].densidad)
        number3 = Double(number1)*sustancias[number2].densidad
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CambiaProblema(_ sender: UIButton) {
        number1 = Int.random(in: 0 ..< 375)
        labelVolCalc.text = "V= " + String(number1)
        number2 = Int.random(in: 0 ..< 6)
        labelMasaCalc.text = "M = " + String(format: "%.2f",Double(number1)*sustancias[number2].densidad)
        number3 = Double(number1)*sustancias[number2].densidad
    }
    
    @IBAction func Prueba(_ sender: UIButton) {
        if(number3 < 0.98*masa || number3 > 1.02*masa){
            let alert = UIAlertController(title: "Respuesta Incorrecta! Intentalo de nuevo", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Respuesta correcta!", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            number1 = Int.random(in: 0 ..< 375)
            labelVolCalc.text = "V= " + String(number1)
            number2 = Int.random(in: 0 ..< 6)
            labelMasaCalc.text = "M = " + String(format: "%.2f",Double(number1)*sustancias[number2].densidad)
            number3 = Double(number1)*sustancias[number2].densidad
        }
}
    
    
    
    @IBAction func Mueve(_ sender: UISlider) {
        volumen = Double(CGFloat(sender.value) * self.view.frame.size.width)
        pvolumen.text? = String(format: "%.2f", volumen)
        
        masa = densidad*volumen
        pmasa.text = String(format: "%.2f", masa)
        
        
        Figura.frame.origin.x = (Contenedor.frame.size.width / 2) - ((Contenedor.frame.size.width / 2) * CGFloat(sender.value))
         Figura.frame.origin.y = (Contenedor.frame.size.height / 2) - ((Contenedor.frame.size.height / 2) * CGFloat(sender.value))
        Figura.frame.size.height = Contenedor.frame.size.height * CGFloat(sender.value)
        Figura.frame.size.width = Contenedor.frame.size.width * CGFloat(sender.value)
        
        
        //Contenedor.backgroundColor
    }
    
    //TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sustancias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = sustancias[indexPath.row].color.withAlphaComponent(0.75)
        cell.textLabel?.text =  sustancias[indexPath.row].nombre + ", D = " + String(format: "%.2f",sustancias[indexPath.row].densidad)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pdensidad.text = String(sustancias[indexPath.row].densidad)
        densidad = sustancias[indexPath.row].densidad
        
        masa = densidad*volumen
        pmasa.text = String(masa)
        
        Figura.backgroundColor = sustancias[indexPath.row].color
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
        return 50
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
