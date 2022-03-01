//
//  ContentView.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/19/22.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    @State private var isGrid: Bool = true
    
    var body: some View {
        NavigationView{
            Group {
                if isGrid == false {
                    MissionListView(astronauts: astronauts, missions: missions)
                }
                else{
                    MissionGridView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button(isGrid ? "Show as list" : "Show as grid"){
                    isGrid.toggle()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
