//
//  JocksPresenter.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation

final class JocksPresenter : JocksPresenterType {
    
    weak var delegate : JocksPresenterViewDelegate?
    private let dependency: JocksPresenterDependencyType
    private var jokes: [Joke] = []
    
    init(dependency: JocksPresenterDependencyType = JocksPresenterDependency()) {
        self.dependency = dependency
    }
        
    func loadJokes() {
        jokes = dependency.storageService.loadJokes()
        showJokes()
    }
    
    func startJokeFetcher() {
        dependency.timerService.startTimer(interval: 3) { [weak self] in
            guard let self = self else{return}
            self.fetchJoke()
        }
    }
    
    func stopJokeFetcher() {
        dependency.timerService.stopTimer()
    }

    private func fetchJoke() {
        dependency.jokesService.fetchNewJoke { [weak self] str in
            guard let self = self else{return}
            self.saveJokesAndUpdateUI(joke: str)
        }
    }
    
    private func saveJokesAndUpdateUI(joke: Joke) {
        if jokes.count == 10 {
            jokes.removeFirst()
            jokes.append(joke)
            
        }else {
            jokes.append(joke)
        }
        
        dependency.storageService.saveJokes(jokes: jokes)
        showJokes()
    }
    
    private func showJokes(){
        delegate?.updateJokes(jocks: jokes.reversed())
    }
    
}
