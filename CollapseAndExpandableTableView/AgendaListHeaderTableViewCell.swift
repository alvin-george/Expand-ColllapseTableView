//
//  AgendaListHeaderTableViewCell.swift
//  ReachOut
//
//  Created by Alvin George on 4/20/16.
//  Copyright © 2016 Fingent Technology Solutions. All rights reserved.
//

import UIKit

class AgendaListHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var agendaDateLabel: UILabel!
    @IBOutlet weak var expandCollapseImageView: UIImageView!
    @IBOutlet weak var headerCellButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state

    }
    
}
