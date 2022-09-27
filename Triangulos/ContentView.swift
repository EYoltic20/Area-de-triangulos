//
//  ContentView.swift
//  Triangulos
//
//  Created by Emilio Y Martinez on 26/09/22.
//

import SwiftUI

struct ContentView: View {
//    MARK: -Cambiamosel navigation title
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.font:UIFont(name: "Georgia-Bold", size: 30)!]
    }
    @State var a:String=""
    @State var b:String = ""
    @State var c: String = ""
    @State var valores:[String]=[""]
    @State var tipo_triangulo = ""
    @State var area = ""
    @State var isPresented = false
    var body: some View {
        NavigationView{
            //            MARK: -customizando los textfields
            VStack(alignment:.center,spacing: 40){
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
                
                //                MARK: -TIPO DE TRIANGULO
                Group{
                    Text((tipo_triangulo == "") ? "" : "Tipo de triangulo:" )
                        
                        .font(.system(size: 20, weight:.medium, design: .monospaced))
                    Text((tipo_triangulo == "") ? "" : "\(tipo_triangulo)" )
                        
                        .font(.system(size: 20, weight:.medium, design: .monospaced))
                    
                    Text((tipo_triangulo == "") ? "" : "Area del triangulo:" )
                        
                        .font(.system(size: 20, weight:.medium, design: .monospaced))
                    
                    Text((tipo_triangulo == "") ? "" : "\(area)" )
                        
                        .font(.system(size: 20, weight:.medium, design: .monospaced))
                }
                //                MARK: -GENERANDO EL TRIANGULO
                
                
                Button{
                    valores = calcular()
                    print(valores)
                    if(valores[0] == "x"){
                        tipo_triangulo=""
                        area = ""
                        isPresented = true
                    }
                    else{
                        tipo_triangulo=valores[0]
                        area = valores[1]
                        isPresented = false
                    }
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
                Spacer()
                
            }.frame(maxWidth:.infinity,maxHeight: .infinity)
                .padding()
                .navigationTitle("Triangulos")
                .navigationBarTitleDisplayMode(.inline)
                
                
                
                
            
        }
        .alert(isPresented:$isPresented){
            Alert(title: Text("Valor o campo vacio"),
                  message: Text("No deje ningun valor vacio"),
                  dismissButton: .default(Text("OK"))
            )
        }
    }
    // MARK: - Conseguimos la funcion para calcular
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
