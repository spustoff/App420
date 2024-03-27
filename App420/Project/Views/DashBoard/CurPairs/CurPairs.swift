//
//  CurPairs.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct CurPairs: View {
    
    @StateObject var viewModel: DashboardViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currencies")
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
                    
                    LazyVStack(spacing: 20) {
     
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currCur = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChart = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 6) {
                                        
                                        Text("\(String(format: "%.f", Double(.random(in: 0...9)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))$")
                                                .foregroundColor(.green)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Text("(\(String(format: "%.f", Double(.random(in: 1...2))))\(String(format: "%.f", Double(.random(in: 0...9)))).\(String(format: "%.f", Double(.random(in: 0...9))))%)")
                                                .foregroundColor(.green)
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                    }
                                }
                            })
                            
                            Rectangle()
                                .fill(.gray.opacity(0.3))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurPairs(viewModel: DashboardViewModel())
}
