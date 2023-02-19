//
//  BeerDetailView.swift
//  BeerData
//
//  Created by Óscar on 19/2/23.
//

import SwiftUI

struct BeerDetailView: View {
    @State var name: String
    @State var description: String
    @State var imageUrl: String
    @State var ingredients: String
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        .padding()
                } placeholder: {
                    Text("🍻").padding(.bottom)
                }
                Text(name).bold().padding().font(.system(size: 30))
                VStack (alignment: .leading) {
                    Text("**Info:** \(description)")
                    Text("**Ingredients:**\(ingredients).").padding(.top)
                }.padding()
            }
        }
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView(name: "Beer example", description: "A simple description for a beer", imageUrl: "NoImage", ingredients: "Maris Otter Extra Pale, Propino Pale Malt")
    }
}
