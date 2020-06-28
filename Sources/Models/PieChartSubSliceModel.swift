//
//  PieChartSubSliceModel.swift
//  PieChartSwiftUI
//
//  Created by Kirill Pustovalov on 28.06.2020.
//  Copyright © 2020 Kirill Pustovalov. All rights reserved.
//

import SwiftUI

struct PieChartSubSliceModel: PieChartAnySliceProtocol {
    var value: Double
    var color: Color
    
    var startDegree: Double
    var endDegree: Double
}

