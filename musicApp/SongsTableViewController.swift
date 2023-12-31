//
//  SongsTableViewController.swift
//  musicApp
//
//  Created by Евгений Ефимов on 11.06.2023.
//

import UIKit

final class SongsTableViewController: UITableViewController {
    
    var music: [Music]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        music.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songList", for: indexPath)
        let track = music[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.track
        content.secondaryText = track.artist
        content.image = UIImage(named: track.artist)
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let window = view.window?.windowScene?.keyWindow
        guard let trackView = Bundle.main.loadNibNamed("TrackDetailsView", owner: self)?.first as? TrackDetailsView else { return }
        trackView.loadTrackInfo(sender: music[indexPath.row])
        trackView.delegate = self
        window?.addSubview(trackView)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    */
    
}

extension SongsTableViewController: GetNextTrack {
    private func getTrack(isNext: Bool) -> IndexPath{
        guard let indexPath = tableView.indexPathForSelectedRow else { return IndexPath(index: 0) }
        tableView.deselectRow(at: indexPath, animated: true)
        var nextIndexPath: IndexPath!
        if isNext {
            nextIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            if nextIndexPath.row == music.count {
                nextIndexPath.row = 0
            }
        } else {
            nextIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
            if nextIndexPath.row == -1 {
                nextIndexPath.row = music.count - 1
            }
        }
        
        tableView.selectRow(at: nextIndexPath, animated: true, scrollPosition: .none)
        return nextIndexPath
    }
    
    func switchToNextTrack() -> Music {
        let indexPath = getTrack(isNext: true)
        return music[indexPath.row]
    }
    
    func switchToPreviousTrack() -> Music {
        let indexPath = getTrack(isNext: false)
        return music[indexPath.row]
    }
    
    
}
