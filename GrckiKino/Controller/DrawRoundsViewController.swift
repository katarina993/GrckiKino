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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.startAnimating()
        DataController.shared.getUpcoming() { draws in
            if draws != nil {
                self.draws = draws!
                DispatchQueue.main.sync {
                    self.drawTableView.reloadData()
                    self.spinner.stopAnimating()
                }
            } else {
                DispatchQueue.main.sync {
                    self.spinner.stopAnimating()
                    let alert = UIAlertController(title: "Oops", message: "Something went wrong!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)                }
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
        if draw.isExipred() {
            let alert = UIAlertController(title: "Time's up", message: "Please select next draw", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let vc = storyboard?.instantiateViewController(identifier: "gameRoundVC") as! GameRoundViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.draw = draw
    
    }
}
