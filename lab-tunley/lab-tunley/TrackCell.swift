

import UIKit
import Nuke

class TrackCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var trackTitleLabel: UILabel!
    
    @IBOutlet weak var trackOverviewLabel: UILabel!
    
    /// Configures the cell's UI for the given track.
    func configure(with track: Track) {
        trackTitleLabel.text = track.title
        trackOverviewLabel.text = track.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: track.poster_path, into: trackImageView)
    }
}

