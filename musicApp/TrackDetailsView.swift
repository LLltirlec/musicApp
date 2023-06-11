//
//  TrackDetailsView.swift
//  musicApp
//
//  Created by Евгений Ефимов on 11.06.2023.
//

import UIKit

final class TrackDetailsView: UIView {
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    @IBOutlet weak var trackPlayProgres: UISlider!
    @IBOutlet weak var currentPlayTime: UILabel!
    @IBOutlet weak var trackDuratation: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var durationMinuts: Float!
    private var durationSeconds: Int {
        
        let minuts: Float = Float(Int(durationMinuts))
        let seconds = durationMinuts - minuts
        
        return Int(minuts * 60 + seconds * 100)
    }
    
    private var seconds: Double = 0
    
    private var timer: Timer? = nil
    
    private var isPlay: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let scale: CGFloat = 0.7
        trackImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        trackImage.layer.cornerRadius = 7
        playButton.setTitle("Pause", for: .normal)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        startTimer()
        enlargeTransformImage()
        durationMinuts = Float(trackDuratation.text ?? "0.0")
    }
    
    @IBAction func hideView(_ sender: UIButton) {
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        if isPlay {
            stopTrack()
        } else {
            isPlay = true
            playButton.setTitle("Pause", for: .normal)
            enlargeTransformImage()
            startTimer()
        }
    }
    
}


extension TrackDetailsView {
    
    func loadTrackInfo(sender: Music) {
        trackName.text = sender.track
        artist.text = sender.artist
        trackDuratation.text = String(format: "%0.2f", sender.duratation)
        trackImage.image = UIImage(named: sender.artist)
    }
    
    
    private func enlargeTransformImage() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.trackImage.transform = .identity
        }, completion: nil)
    }
    
    private func reduceTransformImage() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            let scale: CGFloat = 0.7
            self.trackImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            self.seconds = self.seconds + 1
            self.updateCurrentTimeLabel()
            self.updateSlider()
        }
    }
    
    private func restartTimer(){
        seconds = 0
    }
    
    private func stopTrack() {
        isPlay = false
        playButton.setTitle("Play", for: .normal)
        reduceTransformImage()
        timer?.invalidate()
        timer = nil
    }
    
    private func updateCurrentTimeLabel() {
        
        if Int(seconds) >= durationSeconds {
            stopTrack()
            restartTimer()
        }
        if seconds < 10 {
            currentPlayTime.text = "0:0\(seconds.asString(style: .positional))"
        } else if seconds < 60 {
            currentPlayTime.text = "0:\(seconds.asString(style: .positional))"
        } else {
            currentPlayTime.text = seconds.asString(style: .positional)
        }
    }
    
    private func updateSlider() {
        let persent = Float(seconds) / Float(durationSeconds)
        
        trackPlayProgres.setValue(persent, animated: true)
    }
}

extension Double {
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
        formatter.unitsStyle = style
        return formatter.string(from: self) ?? ""
    }
}
