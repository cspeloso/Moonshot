//
//  ContentView.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/19/22.
//

import SwiftUI

struct loginView: View{
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        
        VStack{
            Form{
                Section{
                    TextField("Username" ,text: $username)
                }
                Section{
                    SecureField("Password", text: $password)
                }
                Section{
                    HStack{

                        Spacer()
                        Button("Log In"){
                            if username != "" && password != "" {
                                dismiss()
                            }
                        }
                        .frame(width: 50, height: 30, alignment: .center)
                        
                        Spacer()
                    }

                }
            }
            
        }
        
    }
    
    init(){
        print("test")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink{
                loginView()
            } label:{
                Text("Click here to sign in")
                    .padding()
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
