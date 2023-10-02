//
//  PostersViewController.swift
//  lab-tunley
//
//  Created by Cesar Vargas on 10/1/23.
//

import UIKit
import Nuke


class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    
    // Tells the collection view how many items to display.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        poster.count
    }

    // Creates, configures and returns the cell to display for a given index path.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let poster = poster[indexPath.item]

            // Get the artwork image url
            let imageUrl = poster.poster_path
        
        
        print(poster)

            // Set the image on the image view of the cell
            Nuke.loadImage(with: imageUrl, into: cell.posterImageView)

            return cell
    }

    var poster: [Poster] = []
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=ffc0022ca32b2df14d607bc195692cb0")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                var poster = response.results
                
                // Update the poster paths to use the full image URLs
                poster = poster.map { var poster = $0; poster.poster_path = URL(string: "https://image.tmdb.org/t/p/original" + poster.poster_path.absoluteString)!; return poster }
                
                DispatchQueue.main.async {
                    self?.poster = poster
                    self?.collectionView.reloadData()
                }
                
                print("✅ \(poster)")
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let poster = poster[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.poster = poster
        }

    }


    

    @IBOutlet weak var collectionView: UICollectionView!
    

}
