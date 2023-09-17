//
//  HomeViewController.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 25/08/2023.
//

import UIKit

struct Category {
    let image: UIImage
    let catName: String
    var routines: [StretchRoutine] = []
}

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    let categories: [Category] = [
        Category(image: UIImage(named: "hips")!, catName: "Hips", routines: []),
        Category(image: UIImage(named: "atWork")!, catName: "At Work", routines: []),
    Category(image: UIImage(named: "shoulder")!, catName: "Shoulder Mobility", routines: []),
    Category(image: UIImage(named: "clock")!, catName: "5 Minute Fix", routines: [])
    ]
    
    var categoryImages: [String] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoryDetailSegue" {
            let category = sender as! Category
            let viewController = segue.destination as? CategoryDetailViewController
            viewController?.category = category
        }
    }
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
        cell.categoryImageView.image = category.image
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CategoryDetailSegue", sender: categories[indexPath.row])
    }
}
