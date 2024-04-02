//
//  R1.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
        
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("back")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        
                        HStack {
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 8, height: 8)
                            
                            Circle()
                                .fill(.white.opacity(0.5))
                                .frame(width: 8, height: 8)
                        }
                        .padding()
                        
                        Text("Explore your results in awesome way!")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Image("R1")
                            .resizable()
                            .ignoresSafeArea()
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
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
    R1()
}
