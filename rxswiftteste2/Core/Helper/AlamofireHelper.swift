////
////  AlamofireHelper.swift
////  rxswiftteste2
////
////  Created by Ronaldo Filho on 24/02/21.
////
//
//import Foundation
//import Alamofire
//import RxCocoa
//import RxSwift
//
//class AlamofireHelper {
//
//    static func carregarCep(completion: @escaping (TelaHomeModel) -> Void,cep: String) {
//
//        let url: String = "http://viacep.com.br/ws/\(cep)/json/"
//        let request = AF.request("\(url)")
//
//        request.responseDecodable(of: TelaHomeModel.self) { (response) in
//            guard let dados = response.value else {
//                print("nulo")
//                return
//            }
//            completion(dados)
//
//        }
//
//    }
//
//
//}
