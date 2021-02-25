//
//  APIConfiguration.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
