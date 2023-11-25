//
//  ContentView.swift
//  SwiftUIFindFiles
//
//  Created by Angelos Staboulis on 25/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var files:[String] = []
    @State var path:String
    var body: some View {
        VStack {
            List(files,id:\.self){item in
                    Text(item)
            }.searchable(text: $path)
        }.onSubmit(of: .search) {
                findFiles(path: path)
           
        }
        
    }
    func findFiles(path:String){
            do{
                let files =  try FileManager.default.contentsOfDirectory(atPath: path+"/")
                var attributes:[FileAttributeKey:Any] = [:]
                for file in files{
                     attributes =  try FileManager.default.attributesOfItem(atPath: path + "/" + file)
                    let getType = String(describing:attributes[.type] as! FileAttributeType)
                    if  getType.contains("NSFileTypeDirectory"){
                        findFiles(path: path + "/" + file)
                    }else{
                        self.files.append(path + "/" + file)
                    }
                    
                }
                
            }catch{
                debugPrint("something went wrong!!!"+error.localizedDescription)
        }
    }
}

#Preview {
    ContentView(path: "")
}
