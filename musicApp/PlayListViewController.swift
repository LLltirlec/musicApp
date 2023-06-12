//
//  PlayListViewController.swift
//  musicApp
//
//  Created by Евгений Ефимов on 12.06.2023.
//

import UIKit

final class PlayListViewController: UITableViewController {
    
    var playList: [Music]!
    
    private var playListNames: [String] = []
    private var chosenPlaylist: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(playList)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var curentPlayList: String = ""
        for iteration in 0..<playList.count {
            curentPlayList = playList[iteration].playListName
            if !playListNames.contains(curentPlayList) {
                playListNames.append(curentPlayList)
            }
        }
        return playListNames.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playList", for: indexPath)
        let playList = playListNames[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = playList
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        chosenPlaylist = playListNames[indexPath.row]
        performSegue(withIdentifier: "songs", sender: cell)
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var tracks: [Music] = []
        guard let songsVC = segue.destination as? SongsTableViewController else { return }
        for iterration in 0..<playList.count{
            if chosenPlaylist == playList[iterration].playListName {
                tracks.append(playList[iterration])
            }
        }
        songsVC.music = tracks
    }
    
    
}
