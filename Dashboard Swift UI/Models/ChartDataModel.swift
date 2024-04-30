//
//  ChartDataModel.swift
//  Dashboard Swift UI
//
//

import Foundation

struct ChartDataWrapper<Key: Hashable, Value>: Identifiable {
    let id: Key
    let value: Value
    
    init(key: Key, value: Value) {
        self.id = key
        self.value = value
    }
}


