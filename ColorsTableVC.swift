//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by gryzna on 7/31/23.
//  Copyright © 2023 gryzna. All rights reserved.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetailsVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        // Do any additional setup after loading the view.
    }
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
    
}
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
    
//    @IBAction func tempButtonTapped(_ sender: UIButton) {
  //      performSegue(withIdentifier: "ToColorsDetailsVC", sender: nil)
    //}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
