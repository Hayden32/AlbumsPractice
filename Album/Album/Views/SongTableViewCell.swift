//
//  SongTableViewCell.swift
//  Album
//
//  Created by Hayden Hastings on 9/30/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var durationOfSongTextField: UITextField!
    @IBOutlet weak var addSongButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBAction
    @IBAction func addSongButtonTapped(_ sender: Any) {
    }
    

}
