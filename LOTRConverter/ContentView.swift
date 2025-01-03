//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Anie on 12/30/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftCurrencyAmount = ""
    @State var rightCurrencyAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    
    
    var body: some View {
        ZStack {
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                //prancing Poney Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                //currency conversion section
                HStack {
                    // left conversion section
                    VStack {
                        //left currency
                        HStack {
                            //lef currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            
                            //lef currency name
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundColor(Color.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate (reason: .actionPerformed)
                            }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        //left currency text field
                        TextField("Amount", text: $leftCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            
                            
                    }
                    
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .symbolEffect(.pulse)
                    
                    // right conversion section
                    VStack {
                        //currency
                        HStack {
                            //currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(Color.white)
                            
                            //currency image
                            Image(rightCurrency.image )
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        
                        //text field
                        TextField("Amount", text: $rightCurrencyAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                           
                        
                    }
                    .onTapGesture {
                        showSelectCurrency.toggle()
                        }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                //Info button
                HStack {
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                        
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            }
                            .padding(.trailing)
                    
                }
                    
            }
                
        }
        //modifiers that impact the entire view
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftCurrencyAmount) {
            if leftTyping { rightCurrencyAmount = leftCurrency.convert( leftCurrencyAmount, to:  rightCurrency)
            }
        }
        .onChange(of: rightCurrencyAmount) {
            if rightTyping { leftCurrencyAmount = rightCurrency.convert( rightCurrencyAmount, to: leftCurrency)
            }
        }
        
        // adjustment in case new currency is selected
        .onChange(of: leftCurrency) {
            leftCurrencyAmount = rightCurrency.convert( rightCurrencyAmount, to:  leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightCurrencyAmount = leftCurrency.convert( leftCurrencyAmount, to:  rightCurrency)
        }
        
        // calling additional views
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
         }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(fromSelectedCurrency: $leftCurrency, toSelectedCurrency: $rightCurrency)
         }
        
        //border
//        .border(.blue)
    }
}
 
#Preview {
    ContentView()
}
