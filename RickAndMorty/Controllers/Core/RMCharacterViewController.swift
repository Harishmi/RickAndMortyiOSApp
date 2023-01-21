//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Harish Thirunalveli on 17/01/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        // Do any additional setup after loading the view.
        
        let request = RMRequest(endPoint: .character,pathComponents: ["1"],
        queryParameters: [
        URLQueryItem(name: "name", value: "rick")
        ])
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(<#T##RMEpisode#>)
            }
        }
    }

}
