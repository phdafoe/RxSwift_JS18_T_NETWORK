//
//  Parser.swift
//  RxSwift_JS18_T_NETWORK
//
//  Created by Andres Felipe Ocampo Eljaiesk on 30/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

final class Parser {
    
    static let shared = Parser()
    
    internal func parse(json: Any) -> [Model]{
        guard let items = json as? [[String: Any]] else{
            return []
        }
        var repositories = [Model]()
        items.forEach{
            guard let name = $0["name"] as? String, let url = $0["html_url"] as? String else { return }
            repositories.append(Model(name: name, url: url))
        }
        return repositories
    }
}
