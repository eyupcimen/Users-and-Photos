//
//  Moya.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import Moya

struct AppConst {
    static let baseUrl  = "https://jsonplaceholder.typicode.com"
}

enum ApiService {
    case getUsers
    case getUserPosts(userId:Int)
    case getComments(postId:Int)
    case getAlbums
    case getPhotos(albumId:Int)
}

extension ApiService : TargetType {
    
    var baseURL: URL {
        switch self {
        case .getUsers, .getUserPosts, .getComments, .getAlbums, .getPhotos :
            return URL(string: "\(AppConst.baseUrl)")!
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getUserPosts:
            return "/posts"
        case .getComments:
            return "/comments"
        case .getAlbums:
            return "/albums"
        case .getPhotos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers, .getUserPosts, .getComments, .getAlbums, .getPhotos:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        
        switch self {
        case .getUsers, .getAlbums:
            return [:]
        case .getUserPosts(let userId):
            return ["userId":userId]
        case .getComments(let postId):
            return ["postId":postId]
        case .getPhotos(let albumId):
            return ["albumId":albumId]
        }
    }
    
    var parameterEncoding:  Moya.ParameterEncoding {
        switch self {
        case .getUsers, .getAlbums:
            return URLEncoding.default
        case .getUserPosts, .getComments, .getPhotos:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .getUsers, .getAlbums:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        case .getUserPosts(let userId):
            return .requestParameters(parameters: ["userId":userId], encoding: URLEncoding.queryString)
        case .getComments(let postId):
            return .requestParameters(parameters: ["postId":postId], encoding: URLEncoding.queryString)

        case .getPhotos(let albumId):
            return .requestParameters(parameters: ["albumId":albumId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getUsers, .getUserPosts, .getComments, .getAlbums, .getPhotos:
            return ["Content-type": "application/json","Accept": "application/json"]
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}


private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


final class NetworkAdapter {
    
    @discardableResult static public func request(target: ApiService ,
                                                  success successCallBack: @escaping (Response) -> Void ,
                                                  failure failureCallBack: @escaping (MoyaError) -> Void) -> Cancellable {
        let networklogger = NetworkLoggerPlugin()
        let pluginsArr      : [PluginType] = [networklogger]
        let provider        = MoyaProvider<ApiService>(plugins:pluginsArr)
        
        return provider.request(target) { result in
            switch result {
            case let .success(response):
                do{
                    print(try response.mapString())
                }catch {
                    
                }
                successCallBack(response)
            case let .failure(error):
                failureCallBack(error)
            }
        }
    }
}

