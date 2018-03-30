//
//  Provider.swift
//  RxSwift_JS18_T_NETWORK
//
//  Created by Andres Felipe Ocampo Eljaiesk on 30/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import RxSwift


final class ProviderService{
    
    static let shared = ProviderService()
    
    internal func repositoriesFor(_ gitHubID : String) -> Observable<[Model]>{
        guard !gitHubID.isEmpty, let url = URL(string: "https://api.github.com/users/\(gitHubID)/repos") else{
            return Observable.just([])
        }
        return URLSession.shared.rx.json(url: url)
            .retry(3)
            .map(Parser.shared.parse)
    }
    
}
