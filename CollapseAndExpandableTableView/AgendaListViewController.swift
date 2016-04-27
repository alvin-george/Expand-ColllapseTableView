//
//  AgendaListViewController.swift
//  ReachOut
//
//  Created by Alvin George on 4/20/16.
//  Copyright © 2016 Fingent Technology Solutions. All rights reserved.
//

import UIKit

class AgendaListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var agendaListTableView: UITableView!

    var appUIColor:UIColor = UIColor.brownColor()
    var topItems = [String]()
    var subItems = [String]()
    var selectedIndexPathSection:Int = -1
    var expandedItemList = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        topItems = ["26th April 2017","27th April 2017","28th April 2017","29th April 2017","30th April 2017"]
        subItems = ["Monday","TuesDay","WednessDay"]

    }
    override func viewWillAppear(animated: Bool) {
        self.addStatusBar()
        self.addInitialUIChanges()
        self.title = "AGENDA VIEW"
        self.automaticallyAdjustsScrollViewInsets =  false
        agendaListTableView.tableFooterView = UIView(frame: CGRectZero)
    }
    private func addInitialUIChanges()
    {
        //Navigation Bar
        self.navigationController?.navigationBarHidden =  false
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backgroundColor =  appUIColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName : UIFont(name: "Arial", size: 14)!]
        self.navigationItem.titleView?.backgroundColor =  appUIColor
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return 85;

    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return topItems.count
    }
    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {

        return 35
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerCell = tableView.dequeueReusableCellWithIdentifier("agendaTableViewHeaderCellD") as! AgendaListHeaderTableViewCell
        headerCell.agendaDateLabel.text = topItems[section]as String

        //a buttton is added on the top of all UI elements on the cell and its tag is being set as header's section.

        headerCell.headerCellButton.tag =  section+100
        headerCell.headerCellButton.addTarget(self, action: "headerCellButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)

        //minimize and maximize image with animation.
        if(expandedItemList.contains(section))
        {
            UIView.animateWithDuration(0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                headerCell.expandCollapseImageView.image =  UIImage(named: "maximize")
                }, completion: nil)
        }
        else{

            UIView.animateWithDuration(0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                headerCell.expandCollapseImageView.image =  UIImage(named: "minimize")
                }, completion: nil)
        }

        return headerCell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        for (var i = 0; i < expandedItemList.count ; i++) {

            if(expandedItemList[i] == section)
            {
                i == expandedItemList.count
                return 0
            }
        }
        return self.subItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let childCell = tableView.dequeueReusableCellWithIdentifier("agendaTableViewCellID", forIndexPath: indexPath) as! AgendaListTableViewCell
        childCell.moduleListTitleLabel.text = subItems[indexPath.row] as? String
        childCell.moduleLocationLabel.text = subItems[indexPath.row] as? String
        childCell.moduleDueOnStatusLabel.text = subItems[indexPath.row] as? String

        return childCell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


    }
    //button tapped on header cell
    func headerCellButtonTapped(sender:UIButton)
    {
        for (var i = 0; i < expandedItemList.count ; i++) {

            if(expandedItemList[i] == (sender.tag-100))
            {
                expandedItemList.removeAtIndex(i)
                self.agendaListTableView.reloadData()

                return
            }
        }
        selectedIndexPathSection = sender.tag - 100
        expandedItemList.append(selectedIndexPathSection)


        UIView.animateWithDuration(0.3, delay: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve , animations: {
            self.agendaListTableView.reloadData()
            }, completion: nil)
        
    }
    func addStatusBar()
    {
        let view = UIView(frame:
            CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0)
        )
        view.backgroundColor = appUIColor
        self.view.addSubview(view)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
