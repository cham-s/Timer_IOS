//
//  ViewController.swift
//  Timer
//
//  Created by Chamsidine ATTOUMANI on 6/19/16.
//  Copyright © 2016 Chamsidine ATTOUMANI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var timer = NSTimer()
    var counter = 0
    var timeResults = [TimeResult]()
    var position = 0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        startButton.enabled = false
        stopButton.enabled = true
    }

    @IBAction func stop(sender: AnyObject) {
        position += 1
        timer.invalidate()
        startButton.enabled = true
        stopButton.enabled = false
    }
    
    @IBAction func addTime(sender: AnyObject) {
        let timeResult = TimeResult(time: "\(counter)", position: position)
        insertNewRowWithTimeResult(timeResult)
    }
    func updateCounter() {
        counter += 1
        countLabel.text = "\(counter)"
    }
    
    func insertNewRowWithTimeResult(item: TimeResult) {
        let newRowIndex = timeResults.count
        timeResults.append(item)
        let indexPath = NSIndexPath(forItem: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
//    func convertTimeOutputWithTime(time: String) {
//        switch time {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if timeResults.count > 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell", forIndexPath: indexPath) as! TimeCell
            let timeResult = timeResults[indexPath.row]
            cell.positionLabel!.text = "\(timeResult.position)"
            cell.timeLabel!.text = timeResult.actual_time
            return cell
        } else {
            let cellID = "Cell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
            }
            cell?.textLabel!.text = "Empty..."
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeResults.count
    }
}