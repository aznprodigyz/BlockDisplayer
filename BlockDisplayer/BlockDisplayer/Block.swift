import Foundation

struct Block:Decodable {
//    let localized_name: String
//    let primary_attr: String
//    let attack_type: String
//    let legs: Int
//    let img: String
    
    let height: Int
    let previousHash: String
    let tokenList: [InnerBlock]
    let root: String
    let date: String
//
}

