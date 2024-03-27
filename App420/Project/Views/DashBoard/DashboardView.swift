//
//  DashboardView.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var viewModel = DashboardViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 15) {
                    
                    Text("Dashboard")
                        .foregroundColor(.gray)
                        .font(.system(size: 24, weight: .medium))
                        .padding(.bottom, 8)
                    
                    Text("$\(viewModel.totalBalance)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    HStack {
                        
                        Image(systemName: "chevron.up")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                            .padding(4)
                            .background(Circle().fill(.green))
                        
                        Text("$\(viewModel.Change)")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCurr = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("USD")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                            }
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 813).fill(.gray.opacity(0.2)))
                        })
                        
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "bag.badge.plus")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Transaction")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEdit = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "slider.horizontal.2.gobackward")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                
                                Text("Edit")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.15)))
                        })
                    }
                }
                .padding()
                
                VStack(spacing: 15) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.green)
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("green")))
                                
                                Text("Earned")
                                    .foregroundColor(.green)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Text("$\(viewModel.Earning)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.down.left")
                                    .foregroundColor(.red)
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("red")))
                                
                                Text("Lost")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Text("$\(viewModel.Lost)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                    }
                    
                    Text("Portfolio")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.inventories, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedInventory = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text(index.invName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                
                                                Text("$\(index.invPrice ?? "")")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    Image(index.invDirection ?? "")
                                                 
                                                    Text("$\(index.invChange ?? "")")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 12, weight: .regular))
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            if viewModel.invDirection == "Up" {
                                                
                                                Image("gu")
                                                
                                            } else {
                                                
                                                Image("gd")

                                            }
                                        }
                                    }
                                    .padding()
                                    .frame(width: 140, height: 100)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("\(index.invColor ?? "")")))
                                })
                            }
                        }
                    }
                    .frame(height: 100)

                    Text("Transactions")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.transactions.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("You don’t have any transactions")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.transactions, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text(index.transDate ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text("\(index.transMetal ?? "")metall")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    if index.transTrans == "Earning" {
                                        
                                        Text("+$\(index.transAmount ?? "")")
                                            .foregroundColor(.green)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    } else {
                                        
                                        Text("-$\(index.transAmount ?? "")")
                                            .foregroundColor(.red)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.1)))
                            }
                        }
                    }
                }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CurPairs(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchTransactions()
        }
        .onAppear{
            
            viewModel.fetchInventories()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            InvenDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTransaction(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditDash(viewModel: viewModel)
        })
    }
}

#Preview {
    DashboardView()
}
