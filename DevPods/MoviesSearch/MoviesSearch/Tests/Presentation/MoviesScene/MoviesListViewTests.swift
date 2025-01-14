//
//  MoviesListViewSnapshotTests.swift
//  Alamofire
//
//  Created by Oleh Kudinov on 05/04/2020.
//

import Foundation
import FBSnapshotTestCase
@testable import MoviesSearch

class MoviesListViewTests: FBSnapshotTestCase {

    let movies: [Movie] = [
            Movie.stub(id: "1", title: "title1", posterPath: "/1", overview: "overview1"),
            Movie.stub(id: "2", title: "title2", posterPath: "/2", overview: "overview2"),
            Movie.stub(id: "3", title: "title3", posterPath: "/3", overview: "overview3")
    ]

    override func setUp() {
        super.setUp()
        //self.recordMode = true
    }
}


struct MoviesListViewModelMock: MoviesListViewModel {
    // MARK: - Input
    func viewDidLoad() {}
    func didLoadNextPage() {}
    func didSearch(query: String) {}
    func didCancelSearch() {}
    func showQueriesSuggestions() {}
    func closeQueriesSuggestions() {}
    func didSelectItem(at index: Int) {}

    // MARK: - Output
    var items: Observable<[MoviesListItemViewModel]>
    var loading: Observable<MoviesListViewModelLoading?>
    var query: Observable<String>
    var error: Observable<String>
    var isEmpty: Bool
    var screenTitle: String
    var emptyDataTitle: String
    var errorTitle: String
    var searchBarPlaceholder: String

    static func stub(items: Observable<[MoviesListItemViewModel]> = Observable([]),
                     loading: Observable<MoviesListViewModelLoading?> = Observable(nil),
                     query: Observable<String> = Observable(""),
                     error: Observable<String> = Observable(""),
                     isEmpty: Bool = true,
                     screenTitle: String = NSLocalizedString("Movies", comment: ""),
                     emptyDataTitle: String = NSLocalizedString("Search results", comment: ""),
                     errorTitle: String = NSLocalizedString("Error", comment: ""),
                     searchBarPlaceholder: String = NSLocalizedString("Search Movies", comment: "")) -> Self {
        .init(items: items,
              loading: loading,
              query: query,
              error: error,
              isEmpty: isEmpty,
              screenTitle: screenTitle,
              emptyDataTitle: emptyDataTitle,
              errorTitle: errorTitle,
              searchBarPlaceholder: searchBarPlaceholder)
    }
}
