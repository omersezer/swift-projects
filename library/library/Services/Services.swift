//
//  Services.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Alamofire

class Services {
    
    static let shared = Services()
    
    private func request<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), onSuccess: @escaping ((_ data: T?) -> Void), onError: @escaping ((_ error: String) -> Void)) {
        AF.request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable(decoder: decoder) { (response: AFDataResponse<T>) in
                print(response.result)
                switch response.result {
                case .success(let model):
                    onSuccess(model)
                case .failure(let error):
                    onError(error.localizedDescription)
                }
            }
    }
    
    func search(searchedText: String, page: Int = 1, type: SearchTypes, successCompletion: @escaping ((_ data: MoviesModel?) -> Void), errorCompletion: @escaping ((_ error: String) -> Void)) {
        request(route: .search(searchedText: searchedText, page: page, type: type), onSuccess: successCompletion, onError: errorCompletion)
    }
}
