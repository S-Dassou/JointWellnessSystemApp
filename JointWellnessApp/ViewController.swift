//
//  ViewController.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 21/08/2023.
//

import UIKit

struct Page {
    let animationName: String
    let title: String
    let description: String
}

class ViewController: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var onboardingSkipButton: UIButton!
    
//    var titles: [String] = ["title 1", "title 2", "title 3"]
//    var descriptions: [String] = ["desc 1", "desc 4", "desc 3"]
    
    
    let pages: [Page] = [
        Page(animationName: "strong", title: "Improve Strength", description: "This is our Recipe"),
        Page(animationName: "stretch", title: "Get Flexy", description: "A Step by Step Guide"),
        Page(animationName: "dance", title: "Be Free", description: "Our Simple Formula to Freedom")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingSkipButton.layer.cornerRadius = 8
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        onboardingCollectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
        self.onboardingPageControl.numberOfPages = pages.count
    }


    @IBAction func pageChange(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        onboardingCollectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    @IBAction func onboardingButtonTapped(_ sender: Any) {
        print("move to other VC")
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        window?.rootViewController = Utility.getTabBarController()
        }
    }


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.configureCell(page: pages[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.onboardingCollectionView.frame.width, height: self.onboardingCollectionView.frame.height)
    }
    
    //update UI Page Control
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onboardingPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

