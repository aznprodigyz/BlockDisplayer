//
//  InnerBlock.swift
//  BlockDisplayer
//
//  Created by Bzhang on 6/22/18.
//  Copyright © 2018 Silc. All rights reserved.
//

import Foundation
struct InnerBlock:Decodable {
    //    let localized_name: String
    //    let primary_attr: String
    //    let attack_type: String
    //    let legs: Int
    //    let img: String
    
    let timeStamp: String
    let outAddress: [OutAddress]
    //    let tokenList: [String]
    let amount: Int
    //let date: String
    //
}
