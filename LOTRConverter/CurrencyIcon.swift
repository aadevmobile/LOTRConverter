//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Anie on 12/31/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        
                    
                ZStack (alignment: .bottom){
                    //currency image
                    Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                    //currency name
                    Text(currencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.75))
                }
                .padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
                
    }
}


#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
}

