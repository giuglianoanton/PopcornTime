//
//  WhatsNewViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

class WhatsNewViewController: UIViewController {
    
    // create searchbar
    let searchController = UISearchController()
    
    
    // configure the table
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    //add the table to the view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        
        table.delegate =  self
        table.dataSource = self
        
        DispatchQueue.main.async {
            self.getRequest()
        }
    }
    
    
    // set the frame of the table
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
        table.backgroundColor = .none
    }
    
    private func configureNavBar(){
        // navigation configuration
        self.title = "What's New"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    // call the api func
    private func getRequest() {
        ApiCaller.shared.getRequest { results in
            switch results{
            case .success(let moviesResponse):
                print(moviesResponse)
//                movies.append(moviesResponse[0])
//                print(movies)
            case .failure(let error):
                print(error)
            }
        }
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

//MARK: - DELEGATE METHODS
extension WhatsNewViewController: UITableViewDelegate, UITableViewDataSource{
    
    // set the numer of rows you wnat to see
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // set the number of cell per row you want to see
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell()
            
        }
        //        cell.textLabel?.text = "Test"
        //        cell.backgroundColor = .systemMint
        return cell
    }
    
    // set the cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 287
    }
    
    // set the header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // set the number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitles.count
    }
    
    // set the title of the section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitles[section]
    }
    
    // set the view for the header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let  header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y , width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.textColor = .secondaryLabel
    }
}
