//
//  ViewController.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/27/21.
//

import UIKit

class DrawRaundsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    var draws = [Draw]()
    
    @IBOutlet weak var drawTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataController.shared.getUpcoming() { draws in
            if draws != nil {
                self.draws = draws!
                DispatchQueue.main.sync {
                    self.drawTableView.reloadData()
                }
            } else {
                //show Alert "Oops: Something went wrong!"
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return draws.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! DrawRoundsTableViewCell
        let draw = draws[indexPath.row]
        cell.drawTimeLabel.text = draw.getDrawTimeFormatted()
        cell.setupTimer(drawTime: draw.drawTime)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let draw = draws[indexPath.row]
//        if draw.isExipred() {
//            //show Alert "Time is exipred: Sorry, but you cannot place your bet!"
//            return
//        }
        let vc = storyboard?.instantiateViewController(identifier: "gameRoundVC") as! GameRoundViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.draw = draw
    
    }
}


