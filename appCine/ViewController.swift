//
//  ViewController.swift
//  appCine
//
//  Created by David Barzola on 10/04/24.
//

import UIKit
import DropDown
import Toaster


class ViewController: UIViewController {

    @IBOutlet weak var cliente: UITextField!
    @IBOutlet weak var comedia: UIButton!
    @IBOutlet weak var drama: UIButton!
    @IBOutlet weak var adultos: UITextField!
    @IBOutlet weak var niños: UITextField!
    
    var dropDown = DropDown()
    var peliculas: [Pelicula] = []
    var pelicula : Pelicula!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peliculas.append(Pelicula(nombre: "super cool", imagen: "p00", genero: "comedia", precio: 35.5))
        peliculas.append(Pelicula(nombre: "que paso ayer?", imagen: "p01", genero: "comedia", precio: 32.5))
        peliculas.append(Pelicula(nombre: "lo simposible", imagen: "p10", genero: "drama", precio: 35.5))
        peliculas.append(Pelicula(nombre: "12 years of esclavitud", imagen: "p11", genero: "drama", precio: 28.3))
        peliculas.append(Pelicula(nombre: "historias cruzadas", imagen: "p34", genero: "drama", precio: 25.5))
        
        comedia.setImage(UIImage(named: "radio_off"), for: .normal)
        comedia.setImage(UIImage(named: "radio_on"), for: .selected)
        drama.setImage(UIImage(named: "radio_off"), for: .normal)
        drama.setImage(UIImage(named: "radio_on"), for: .selected)
        
    }

    @IBAction func peliculas(_ sender: UIButton) {
        
        dropDown.anchorView = sender
        dropDown.show()
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setTitle(item, for: .normal)
            
            for p in peliculas {
                if p.nombre == item {
                    pelicula = p
                    break
                }
            }
        }
    }
    
    @IBAction func generos(_ sender: UIButton) {
        var pel: [String] = []
        if sender == comedia {
            comedia.isSelected = true
            drama.isSelected = false
            
            for p in peliculas {
                if p.genero == "comedia" {
                    pel.append(p.nombre)
                }
            }
        }
        else {
            comedia.isSelected = false
            drama.isSelected = true
            
            for p in peliculas {
                if p.genero == "drama" {
                    pel.append(p.nombre)
                }
            }
        }
        
        dropDown.dataSource = pel
    }
    
    @IBAction func procesar(_ sender: UIButton) {
        
        performSegue(withIdentifier: "procesar", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
            var p = segue.destination as! DetalleCompraViewController
        p.cli = cliente.text ?? " "
        p.a = Int(adultos.text ?? " ") ?? 0
        p.n = Int(niños.text ?? " ") ?? 0
        p.pel = pelicula
        
    }
    
}

