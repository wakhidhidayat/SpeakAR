//
//  View+hidden.swift
//  SpeakAR
//
//  Created by Wahid Hidayat on 18/04/23.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
