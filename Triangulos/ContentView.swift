//
//  ContentView.swift
//  Triangulos
//
//  Created by Emilio Y Martinez on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var a:String=""
    @State var b:String = ""
    @State var c: String = ""
    @State var valores:[String]=[""]
    @State var tipo_triangulo = ""
    @State var area = ""
    var body: some View {
        NavigationView{
//            MARK: -customizando los textfields
            VStack(alignment:.center,spacing: 50){
                Spacer()
                TextField("Ingrese el valor de a",text: $a)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width:300,height: 50)
                    .font(.system(size: 20, weight: .medium, design: .monospaced))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 15, y: 17)
                
                TextField("Ingrese el valor de b",text: $b)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width:300,height: 50)
                    .font(.system(size: 20, weight: .medium, design: .monospaced))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 15, y: 17)
                
                TextField("Ingrese el valor de c", text: $c)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width:300,height: 50)
                    .font(.system(size: 20, weight: .medium, design: .monospaced))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 15, y: 17)
                Spacer()
//                MARK : -TIPO DE TRIANGULO
                Text((tipo_triangulo == "") ? "" : "Tipo de triangulo:  \(tipo_triangulo)" )
                    .padding()
                    .font(.system(size: 20, weight:.medium, design: .monospaced))
                Text((tipo_triangulo == "") ? "" : "Area del triangulo:  \(area)" )
                    .padding()
                    .font(.system(size: 20, weight:.medium, design: .monospaced))
//                MARK : -GENERANDO EL TRIANGULO
                Spacer()
            
                Button{
                    valores = calcular()
                    print(valores)
                    tipo_triangulo=valores[0]
                    area = valores[1]
                }label: {
                    HStack{
                        Image(systemName: "x.squareroot")
                            .scaledToFit()
                            .foregroundColor(.white)
                        Text("Calcular")
                            .foregroundColor(.white)
                    }.frame(width:200,height: 50)
                    .background(RoundedRectangle(cornerRadius: 30))

                }
                
            }.frame(maxWidth:.infinity,maxHeight: .infinity)
                .padding()
            .navigationTitle("Triangulos")
            
        }
    }
// MARK :- Conseguimos la funcion para calcular
    func calcular()->[String]{
        if(a == "" || b == "" || c == "" ){
            return ["x","x"]
        }else{
            let triangulo = trianguloM(a: Int(a)!, b: Int(b)!, c: Int(c)!)
            let trianguloTipo = triangulo.tipo_de_triangulo
            let area = triangulo.area()
            return [trianguloTipo!,String(area)]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
