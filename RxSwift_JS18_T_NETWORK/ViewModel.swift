//
//  ViewModel.swift
//  RxSwift_JS18_T_NETWORK
//
//  Created by Andres Felipe Ocampo Eljaiesk on 29/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel{
    
    let searchText = Variable("")
    
    lazy var data : Driver<[Model]> = {
        return self.searchText.asObservable()
        .throttle(0.3, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .flatMapLatest(ProviderService.shared.repositoriesFor)
        .asDriver(onErrorJustReturn: [])
    }()
    
}
