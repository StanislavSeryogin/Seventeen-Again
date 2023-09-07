//
//  Scrolling.swift
//  Seventeen Again
//
//  Created by Stanislav Seryogin on 07.09.2023.
//

import SwiftUI

struct Scrolling: View {
    var body: some View {
        ScrollView{
            VStack{
                ScrollImage(image: .bellagio)
                ScrollImage(image: .excalibur)
                ScrollImage(image: .luxor)
                ScrollImage(image: .stratosphere)
                ScrollImage(image: .treasureisland)
                ScrollImage(image: .paris)
            }
            .padding()
        }
    }
}

#Preview {
    Scrolling()
}
