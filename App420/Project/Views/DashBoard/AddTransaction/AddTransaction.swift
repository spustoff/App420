//
//  AddTransaction.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct AddTransaction: View {
    
    @StateObject var viewModel: DashboardViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add transaction")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()

                        }, label: {

                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding(6)
                                    .background(Circle().fill(.gray.opacity(0.2)))

                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.metals, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentMetal = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentMetal.isEmpty {
                                
                                HStack {
                                    
                                    Text("Precious metal")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentMetal)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
             
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.transTypes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentTransType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentTransType.isEmpty {
                                
                                HStack {
                                    
                                    Text("Type of transaction")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentTransType)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
             
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.transAmount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.transAmount)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.transDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.transDate)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    }
                }
                
                Button(action: {

                    viewModel.transTrans = viewModel.currentTransType
                    viewModel.transMetal = viewModel.currentMetal
                    
                    viewModel.addTransaction()
                    
                    viewModel.currentTransType = ""
                    viewModel.currentMetal = ""
                    viewModel.transAmount = ""
                    viewModel.transDate = ""
                    
                    viewModel.fetchTransactions()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .disabled(viewModel.currentMetal.isEmpty || viewModel.currentTransType.isEmpty || viewModel.transAmount.isEmpty || viewModel.transDate.isEmpty ? true : false)
                .opacity(viewModel.currentMetal.isEmpty || viewModel.currentTransType.isEmpty || viewModel.transAmount.isEmpty || viewModel.transDate.isEmpty ? 0.5 : 1)
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    AddTransaction(viewModel: DashboardViewModel())
}
