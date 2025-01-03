//
//  ClipboardItem.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 15.06.24.
//

import Foundation

struct ClipboardItem: Identifiable, Codable {
    let id = UUID()
    let content: String
    let date: Date
}
