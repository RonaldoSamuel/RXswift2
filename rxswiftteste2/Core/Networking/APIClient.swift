//
//  APIClient.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation
import Alamofire

class APIClient {
    
    static func pedirStatus(completion: @escaping (AFResult<Status>)->Void) {
        AF.request(StatusRouter.statusServico).responseDecodable { (response: AFDataResponse<Status>) in
                completion(response.result)
        }
    }
    
    static func pedirCep(completion: @escaping (AFResult<Ceps>)->Void,cep: String) {
        AF.request(CepRouter.cepServico(cep: cep)).responseDecodable {
            (response: AFDataResponse<Ceps>) in
            completion(response.result)
        }
    }
    
    func request(){
        
    }
}
