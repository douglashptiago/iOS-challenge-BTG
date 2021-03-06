//
//  DetailModels.swift
//  TheMovieDB
//
//  Created by Usuario on 29/01/20.
//  Copyright (c) 2020 Usuario. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum DetailScene
{
  // MARK: Use cases

  enum AddMovie
  {
    struct Request {
      let movie: Movie
    }
    struct Response {
      let result: Bool
    }
    struct ViewModel {
      let result: Bool
    }
  }
    
  enum DeleteMovie
  {
    struct Request {
      let movieId: Int64
    }
    struct Response {
      let result: Bool
    }
    struct ViewModel {
      let result: Bool
    }
  }

  enum IsFavorite
  {
    struct Request {
      let movieId: Int64
    }
    struct Response {
      let result: Bool
    }
    struct ViewModel {
      let result: Bool
    }
  }
    
}
