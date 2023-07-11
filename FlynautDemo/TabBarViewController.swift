import UIKit

struct ItemModel {
    var title: String
    var image: String
}

class TabbarController: UITabBarController {
    var middleBtn: UIButton!
    static var midButtonIndex = 2
    
    let itemModels: [ItemModel] = [
        ItemModel(title: "Home", image: "home"),
        ItemModel(title: "Report", image: "report"),
        ItemModel(title: "", image: ""),
        ItemModel(title: "My Runs", image: "myruns"),
        ItemModel(title: "Stories", image: "stories")
    ]
    
    var tabViews: [TabBarItemView] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupUI()
    }
    
    func setupUI() {
        setupGradientLayer()
        
        tabBar.items?.enumerated().forEach { index, _ in
            if let itemView = tabBar.subviews[index] as? UIControl {
                let customView = TabBarItemView(frame: CGRect(x: 0, y: 0, width: 66, height: 60))
                customView.modal = itemModels[index]
                customView.setupViews()
                
                if index == 0 {
                    customView.setSelected(status: true)
                }
                
                customView.button?.addTarget(self, action: #selector(tabBarItemButtonAction), for: .touchUpInside)
                customView.button?.tag = index
                tabViews.append(customView)
                
                if index != 2 {
                    itemView.addSubview(customView)
                }
            }
        }
        
        setupMiddleButton()
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(r: 61, g: 64, b: 69, alpha: 1)!.cgColor,
            UIColor(r: 133, g: 149, b: 161, alpha: 1)!.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        tabBar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupMiddleButton() {
        middleBtn = UIButton(frame: CGRect(x: (view.bounds.width / 2) - 40, y: -20, width: 80, height: 80))
        middleBtn.setImage(UIImage(named: "middle"), for: .normal)
        middleBtn.setImage(UIImage(named: "middle"), for: .selected)
        middleBtn.setTitle("", for: .normal)
        
        middleBtn.backgroundColor = .clear
        middleBtn.layer.cornerRadius = middleBtn.frame.height / 2
        tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        sender.isSelected = true
        sender.tag = 2
        tabBarItemButtonAction(sender: sender)
    }
    
    @objc func tabBarItemButtonAction(sender: UIButton) {
        sender.isSelected = true
        itemSelectedAt(index: sender.tag)
    }
    
    func itemSelectedAt(index: Int) {
        tabViews[selectedIndex].setSelected(status: false)
        selectedIndex = index
        tabViews[selectedIndex].setSelected(status: true)
    }
}

extension TabbarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            itemSelectedAt(index: index)
        }
    }
}
