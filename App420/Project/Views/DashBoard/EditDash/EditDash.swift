//
//  EditDash.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct EditDash: View {
    
    @StateObject var viewModel: DashboardViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()

                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        
                        HStack {
                            
                            Text("Total balance")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing, content: {
                                
                                Text("0.00$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.TB.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.TB)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
 
                        HStack {
                            
                            Text("Change")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing, content: {
                                
                                Text("0.00$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.Chan.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.Chan)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))

                    VStack(spacing: 20) {
                        
                        HStack {
                            
                            Text("Earning")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing, content: {
                                
                                Text("0.00$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.Ear.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.Ear)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
 
                        HStack {
                            
                            Text("Lost")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing, content: {
                                
                                Text("0.00$")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.Los.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.Los)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                
                Button(action: {

                    viewModel.totalBalance = viewModel.TB
                    viewModel.Change = viewModel.Chan
                    viewModel.Earning = viewModel.Ear
                    viewModel.Lost = viewModel.Los
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .disabled(viewModel.TB.isEmpty || viewModel.Chan.isEmpty || viewModel.Ear.isEmpty || viewModel.Los.isEmpty ? true : false)
                .opacity(viewModel.TB.isEmpty || viewModel.Chan.isEmpty || viewModel.Ear.isEmpty || viewModel.Los.isEmpty ?  0.5 : 1)
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    EditDash(viewModel: DashboardViewModel())
}
