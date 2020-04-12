//
//  ContentView.swift
//  Cornoa Charts
//
//  Created by Roy Akash on 12/04/20.
//  Copyright © 2020 theroyakash. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @ObservedObject var viewModel = NetworkManager()
    @State var showingAlert = false
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            VStack(alignment: .center){
                Text("Pandemic in India")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 4)
                    .lineLimit(3)
                    .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 120, x: 20, y: 20)
                    .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 120, x: -20, y: -20)
                
                Text("Last updated \(String(viewModel.dataSet.last?.date ?? ""))2020")
                    .font(.headline).padding(.bottom, 20)
                    .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                
                VStack(alignment: .leading, spacing: 5){
                    
                    Text("Today")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    Text("Today \((viewModel.dataSet.last?.dailydeceased ?? "")) people died so far")
                        .foregroundColor(.red).font(.subheadline).bold()
                    Text("Today \((viewModel.dataSet.last?.dailyconfirmed ?? "")) new confirmed cases added").foregroundColor(.secondary).font(.subheadline).bold()
                    
                    Text("And most importantly \(viewModel.dataSet.last?.dailyrecovered ?? "") people recovered.")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.green)
                    
                    Text("So far")
                        .font(.headline)
                        .padding(.bottom, 4)
                        .padding(.top, 6)
                    
                    Text("Total Deaths: \((viewModel.dataSet.last?.totaldeceased ?? ""))")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.red)
                    
                    Text("Confirmed cases so far: \((viewModel.dataSet.last?.totalconfirmed ?? ""))")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    Text("But don't panic recovered cases so far reached \((viewModel.dataSet.last?.totalrecovered ?? ""))")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.green)
                    
                    
                    
                }
                
            }.padding(.all, 20)
                .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            
            //            VStack(alignment: .center){
            //                if !viewModel.dataSet.isEmpty{
            //                    ScrollView(.horizontal, showsIndicators: true){
            //                        HStack (alignment: .bottom, spacing: 6){
            //                            ForEach(viewModel.dataSet, id: \.self){day in
            //                                HStack{
            //                                    Spacer()
            //                                }.frame(width: 4, height: (CGFloat(day.deaths) / CGFloat(self.viewModel.max)) * 200)
            //                                    .background(Color.black)
            //                            }
            //                        }
            //                    }
            //                    .padding(.leading, 40)
            //                .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
            //                .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            //                }
            //            }
            
            Text("Death tolls day by day").font(.caption).foregroundColor(.secondary).padding(.leading, 30).padding(.bottom, 30).padding(.trailing, 30).padding(.top, 16)
                .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            
            Button(action:{
                self.showingAlert.toggle()
                let pasteboard = UIPasteboard.general
                pasteboard.string = "Today on \(String(self.viewModel.dataSet.last?.date ?? ""))2020, so far \((self.viewModel.dataSet.last?.dailydeceased ?? "")) people have died. But on a good note \(self.viewModel.dataSet.last?.dailyrecovered ?? "") people have recovered from COVID19. So far total death toll: \((self.viewModel.dataSet.last?.totaldeceased ?? "")) is on the rise. But don't panic recovered cases so far reached \((self.viewModel.dataSet.last?.totalrecovered ?? "")), Confirmed cases so far: \((self.viewModel.dataSet.last?.totalconfirmed ?? "")). Today \((self.viewModel.dataSet.last?.dailyconfirmed ?? "")) new confirmed cases registered. "
            }){
                
                Image(systemName: "doc.on.doc.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .frame(width: 200, height: 60)
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                                .padding(2)
                                .blur(radius: 2)
                        }
                )
                    
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color( #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            }
            .padding(.top, 40)
        }
            
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Copied!"), message: Text("Coronavirus status in India copied. Share Wherever you want").font(.subheadline), dismissButton: .default(Text("Yeah!")))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
            
        .onAppear{
            self.viewModel.fetchData()
        }
    }
}
