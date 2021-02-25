//
//  StatusCodable.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation

struct Status: Codable {
    
    let status: String

    enum CodingKeys: String, CodingKey {
        case status = "status"
    }
}
