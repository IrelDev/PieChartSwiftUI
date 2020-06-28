//
//  PieChartSliceFactory.swift
//  PieChartSwiftUI
//
//  Created by Kirill Pustovalov on 28.06.2020.
//  Copyright © 2020 Kirill Pustovalov. All rights reserved.
//

class PieChartSliceFactory {
    func createPieChartSlicesFromItems(items: [PieChartItemModel], initialDegree: Double, maxShapeDegree: Double) -> [PieChartSliceModel] {
        var slices: [PieChartSliceModel] = []
        var previousSliceEndDegree = initialDegree
        
        let maxSumSliceValue = items.reduce(0) { $0 + $1.value }
        
        for itemIndex in 0 ..< items.count {
            let item = items[itemIndex]
            
            let sliceStartDegree = previousSliceEndDegree
            let proportionalValue = item.value / maxSumSliceValue
            
            let sliceEndDegree = sliceStartDegree + proportionalValue * maxShapeDegree / Double(itemIndex)
            
            var subslices: [PieChartSubSliceModel] = []
            if item.subItems.count > 0 {
                let sliceIndex = itemIndex + 1
                subslices = createPieChartSubSlicesFromItems(items: item.subItems, initialDegree: previousSliceEndDegree, maxShapeDegree: sliceEndDegree, withIndex: sliceIndex)
            }
            previousSliceEndDegree = sliceEndDegree
            
            let slice = PieChartSliceModel(value: item.value, subSlices: subslices, color: item.color, startDegree: sliceStartDegree, endDegree: sliceEndDegree)
            slices.append(slice)
        }
        return slices
    }
    func createPieChartSubSlicesFromItems(items: [PieChartItemModel], initialDegree: Double, maxShapeDegree: Double, withIndex sliceIndex: Int = 1) -> [PieChartSubSliceModel] {
        var subSlices: [PieChartSubSliceModel] = []
        var previousSliceEndDegree = initialDegree
        
        let maxSumSliceValue = items.reduce(0) { $0 + $1.value }
        
        for itemIndex in 0 ..< items.count {
            let item = items[itemIndex]
            
            let sliceStartDegree = previousSliceEndDegree
            let proportionalValue = item.value / maxSumSliceValue
            
            let sliceEndDegree = sliceStartDegree + proportionalValue * maxShapeDegree / Double(sliceIndex)
            previousSliceEndDegree = sliceEndDegree
            
            let slice = PieChartSubSliceModel(value: item.value, color: item.color, startDegree: sliceStartDegree, endDegree: sliceEndDegree)
            subSlices.append(slice)
        }
        return subSlices
    }
}
