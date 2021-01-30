//
//  SelectNumberViewController.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/28/21.
//

import UIKit

class GameRoundViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var drawIDLabel: UILabel!
    @IBOutlet weak var drawTimeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectedBallNumbersLabel: UILabel!
    var draw: Draw?
    let ballNumbers = Array(1...80)
    let quotaValues = [1.5, 3.4, 4.0, 2.3, 3.9, 2.2, 1.76]
    var draws = [Draw]()
    var timer: Timer?
    var selectedBalls = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if draw == nil {
            return
        }
        self.drawIDLabel.text = "Broj kola: \(draw!.drawId!))"
        self.drawTimeLabel.text = "Vreme izvlačenja: \(draw!.getDrawTimeFormatted())"
        self.timerLabel.text = "Preostalo vreme za uplatu: \(setupTimer(drawTime: draw!.drawTime))"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.secondCollectionView {
            return ballNumbers.count
        } else {
            return quotaValues.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.secondCollectionView {
            return 1
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.secondCollectionView {
            return CGSize(width: 36, height: 36)
            
        } else {
            return CGSize(width: 30, height: 30)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.secondCollectionView {
            let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameRoundCell", for: indexPath) as! GameRoundCollectionViewCell
            secondCell.numberLabel.text = String(ballNumbers[indexPath.row])
            return secondCell
        } else {
            let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCV", for: indexPath) as! NumberOfRoundAndQuotaCollectionViewCell
            let section = indexPath.section
            if section == 0 {
                firstCell.label.text = String(indexPath.row + 1)
            } else {
                firstCell.label.text = String(quotaValues[indexPath.row])
            }
            return firstCell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.secondCollectionView {
            let ball = ballNumbers[indexPath.item]
            let cell = collectionView.cellForItem(at: indexPath) as? GameRoundCollectionViewCell
            if selectedBalls.contains(ball) {
                let index = selectedBalls.firstIndex(of: ball)
                if index != nil {
                    selectedBalls.remove(at: index!)
                }
                cell?.setSelected(selected: false)
            }
            else{
                cell?.setSelected(selected: true)
                selectedBalls.append(ball)
            }
            self.selectedBallNumbersLabel.text = "Izabran broj kuglica: \(selectedBalls.count)"
        }
        
    }
    
    //MARK: TIMER

    func setupTimer(drawTime: Int){
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { timer in
            self.timerLabel.text = "Preostalo vreme za uplatu: \(Utils.timeDiff(drawTime: drawTime))"
        }
        timer?.fire()
    }
}





