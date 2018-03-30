//
//  ViewController.swift
//  RxSwift_JS18_T_NETWORK
//
//  Created by Andres Felipe Ocampo Eljaiesk on 29/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    //MARK: - Local Variables
    let mySearchController = UISearchController(searchResultsController: nil)
    var mySearchBar : UISearchBar{ return
        mySearchController.searchBar
    }
    
    var viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuredSearchController()
        
        viewModel.data.drive(myTableView.rx.items(cellIdentifier: "Cell")) { _, Model, cell in
            cell.textLabel?.text = Model.name
            cell.detailTextLabel?.text = Model.url
            }.disposed(by: disposeBag)
        
        mySearchBar.rx.text.orEmpty.bind(to: viewModel.searchText).disposed(by: disposeBag)
        
        viewModel.data.asDriver().map{"\($0.count) Repositories"}.drive(navigationItem.rx.title).disposed(by: disposeBag)
    }

   
    func configuredSearchController(){
        mySearchController.obscuresBackgroundDuringPresentation = false
        mySearchBar.showsCancelButton = true
        mySearchBar.text = "phdafoe"
        mySearchBar.placeholder = "Enter GitHub ID, e.g., \"phdafoe\""
        myTableView.tableHeaderView = mySearchController.searchBar
        definesPresentationContext = true
    }


}

