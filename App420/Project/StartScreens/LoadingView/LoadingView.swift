//
//  LoadingView.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg4")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                 
                    Image("logo_big")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
