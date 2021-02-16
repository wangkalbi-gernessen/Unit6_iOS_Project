//
//  MainTabBarController.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-12.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white 
        let home = HomeCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house.png"), tag: 0)
        let habits = HabitCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        habits.tabBarItem = UITabBarItem(title: "Habits", image: UIImage(named: "star.png"), tag: 1)
        
        let people = UserCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        people.tabBarItem = UITabBarItem(title: "People", image: UIImage(named: "man.png"), tag: 2)
        
        let logHabit = LogHabitCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        logHabit.tabBarItem = UITabBarItem(title: "Log Habit", image: UIImage(named: "sword.png"), tag: 3)
        let viewControllers = [home,habits,people,logHabit]
        self.viewControllers = viewControllers.map {UINavigationController(rootViewController: $0)}
        self.selectedIndex = 0
    }
}
