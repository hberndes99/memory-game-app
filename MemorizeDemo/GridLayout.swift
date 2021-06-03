//
//  GridLayout.swift
//  MemorizeDemo
//
//  Created by Harriette Berndes on 03/06/2021.
//

import SwiftUI

struct GridLayout{
    var size: CGSize
    var rowCount: Int = 0
    var columnCount: Int = 0
    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        
    }
    
    var itemSize: CGSize {}
    func location(ofItemAt index: Int) -> CGPoint {}
}
