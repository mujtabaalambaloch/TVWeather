//
//  ForecastTableViewCell.swift
//  TVWeather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    @IBOutlet weak var dayMaxTempLabel: UILabel!

    @IBOutlet weak var dayMinTempLabel: UILabel!
    @IBOutlet weak var dayDescLabel: UILabel!
    @IBOutlet weak var dayImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
