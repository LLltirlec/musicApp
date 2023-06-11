//
//  TabBarController.swift
//  musicApp
//
//  Created by Евгений Ефимов on 10.06.2023.
//

import UIKit

class TabBarController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 0
    
    
    private let music = Music.getTrack().sorted { $0.track < $1.track }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
        passToVC()
    }
    
    private func passToVC(){
        guard let navVC = self.viewControllers?.first as? UINavigationController else { return }
        guard let menuVC = navVC.viewControllers.first as? MainMenuViewController else { return }
        menuVC.music = music
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}
