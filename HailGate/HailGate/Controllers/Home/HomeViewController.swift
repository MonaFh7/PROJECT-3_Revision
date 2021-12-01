//
//  HomeViewController.swift
//  HailGate
//
//  Created by Monafh on 26/04/1443 AH.
//

import UIKit

class HomeViewController: UIPageViewController ,UIPageViewControllerDelegate, UIPageViewControllerDataSource {


    var arryInformaition = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "firstPage") as! HomePageVC
        
        firstVC.pageTitle = "1"
        firstVC.pageInfo = "1111"
//
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "firstPage") as! HomePageVC
        
        secondVC.pageTitle = "2"
        secondVC.pageInfo = "2222"
        
        arryInformaition.append(firstVC)
        arryInformaition.append(secondVC)
        
        
        if let pageVC = arryInformaition.first{
            setViewControllers([pageVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arryInformaition.firstIndex(of: viewController) else{
            return nil
        }
        let previousIndex = currentIndex-1
        guard previousIndex >= 0 else {
            return arryInformaition.last
        }
        return arryInformaition[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arryInformaition.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < arryInformaition.count else {
            return arryInformaition.first
        }
        
        return arryInformaition[nextIndex]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arryInformaition.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
