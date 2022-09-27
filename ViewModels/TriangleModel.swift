//
//  TriangleModel.swift
//  Triangulos
//
//  Created by Emilio Y Martinez on 26/09/22.
//

import Foundation
// MARK: -generando el triangulo
//Generamos  la structura triangulo
//La cual tendra los valores a , b ,c
//Y tendra la funcion  de area
class trianguloM {
    var a:Int
    var b:Int
    var c:Int
    var tipo_de_triangulo:String! = nil
    init (a:Int,b:Int,c:Int){
        self.a = a
        self.b = b
        self.c = c
        self.tipo_de_triangulo = obtenerTriangulo(a: a, b: b, c: c)
    }
//    MARK : -funcion para obtener triangulo
    func obtenerTriangulo(a:Int,b:Int,c:Int)->String?{
        if(a==b && b==c){
            return "Equilatero"
        }
        if(a != b  && a != c){
            return "Escaleno"
        }
        else{
            return"Isoceles"
        }
    }
    func area()->Int{
        return (self.a+self.b+self.c)/2
    }
}
