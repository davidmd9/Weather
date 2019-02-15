//
//  WeatherCell.swift
//  Weather
//
//  Created by David Minasyan on 15/02/2019.
//  Copyright © 2019 David Minasyan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var preassure: UILabel!
    @IBOutlet weak var humidoty: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var rain: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(style.rawValue)
    }
    
    required init(coder:NSCoder){
        super.init(coder: coder)!
    }

}
