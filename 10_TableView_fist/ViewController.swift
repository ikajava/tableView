//
//  ViewController.swift
//  10_TableView_fist
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = ["barrafina", "bourkestreetbakery", "cafedeadend", "cafeloisl", "cafelore", "caskpubkitchen", "confessional", "donostia", "fiveleaves", "forkeerestaurant", "grahamavenuemeats", "haighschocolate", "homei", "palominoespresso", "petiteoyster", "posatelier", "royaloak", "teakha", "traif", "upstate", "wafflewolf"]
    
    var priceArray = [Double]()
    
  
    
    
    
    var selectedIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...20 {
            priceArray.append(0.1+Double(i))
        }
        
        tableView.dataSource = self
        tableView.delegate = self

    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
      
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath) as! myTableViewCell
        cell.nameLabel.text = dataArray[indexPath.row]
        cell.priceLabel.text = "\(priceArray[indexPath.row])"
        cell.pictureView.image = UIImage(named: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detailsSegue", sender: indexPath.row)
        
        selectedIndex = indexPath.row
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let detailsVC = segue.destination as! DetailsViewController
            guard let index = sender else { return }
            
            detailsVC.text = dataArray[index as! Int]
            detailsVC.price = String(priceArray[index as! Int])
            detailsVC.image = UIImage(named: dataArray[index as! Int])
            
        }
    }
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!

    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        guard let index = selectedIndex else {
            print("index is Nill")
            return
        }
        
        dataArray.remove(at: index)
        priceArray.remove(at: index)
        selectedIndex = nil
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            priceArray.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }

}

