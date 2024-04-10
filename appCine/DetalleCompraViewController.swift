//
//  DetalleCompraViewController.swift
//  appCine
//
//  Created by David Barzola on 10/04/24.
//

import UIKit

class DetalleCompraViewController: UIViewController {
    @IBOutlet weak var cliente: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var pelicula: UILabel!
    @IBOutlet weak var adultos: UILabel!
    @IBOutlet weak var niños: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var montoA: UILabel!
    @IBOutlet weak var montoN: UILabel!
    @IBOutlet weak var total: UILabel!
    
    var pel: Pelicula!
    var cli: String = ""
    var a: Int = 0
    var n: Int = 0
    var montoa: Double = 0
    var monton: Double = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cliente.text = "Cliente: " + cli
        genero.text = "Genero: " + pel.genero
        pelicula.text = "Pelicula: "  + pel.nombre
        adultos.text = "Asientos Adultos: " + String(a)
        niños.text = "Asientos Niños: " + String(n)
        img.image = UIImage(named: pel.imagen)
        montoa = pel.precio * Double(a)
        monton = (pel.precio - 10) * Double(n)
        montoA.text = "Monto Adulto: " + String(montoa)
        montoN.text = "Monto Niño: " + String(monton)
        total.text = "Monto Total: " + String(montoa + monton)
        
        
        
   
    }
    
    @IBAction func volver(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    

}
