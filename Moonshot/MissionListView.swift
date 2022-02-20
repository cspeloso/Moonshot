//
//  MissionListView.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/20/22.
//

import SwiftUI

struct MissionListView: View {
    
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let isShowingMission: Bool = false
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(missions){ mission in
                    NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)){
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                            
                            Spacer()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct MissionListView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionListView(astronauts: astronauts, missions: missions)
    }
}
