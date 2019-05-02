//
//  TableViewControllerProblemas.swift
//  Densidad
//
//  Created by Rafael Serna on 3/24/19.
//  Copyright © 2019 Rafael Serna. All rights reserved.
//

import UIKit

class TableViewControllerProblemas: UITableViewController {
    
    var problemas = [Problema]()
    var tema: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.separatorStyle = .none
        self.title = tema

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return problemas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProblemasTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! ProblemasTableViewCell
        
        
        //let titulo = problemas[indexPath.row].titulo.components(separatedBy: " - ")
        //print(titulo)
        

        cell.lblTitulo3.text = problemas[indexPath.row].titulo
        cell.numero.text = String(describing: (indexPath.row + 1))
        cell.dificultad.text = problemas[indexPath.row].dificultad
        if problemas[indexPath.row].dificultad == "facil" {
            cell.viewColor.backgroundColor = UIColor(red: 127/255.0, green: 173/255.0, blue: 119/255.0, alpha: 1)
        }
        else if problemas[indexPath.row].dificultad == "medio" {
            cell.viewColor.backgroundColor = UIColor(red: 241/255.0, green: 197/255.0, blue: 49/255.0, alpha: 1)
        }
        else if problemas[indexPath.row].dificultad == "dificil" {
            cell.viewColor.backgroundColor = UIColor(red: 229/255.0, green: 115/255.0, blue: 89/255.0, alpha: 1)
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vista = segue.destination as! ViewControllerProblema
        if let index = tableView.indexPathForSelectedRow {
            vista.problemas.append(problemas[index.row])
            vista.tema = problemas[index.row].titulo
            
        }
    }
    

}
