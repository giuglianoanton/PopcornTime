//
//  WhatsNewViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

class WhatsNewViewController: UIViewController {
    
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        
        table.delegate =  self
        table.dataSource = self
    }
    
    
    // set the frame of the table
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WhatsNewViewController: UITableViewDelegate, UITableViewDataSource{

     // set the numer of rows you wnat to see
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 20
     }

     // set the number of cell per row you want to see
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = "Test"
         return cell
     }

 }
