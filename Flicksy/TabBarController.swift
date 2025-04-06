import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        
        self.selectedIndex = 0
        self.tabBar.layer.cornerRadius = 35
        self.tabBar.backgroundColor = .red
        self.tabBar.tintColor = .systemGreen
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTabs() {
        let home = self.createNav(with: "", and: UIImage(named: "movie"), vc: MainScreenVC())
        let search = self.createNav(with: "", and: UIImage(named: "search"), vc: SearchScreenVC())
        let profile = self.createNav(with: "", and: UIImage(named: "user"), vc: ProfileScreenVC())
        
        self.setViewControllers([home, search, profile], animated: true)
    }
    
    private func createNav (with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController (rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
}

