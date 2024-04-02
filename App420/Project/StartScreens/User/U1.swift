//
//  U1.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg4")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Win your money")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
                
                Text("Get the chance to get extreme bonuses")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(1)
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.horizontal, .bottom])
                
                NavigationLink(destination: {
                    
                    Reviews()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary2")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    U1()
}
