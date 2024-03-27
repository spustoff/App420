//
//  ChartView.swift
//  App420
//
//  Created by IGOR on 20/03/2024.
//

import SwiftUI

struct ChartView: View {
    
    @StateObject var viewModel: DashboardViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currCur)")
                        .foregroundColor(.black)
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
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                .padding(.bottom, 25)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(viewModel.currCur)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .regular))
                    
                    HStack {
                        
                        Text("\(String(format: "%.f", Double(.random(in: 0...1)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .semibold))
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))%")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        
                        Spacer()
                        
                    }
                }
                .padding()
                
                Image("chart")
                    .resizable()
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.currentCurrency = viewModel.currCur
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isChart = false
                                viewModel.isCurr = false
                            }
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                        })
                        .padding(.leading)
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isChart = false
                                viewModel.isCurr = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        .padding(.trailing)
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    ChartView(viewModel: DashboardViewModel())
}
