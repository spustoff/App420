//
//  InventoryView.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct InventoryView: View {
    
    @StateObject var viewModel = InventoryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 15) {
                    
                    Text("Inventory")
                        .foregroundColor(.gray)
                        .font(.system(size: 24, weight: .medium))
                        .padding(.bottom, 8)
                    
                    HStack {
                        
                        Button(action: {}, label: {
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                HStack {
                                    
                                    Image(systemName: "suit.diamond")
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("Totel items")
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 13, weight: .regular))
                                }
                                
                                Text("\(viewModel.inventories.count)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.15)))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus.viewfinder")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                                .frame(width: 60, height: 90)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            
                        })
                    }
                }
                .padding()
                
                VStack(spacing: 15) {
                    
                    HStack {
                        
                        ForEach(viewModel.statuses, id: \.self) { index in
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.currentStatus = index
                                }
                                
                                viewModel.fetchInventories()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.currentStatus == index ? .white : .black)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentStatus == index ? 1 : 0)))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.bottom, 6)
                    
                    if viewModel.inventories.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("You don’t have any inventories")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical,showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.inventories, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedInventory = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            HStack {
                                                
                                                Text(index.invName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 20, weight: .semibold))
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    
                                                    Image("status")
                                                    
                                                    Text(index.invStatus ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12, weight: .regular))
                                                    
                                                }
                                                .padding(6)
                                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                                            }
                                            
                                            HStack {
                                                
                                                Text("$\(index.invPrice ?? "")")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 20, weight: .semibold))
                                                
                                                Spacer()
                                                
                                                Image(index.invDirection ?? "")
                                                
                                                Text("$\(index.invChange ?? "")")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            
                                            Text(index.invDescription ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                                .lineLimit(2)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("\(index.invColor ?? "")")))
                                    })
                                    .padding(.vertical, 3)
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
        .onAppear {
            
            viewModel.fetchInventories()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            InvDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddInventory(viewModel: viewModel)
        })
    }
}

#Preview {
    InventoryView()
}
