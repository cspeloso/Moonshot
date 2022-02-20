//
//  AstronautsScrollView.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/20/22.
//

import SwiftUI

struct AstronautsScrollView: View {
    
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role){ crewMember in
                    NavigationLink{
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(crewMember.role.contains("Commander") ? .green : .white, lineWidth: 2)
                                )
                            
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                                    
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct AstronautsScrollView_Previews: PreviewProvider {
    
    static let mission: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
            
    static let crew : [CrewMember] = mission[0].crew.map { member in
        if let astronaut = astronauts[member.name]{
            return CrewMember(role: member.role, astronaut: astronaut)
        }
        else{
            fatalError("Missing \(member.role)")
        }
    }

    static var previews: some View {
        AstronautsScrollView(crew: crew)
    }
    
}
