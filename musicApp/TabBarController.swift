//
//  TabBarController.swift
//  musicApp
//
//  Created by Евгений Ефимов on 10.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 0
    
    
    private let music = Music.getTrack().sorted { $0.track < $1.track }
    private let playList = Music.getPlayList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
        passToVC()
//        loadTrackDetailView()
    }
    
    private func passToVC(){
        guard let navVC = self.viewControllers?.first as? UINavigationController else { return }
        guard let menuVC = navVC.viewControllers.first as? MainMenuViewController else { return }
        menuVC.music = music
        menuVC.playList = playList
    }
    
    
//    private func loadTrackDetailView() {
//        guard let trackView = Bundle.main.loadNibNamed("TrackDetailsView", owner: self)?.first as? TrackDetailsView else { return }
//
//        view.insertSubview(trackView, belowSubview: tabBar)
//
//        trackView.translatesAutoresizingMaskIntoConstraints = false
////        trackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        trackView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64).isActive = true
//        trackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        trackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        trackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//    }

}
