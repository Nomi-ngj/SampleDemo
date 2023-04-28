//
//  ViewController.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            do {
                guard let url = URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json") else { return }
                let result:Result<CharactersResponseModel, Error> = try await URLSessionService.fetchData(url:url)
                switch result {
                case .success(let success):
                    debugPrint(success)
                case .failure(let failure):
                    debugPrint(failure)
                }
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }


}

