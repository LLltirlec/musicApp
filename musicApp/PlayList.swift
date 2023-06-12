//
//  MusicApp.swift
//  musicApp
//
//  Created by Евгений Ефимов on 10.06.2023.
//

class PlayList {
    static let shared = PlayList()
    
    let track: [String: [Any]] = [
        "Nothing Else Matters": ["Metallica", "Metallica", "Heavy metal", "1991", 6.27],
        "The Unforgiven": ["Metallica", "Metallica", "Heavy metal", "1991", 6.26],
        "Master of Puppets": ["Metallica", "Master of Puppets", "Heavy metal", "1986", 8.36],
        "Chop Suey!": ["System of a Down", "Toxicity", "Rock", "2001", 2.30],
        "Lonely Day": ["System of a Down", "Hypnotize", "Rock", "2005", 2.47]
    ]
    
    let playLists: [String] = ["PlayList 1", "PlayList 2"]
    
    private init() {}
}
