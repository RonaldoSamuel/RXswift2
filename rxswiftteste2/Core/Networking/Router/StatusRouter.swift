//
//  StatusRouter.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation
import Alamofire

enum StatusRouter: APIConfiguration {
    
    case statusServico
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .statusServico:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .statusServico:
            return "/status"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .statusServico:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstans.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
