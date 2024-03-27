//
//  AddInventory.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct AddInventory: View {

    @StateObject var viewModel: InventoryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Adding")
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
                    
                    VStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.invName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invName)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        Menu(content: {
                            
                            ForEach(viewModel.statuses, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentAddStatus = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentAddStatus.isEmpty {
                                
                                HStack {
                                    
                                    Text("Status")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentAddStatus)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
             
                                }
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        Menu(content: {
                            
                            ForEach(viewModel.colors, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedColor = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selectedColor.isEmpty {
                                
                                HStack {
                                    
                                    Text("Color")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.selectedColor)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
             
                                }
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.invDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invDescription)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Price")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.invPrice.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invPrice)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        ZStack(alignment: .leading, content: {
                            
                            Text("Change")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.invChange.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invChange)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        Menu(content: {
                            
                            ForEach(viewModel.directions, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentDirection = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentDirection.isEmpty {
                                
                                HStack {
                                    
                                    Text("Direction")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentDirection)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
             
                                }
                            }
                        })
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                
                Button(action: {

                    viewModel.invStatus = viewModel.currentAddStatus
                    viewModel.invColor = viewModel.selectedColor
                    viewModel.invDirection = viewModel.currentDirection
                    
                    viewModel.addInventory()
                    
                    viewModel.invName = ""
                    viewModel.currentAddStatus = ""
                    viewModel.selectedColor = ""
                    viewModel.invDescription = ""
                    viewModel.invPrice = ""
                    viewModel.invChange = ""
                    viewModel.currentDirection = ""
                    
                    viewModel.fetchInventories()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .disabled(viewModel.invName.isEmpty || viewModel.currentAddStatus.isEmpty || viewModel.selectedColor.isEmpty || viewModel.invDescription.isEmpty || viewModel.invPrice.isEmpty || viewModel.invChange.isEmpty || viewModel.currentDirection.isEmpty ? true : false)
                .opacity(viewModel.invName.isEmpty || viewModel.currentAddStatus.isEmpty || viewModel.selectedColor.isEmpty || viewModel.invDescription.isEmpty || viewModel.invPrice.isEmpty || viewModel.invChange.isEmpty || viewModel.currentDirection.isEmpty ? 0.5 : 1)
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    AddInventory(viewModel: InventoryViewModel())
}
