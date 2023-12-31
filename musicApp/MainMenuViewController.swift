//
//  TableViewController.swift
//  musicApp
//
//  Created by Евгений Ефимов on 10.06.2023.
//

import UIKit

final class MainMenuViewController: UITableViewController {

    var music: [Music]!
    var playList: [Music]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Menu", for: indexPath)
        
         let menuElements: [String] = [
             "Play Lists",
             "Artists",
             "Albums",
             "Songs",
             "Genres"
         ]

        var content = cell.defaultContentConfiguration()
        content.text = menuElements[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row{
        case 0:
            performSegue(withIdentifier: "playlists", sender: cell)
        case 1:
            performSegue(withIdentifier: "artists", sender: cell)
        case 2:
            performSegue(withIdentifier: "albums", sender: cell)
        case 3:
            performSegue(withIdentifier: "songs", sender: cell)
        default:
            performSegue(withIdentifier: "genres", sender: cell)
        }
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
        if let songsVC = segue.destination as? SongsTableViewController {
            songsVC.music = music
        } else if let playListVC = segue.destination as? PlayListViewController {
            playListVC.playList = playList
        } else { return }
    }
    
    
}
