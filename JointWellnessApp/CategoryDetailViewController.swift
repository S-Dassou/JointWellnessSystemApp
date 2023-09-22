//
//  CategoryDetailViewController.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 04/09/2023.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    @IBOutlet weak var categoryDetailTableView: UITableView!
    var category: Category!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDetailTableView.estimatedRowHeight = 80
        categoryDetailTableView.rowHeight = UITableView.automaticDimension
        categoryDetailTableView.tableFooterView = UIView()
        
        categoryDetailTableView.dataSource = self
        categoryDetailTableView.delegate = self
    }
}
extension CategoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.routines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let routine = category.routines[indexPath.row]
        let cell = categoryDetailTableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as! CategoryDetailTableViewCell
        cell.selectionStyle = .none
        cell.routineNameLabel.text = routine.title
        cell.routineTimeLabel.text = String(routine.duration)
        cell.routineDescriptionLabel.text = routine.description
        cell.routineImageView.image = UIImage(named: routine.routineImage)
        return cell
    }
}

extension CategoryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "Go To Routine Detail", sender: nil)
//    }
}
