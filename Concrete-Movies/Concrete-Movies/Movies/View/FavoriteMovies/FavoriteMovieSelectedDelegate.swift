//
//  FavoriteMovieSelectedDelegate.swift
//  Concrete-Movies
//
//  Created by Audel Dugarte on 5/1/19.
//  Copyright © 2019 Audel Dugarte. All rights reserved.
//

import Foundation

protocol FavoriteMovieSelectionDelagate: class {
    func movieCellTapped(movieId: String)
}
