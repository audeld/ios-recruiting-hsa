//
//  MoviesServiceLocator.swift
//  Concrete-Movies
//
//  Created by Audel Dugarte on 4/28/19.
//  Copyright © 2019 Audel Dugarte. All rights reserved.
//

import Foundation

class MoviesServiceLocator{
    
    private var simpleMovieModelToEntityMapper: Mapper<SimpleMovie, SimpleMovieEntity>{
        return SimpleMovieModelToEntityMapper()
    }
    
    var simpleMovieViewModelToModelMapper: Mapper<SimpleMovieViewModel, SimpleMovie>{
        return SimpleMovieViewModelToModelMapper()
    }
    
    private var moviesRestApi: MoviesRestApi{
        return MoviesAlamoFireRestApi()
    }
    
    var moviesDataSource: MoviesDataSource{
        return MoviesApiDataSource(moviesRestApi: moviesRestApi)
    }
    
    var moviesRepository: MoviesRepository{
        return MoviesApiRepository(
            moviesApiDataSource: moviesDataSource,
            simpleMovieModelToEntityMapper: simpleMovieModelToEntityMapper
        )
    }
    
    //Mark:- UseCases
    
    var fetchPopularMoviesUseCase: FetchPopularMoviesUseCase{
        return FetchPopularMoviesUseCase(repository: moviesRepository)
    }
}
