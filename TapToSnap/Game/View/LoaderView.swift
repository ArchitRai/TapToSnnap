//
//  LoaderView.swift
//  TapToSnap
//
//  Created by Archit Rai Saxena on 15/02/21.
//  Copyright © 2021 ArchitRaiSaxena. All rights reserved.
//

import Foundation
import SwiftUI

struct LoaderView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 2 : 0)
                Spacer(minLength: 20)
                VStack {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .opacity(self.isShowing ? 1.0 : 0)
            }
            .background(Color.darkGrayColor)
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
