//
//  ContentView.swift
//  Seventeen Again
//
//  Created by Stanislav Seryogin on 07.09.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Place.name) private var places: [Place]
    @State private var isChartVisible = false
    @State private var isChartSheetPresented = false
    
    var body: some View {
        NavigationStack {
            List(places) { place in
                NavigationLink(value: place) {
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(7)
                            .frame(width: 150, height: 150)
                        Text(place.name)
                        Spacer()
                        if place.interested {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.trailing, 15)
                        }
                    }
                }
            }
            .navigationTitle("Places")
            .navigationDestination(for: Place.self) { place in
                MapView(place: place)
            }
            Button(action: {
                isChartSheetPresented = true
            }) {
                Text("Show Chart")
                    .foregroundStyle(.black)
            }
        }
        .sheet(isPresented: $isChartSheetPresented) {
            VegasChart()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Place.self)
}
