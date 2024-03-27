//
//  TabBar.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white : Color.gray)
                            .frame(width: 70, height: 52)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim").opacity(selectedTab == index ? 1 : 0)))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 35).fill(.white))
        .shadow(color: .gray.opacity(0.4), radius: 10)
    }
}

enum Tab: String, CaseIterable {
    
    case Dashboard = "Dashboard"
    
    case Inventory = "Inventory"
    
    case Settings = "Settings"
        
}
