//
//  ProductViewModel.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import Foundation

class ProductViewModel{
    
    var responesModel:CharactersResponseModel?
    var serviceSuccess:(()->Void)?
    var serviceFailure:((Error)->Void)?
    
    func loadService() {
        URLSessionService.shared.fetchData(url: NetworkContants.url) { (result:Result<CharactersResponseModel, Error>) in
            switch result {
            case .success(let success):
                self.responesModel = success
                self.serviceSuccess?()
            case .failure(let failure):
                self.serviceFailure?(failure)
            }
        }
    }
    
    func numberOfRows()->Int{
        return responesModel?.relatedTopics.count ?? 0
    }
    
    func item(indexPath:IndexPath) -> RelatedTopic?{
        return responesModel?.relatedTopics[indexPath.row]
    }
}
