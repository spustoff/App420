//
//  Reviews.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("bg4")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Rate our app\nin the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(.top)
                
                Text("Make the app even better")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(1)
                
                Image("Reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
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
        .onAppear {
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
