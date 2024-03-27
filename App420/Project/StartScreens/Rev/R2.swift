//
//  R2.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
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
                                .fill(.white.opacity(0.5))
                                .frame(width: 8, height: 8)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 8, height: 8)

                        }
                        .padding()
                        
                        Text("All your items just in one place!")
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
                
                Button(action: {
                    
                   status = true
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    R2()
}
