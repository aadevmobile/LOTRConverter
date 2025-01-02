//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Anie on 12/31/24.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    
    var body: some View {
        HStack{
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // exchange rate text
            Text(text)
            
            // right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 Gold Piece = 4 Gold Pennies")
}

