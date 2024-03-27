//
//  SettingsView.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isDelete: Bool = false
    
    @AppStorage("currentCurrency") var currentCurrency = ""
    
    @AppStorage("totalBalance") var totalBalance = ""
    @AppStorage("Change") var Change = ""
    @AppStorage("Earning") var Earning = ""
    @AppStorage("Lost") var Lost = ""
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 15) {
                    
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.system(size: 24, weight: .medium))
                        .padding(.bottom, 8)
       
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDelete = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "bag.badge.plus")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Reset progress")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                            }
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            
                        })
                }
                .padding()
                
                VStack(spacing: 15) {

                    VStack(spacing: 20) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: DataManager().usagePolicy) else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                        })
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                        })
                        .padding(.horizontal)
                        .padding(.bottom)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.gray.opacity(0.1)))
                    
                    Spacer()
                }
                .padding()
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                           isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                              isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Your entire progress will be permanently deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.4))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            currentCurrency = ""
                            
                            totalBalance = ""
                            Change = ""
                            Earning = ""
                            Lost = ""
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            withAnimation(.spring()) {
                                
                                isDelete = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
