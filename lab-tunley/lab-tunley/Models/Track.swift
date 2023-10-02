
import Foundation

// TODO: Pt 1 - Create a Movie model struct
struct Track: Decodable {
    
    let title: String
    let overview: String
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
    var poster_path: URL

 
}

struct TracksResponse: Decodable{
    let results: [Track]
}

// TODO: Pt 1 - Create an extension with a mock tracks static var

extension Track {

    /// An array of mock tracks
//    static var mockTracks: [Track]  = [
//        Track(title: "Blue Beetle",
//              overview: "Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it. As he searches to find his purpose in the world, fate intervenes when Jaime unexpectedly finds himself in possession of an ancient relic of alien biotechnology: the Scarab.",
//              popularity: 2763.496,
//              vote_average: 7.1,
//              vote_count: 703,
//              poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BMmY1ODUzZGItNDllOS00MDBhLTg4NmUtYjU4YjUxMGNlYmMwXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg")!
//             ),
//        Track(title: "Meg 2: The Trench",
//              overview: "An exploratory dive into the deepest depths of the ocean of a daring research team spirals into chaos when a malevolent mining operation threatens their mission and forces them into a high-stakes battle for survival.",
//              popularity: 2027.1,
//              vote_average: 7,
//              vote_count: 1866,
//              poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BMTM2NTU1ZTktNjc4YS00NjNhLWE4NmYtOTM2YjFjOGUzNmYzXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg")!
//             ),
//        Track(title: "Barbie",
//              overview: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
//              popularity: 1906.284,
//              vote_average: 7.3,
//              vote_count: 4867,
//              poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BNjU3N2QxNzYtMjk1NC00MTc4LTk1NTQtMmUxNTljM2I0NDA5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg")!
//             ),
//        Track(title: "Teenage Mutant Ninja Turtles: Mutant Mayhem",
//              overview: "After years of being sheltered from the human world, the Turtle brothers set out to win the hearts of New Yorkers and be accepted as normal teenagers through heroic acts. Their new friend April O'Neil helps them take on a mysterious crime syndicate, but they soon get in over their heads when an army of mutants is unleashed upon them.",
//              popularity: 702.535,
//              vote_average: 7.3,
//              vote_count: 576,
//              poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BOTc5MjFmMzgtODM0Zi00ZWJjLTlkODUtZGJjNTNkZmM5NjJjXkEyXkFqcGdeQXVyMTMzNzIyNDc1._V1_.jpg")!
//             ),
//        Track(title: "John Wick: Chapter 4",
//              overview: "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
//              popularity: 550.923,
//              vote_average: 7.8,
//              vote_count: 4566,
//              poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg")!
//             ),
//    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}


