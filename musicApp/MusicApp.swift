
//
//  PlayList.swift
//  musicApp
//
//  Created by Евгений Ефимов on 10.06.2023.
//

struct Music {
    
    let track: String
    let artist: String
    let album: String
    let genre: String
    let year: String
    let duratation: Double
    
    var trackName: String {
        "\(artist) - \(track)"
    }
}

extension Music {
    static func getTrack() -> [Music] {
        
        var music:[Music] = []
        
        let playlist = PlayList.shared.track
        
        for (currentTrack, currentTrackInfo) in playlist {
            let track = Music(
                track: currentTrack,
                artist: String(describing: currentTrackInfo[0]),
                album: String(describing: currentTrackInfo[1]),
                genre: String(describing: currentTrackInfo[2]),
                year: String(describing: currentTrackInfo[3]),
                duratation: currentTrackInfo[4] as? Double ?? 0.0)
            
                music.append(track)
        }
        return music
    }
}

