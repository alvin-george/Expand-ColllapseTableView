//
//  AgendaListTableViewCell.swift
//  ReachOut
//
//  Created by Alvin George on 4/20/16.
//  Copyright © 2016 Fingent Technology Solutions. All rights reserved.
//

import UIKit

class AgendaListTableViewCell: UITableViewCell {

    @IBOutlet weak var agendaListContainerView: UIView!
    @IBOutlet weak var moduleListTitleLabel: UILabel!
    @IBOutlet weak var moduleDueOnStatusLabel: UILabel!
    @IBOutlet weak var moduleLocationLabel: UILabel!
    @IBOutlet weak var moduleStatusLabel: UILabel!
    @IBOutlet weak var moduleDownLoadStatusImageView: UIImageView!
    @IBOutlet weak var moduleStatusLeftSideLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        agendaListContainerView.layer.cornerRadius =  3.0

        moduleStatusLabel.layer.borderWidth = 0.5
        moduleStatusLabel.layer.borderColor = UIColor.clearColor().CGColor
        moduleStatusLabel.clipsToBounds = true
        moduleStatusLabel.layer.cornerRadius =  5.0

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
