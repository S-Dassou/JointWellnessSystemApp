//
//  HomeViewController.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 25/08/2023.
//

import UIKit

struct Category {
    let catImage: UIImage
    let catName: String
}

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    let categories: [Category] = [
    Category(catImage: UIImage(named: "hips")!, catName: "Hips"),
    Category(catImage: UIImage(named: "atWork")!, catName: "At Work"),
    Category(catImage: UIImage(named: "shoulder")!, catName: "Shoulder Mobility"),
    Category(catImage: UIImage(named: "clock")!, catName: "5 Minute Fix")
    ]
    
    var categoryImages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.estimatedRowHeight = 80
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.tableFooterView = UIView()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
      
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.categoryLabel.text = category.catName
        cell.categoryImage.image = category.catImage
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CategoryDetailSegue", sender: nil)
    }
}
