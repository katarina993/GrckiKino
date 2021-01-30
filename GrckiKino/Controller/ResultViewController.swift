//
//  ResultViewController.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/30/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var drawsResults = [DrawResultContent]()
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let yesterday = DateComponents(year: now.year, month: now.month, day: now.day! - 1)
        let dateYesterday = Calendar.current.date(from: yesterday)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFrom = dateFormatter.string(from: dateYesterday)
        let dateTo = dateFormatter.string(from: dateYesterday)

        DataController.shared.getResult(dateFrom: dateFrom, dateTo: dateTo) { drawsResults in
            if drawsResults != nil {
                self.drawsResults = drawsResults!
                DispatchQueue.main.sync {
                    self.resultCollectionView.reloadData()
                }
            } else {
                //show Alert "Oops: Something went wrong!"
                
            }
            
        }
        
    }
}

extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return drawsResults.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drawsResults[section].winningNumbers.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as! ResultCollectionViewCell
        let ball = drawsResults[indexPath.section].winningNumbers.list[indexPath.row]
        cell.winningNumberLabel.text = String(ball)
        cell.circleBackgroundView.color = UIColor.random().cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DrawResultHeaderCV", for: indexPath) as! DrawResultSectionHeaderCollectionReusableView
    
            headerView.headerLabel.text = "Vreme izvlačenja:\(drawsResults[indexPath.section].getDrawTimeFormatted()) | Broj kola:\(drawsResults[indexPath.section].drawId!)"
            return headerView
        }
        fatalError("Unexpected element kind")
    }
    

}
