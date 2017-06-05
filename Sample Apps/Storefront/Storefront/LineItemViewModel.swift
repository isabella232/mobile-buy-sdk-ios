//
//  LineItemViewModel.swift
//  Storefront
//
//  Created by Shopify.
//  Copyright (c) 2017 Shopify Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Buy

final class LineItemViewModel: ViewModel {
    
    typealias ModelType = Storefront.CheckoutLineItemEdge
    
    let model:    ModelType
    let cursor:   String
    
    let variantID:       String?
    let title:           String
    let quantity:        Int
    let individualPrice: Decimal
    let totalPrice:      Decimal
    
    // ----------------------------------
    //  MARK: - Init -
    //
    required init(from model: ModelType) {
        self.model           = model
        self.cursor          = model.cursor
        
        self.variantID       = model.node.variant!.id.rawValue
        self.title           = model.node.title
        self.quantity        = Int(model.node.quantity)
        self.individualPrice = model.node.variant!.price
        self.totalPrice      = self.individualPrice * Decimal(self.quantity)
    }
}

extension Storefront.CheckoutLineItemEdge: ViewModeling {
    typealias ViewModelType = LineItemViewModel
}
