//
//  JokesService.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation

protocol JokesServiceType: AnyObject {
    func fetchNewJoke(completion: @escaping(Joke) -> ())
}

final class JokesService: JokesServiceType {
    init(){}
    
    func fetchNewJoke(completion: @escaping (Joke) -> ()) {
        guard let url = URL(string: "https://geek-jokes.sameerkumar.website/api") else {return}
        var request =  URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        URLSession.shared.dataTask(with:request, completionHandler: { data, res, error in
            guard let data = data, let str = String(data: data, encoding: .utf8) else {return}
            completion(Joke(text: str))
        }).resume()
    }
}
