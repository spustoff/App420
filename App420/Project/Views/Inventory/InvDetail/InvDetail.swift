//
//  InvDetail.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct InvDetail: View {

    @StateObject var viewModel: InventoryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedInventory?.invName ?? "")
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
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
  
                                Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                                    .font(.system(size: 16, weight: .regular))

                        })
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 25) {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedInventory?.invName ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Status")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedInventory?.invStatus ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Color")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color(viewModel.selectedInventory?.invColor ?? ""))
                                .frame(width: 40, height: 20)
                            
                            Text(viewModel.selectedInventory?.invColor ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedInventory?.invDescription ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(spacing: 25) {
                        
                        HStack {
                            
                            Text("Price")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedInventory?.invPrice ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Change")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedInventory?.invChange ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Direction")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Image(viewModel.selectedInventory?.invDirection ?? "")
                            
                            Text(viewModel.selectedInventory?.invDirection ?? "")
                                .foregroundColor(.green)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete this card?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteInv(withInvDes: viewModel.selectedInventory?.invDescription ?? "", completion: {
                            
                            viewModel.fetchInventories()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                        
                        router.wrappedValue.dismiss()
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    InvDetail(viewModel: InventoryViewModel())
}
