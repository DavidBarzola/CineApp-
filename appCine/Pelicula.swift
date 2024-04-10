//
//  pelicula.swift
//  appCine
//
//  Created by David Barzola on 10/04/24.
//

import UIKit

class Pelicula: NSObject {
    var nombre:String
    var imagen:String
    var genero:String
    var precio:Double
    
    init(nombre: String, imagen: String, genero: String, precio: Double) {
        self.nombre = nombre
        self.imagen = imagen
        self.genero = genero
        self.precio = precio
    }
}
