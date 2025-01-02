//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Anie on 12/31/24.
//

import SwiftUI

struct SelectCurrency: View {
   
    @Environment(\.dismiss) var dismiss
    @Binding var fromSelectedCurrency: Currency
    @Binding var toSelectedCurrency: Currency
    
    var body: some View {
        ZStack{
            // background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // text
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //currency icons
                IconGrid(selectedCurrency:
                    $fromSelectedCurrency)
                
                //text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                //currency icons
                IconGrid(selectedCurrency:
                    $toSelectedCurrency)
                
                // done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(.black)
            
        }
    }
}
    

#Preview {
    @Previewable @State var fromSelectedCurrency: Currency = .silverPiece
    @Previewable @State var toSelectedCurrency: Currency = .goldPenny
    
    SelectCurrency(fromSelectedCurrency: $fromSelectedCurrency, toSelectedCurrency: $toSelectedCurrency)
}

