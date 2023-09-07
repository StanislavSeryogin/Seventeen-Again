//
//  VegasChart.swift
//  Seventeen Again
//
//  Created by Stanislav Seryogin on 07.09.2023.
//

import SwiftUI
import Charts

struct SampleRating {
    let plase: String
    let rating: Int
    
    static let ratings: [SampleRating] = [
        SampleRating(plase: "Bellagio", rating: 88),
        SampleRating(plase: "Paris", rating: 75),
        SampleRating(plase: "Treasure Island", rating: 33),
        SampleRating(plase: "Excalibur", rating: 99),
    ]
}

struct VegasChart: View {
    var body: some View {
        Chart(SampleRating.ratings, id: \.plase) { ratingCahrt in
            SectorMark(
                angle: .value("Rating", ratingCahrt.rating),
                //innerRadius: .ratio(0.6),
                angularInset: 1
            )
            .cornerRadius(7)
            .foregroundStyle(by: .value("Place", ratingCahrt.plase))
            
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    VegasChart()
}
