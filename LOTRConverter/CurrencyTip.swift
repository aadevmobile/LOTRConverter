//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Anie on 1/2/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    var message: Text? = Text("you can tap the currency icon to change currency")
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
