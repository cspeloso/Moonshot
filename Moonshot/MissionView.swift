//
//  MissionView.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/20/22.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    let crew: [CrewMember]
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6)
                        .padding(40)
                    
                    
                    VStack(alignment: .leading){
                        
                        CustomDividers()
                        
                        Text("Mission highlights")
                            .font(.title.bold())
                        
                        Text("Launch Date: **\(mission.formattedLaunchDate)**")
                            .font(.caption)
                            .padding(.bottom, 5)
                                                    
                        Text(mission.description)
                        
                        CustomDividers()
                        
                        Text("Crew Members")
                            .font(.title.bold())
                    }
                    .padding(.bottom, 30)
                    .padding(.horizontal, 15)
                                           
                    AstronautsScrollView(crew: crew)
                }
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else{
                fatalError("Missing \(member.role)")
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
