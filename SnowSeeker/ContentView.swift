//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Arthur Sh on 15.01.2023.
//

import SwiftUI

struct ContentView: View {
    let allResorts: [Resort] = Bundle.main.decode("resorts.json")
   
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            
            //MARK: This view will only be visible in landscape mode
            WelcomeView()
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return allResorts
        } else {
            return allResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    
}
