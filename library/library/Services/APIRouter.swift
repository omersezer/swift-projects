//
//  APIRouter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    case search(searchedText: String, page: Int, type: SearchTypes)
    case getExample(exParameter: String)
    case postExample
    case getWithToken
    
    private var baseURL: String {
        let serverUrl = K.prodUrl
        
        switch self {
        default:
            return serverUrl
        }
    }
    
    private var tokenValue: String {
        switch self {
        case .getWithToken:
            return "Bearer token"
        default:
            return ""
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .search, .getWithToken, .getExample:
            return .get
        case .postExample:
            return .post
        }
    }
    
    private var path: String {
        switch self {
        case .search(let searchedText, let page, let type):
            return "search?term=\(searchedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&offset=\(K.limit * page)&limit=\(K.limit)&media=\(type.type)"
        case .getExample(let exParameter):
            return "test/\(exParameter)"
        case .getWithToken:
            return "test"
        case .postExample:
            return "post/test"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .postExample:
            return ["test": "test"]
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.appending(path).asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        print(url)
        print(parameters)
        print(method)
        print(tokenValue)
        
        switch method {
        case .get:
            if let parameters = parameters {
                do {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        default:
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if !tokenValue.isEmpty {
            urlRequest.setValue(tokenValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }
        
        return urlRequest
    }
}
