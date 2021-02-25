//
//  LoginRouter.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation
import Alamofire

enum LoginRouter: APIConfiguration {
    
    case loginServico
    
    var method: HTTPMethod {
        switch self {
            case .loginServico:
            return .post	
        }
    }
    
    var path: String {
        switch self {
        case .loginServico:
            return "/login"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .loginServico:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstans.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try
                    JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
    
    
    
    
}
