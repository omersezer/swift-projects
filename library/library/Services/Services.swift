//
//  Services.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Alamofire
import AlamofireMapper

class Services {
    let baseUrl = "https://itunes.apple.com/"
    let limit: Int = 25
    
    func searchMovie(searchedText: String, type: SearchTypes, successCompletion: @escaping ((_ json: MoviesModel?) -> Void), errorCompletion: @escaping ((_ error: BaseErrorModel) -> Void)) {
        print(type.type)
        let url = "\(baseUrl)search?term=\(searchedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&offset=\(limit)&limit=\(limit)&media=\(type.type)"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseObject { (response: DataResponse<MoviesModel>) in
            switch response.result {
            case .success(let model):
                successCompletion(model)
            case .failure(let error):
                errorCompletion(BaseErrorModel(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
            }
        }
    }
    
    func searchMovie(searchedText: String, page: Int, type: SearchTypes, successCompletion: @escaping ((_ json: MoviesModel?) -> Void), errorCompletion: @escaping ((_ error: BaseErrorModel) -> Void)) {
        print(type.type)
        let url = "\(baseUrl)search?term=\(searchedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&offset=\(limit * page)&limit=\(limit)&media=\(type.type)"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseObject { (response: DataResponse<MoviesModel>) in
            switch response.result {
            case .success(let model):
                successCompletion(model)
            case .failure(let error):
                errorCompletion(BaseErrorModel(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
            }
        }
    }
}
