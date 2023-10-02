
import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var trackImageView: UIImageView!
   
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    // TODO: Pt 1 - Add a track property
    var track: Track?
    var poster: Poster?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let track = track{
         
            // Load the image located at the `artworkUrl100` URL and set it on the image view.
            Nuke.loadImage(with: track.poster_path, into: trackImageView)
            
            // Convert numeric values to strings
            let voteAvg = String(track.vote_average)
            let voteCount = String(track.vote_count)
            let pop = String(track.popularity)
            
            // Set labels with the associated track values.
            trackNameLabel.text = track.title
            artistLabel.text = pop
            albumLabel.text = voteAvg
            genreLabel.text = voteCount
            releaseDateLabel.text = track.overview
        }else if let poster = poster{
            
            // Load the image located at the `artworkUrl100` URL and set it on the image view.
            Nuke.loadImage(with: poster.poster_path, into: trackImageView)
            
            // Convert numeric values to strings
            let voteAvg = String(poster.vote_average)
            let voteCount = String(poster.vote_count)
            let pop = String(poster.popularity)
            
            // Set labels with the associated track values.
            trackNameLabel.text = poster.title
            artistLabel.text = pop
            albumLabel.text = voteAvg
            genreLabel.text = voteCount
            releaseDateLabel.text = poster.overview
        }
        
        
        
        
    }
    
    

}
