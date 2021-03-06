//
//  MoviesInteractor.swift
//  TheMovieDB
//
//  Created by Usuario on 28/01/20.
//  Copyright (c) 2020 Usuario. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoviesBusinessLogic
{
  func getMovies(request: MoviesScene.GetMovies.Request)
  func selectMovie(request: MoviesScene.SelectMovie.Request)
}

protocol MoviesDataStore {
    var movie: Movie? { get set }
}

class MoviesInteractor: MoviesBusinessLogic, MoviesDataStore
{
  var presenter: MoviesPresentationLogic?
  var worker: MoviesWorker?
  var movie: Movie?
    
  init( moviesWorker: MoviesWorker = MoviesWorker()) {
    worker = moviesWorker
  }
    
  func getMovies(request: MoviesScene.GetMovies.Request) {
    worker?.getMovies(page: request.page)
      .subscribe { [weak self] event in
        switch event {
        case .success(let response):
            let response = MoviesScene.GetMovies.Response(response: response)
            self?.presenter?.presentMovies(response: response)
        case .error(let error):
           print(error)
        }
    }
  }
    
  func selectMovie(request: MoviesScene.SelectMovie.Request) {
    movie = request.movie
    let response = MoviesScene.SelectMovie.Response()
    presenter?.presentSelectedMovie(response: response)
  }
}
