//
//  ContentView.swift
//  Example
//
//  Created by Kirill Pustovalov on 28.06.2020.
//  Copyright © 2020 Kirill Pustovalov. All rights reserved.
//

import SwiftUI
import PieChartSwiftUI

struct ContentView: View {
    @State var indexOfSlice: String = ""
    
    var body: some View {
        let firstItem = PieChartItemModel(value: 25, color: .pink)
        let secondItem = PieChartItemModel(value: 25, color: .white)
        let thirdItem = PieChartItemModel(value: 25, color: .red)
        
        let items = PCItems(items: [firstItem, secondItem, thirdItem])
        
        //PieChartView(items: PCItems(items: [25, 25, 25], chartColor: .black)) is available to use
        return Group {
            VStack {
                Button(action: {
                    let index =  Int(self.indexOfSlice) ?? 0
                    
                    guard index < items.items.count else { return }
                    items.items[index].color = .purple
                }) {
                    Text("Change color of item at index")
                }
                TextField("Enter index", text: $indexOfSlice)
                    .frame(width: 100, height: 20, alignment: .center)
                
                Button(action: {
                    let index =  Int(self.indexOfSlice) ?? 0
                    
                    guard index < items.items.count else { return }
                    let newPieChartItem = PieChartItemModel(value: 25, color: items.items[index].color)
                    
                    items.items[index].subItems.append(newPieChartItem)
                }) {
                    Text("Add subslice to index")
                }
            }
            .padding()
            Spacer()
            
            PieChartView(items: items, sliceSeparatorColor: .black)
                .frame(width: 150, height: 150, alignment: .center)
            Spacer()
            
            Button(action: {
                let newPieChartItem = PieChartItemModel(value: 25, color: .white)
                items.items.append(newPieChartItem)
            }) {
                Text("Add slice")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
