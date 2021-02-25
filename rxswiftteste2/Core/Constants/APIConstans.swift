//
//  APIConstans.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation
import Alamofire

struct APIConstans {
    
    struct ViaCepServer {
        static let baseUrl = "http://viacep.com.br/ws/"
    }
    
    struct DeveloperServer {
        static let baseURL = "http://172.16.2.140:1882/api/v1"
    }
    
    struct ProductionServer {
        static let baseURL = "http://172.16.2.140:1882/api/v1"
    }
    
    struct APIParameterKey {
         
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
