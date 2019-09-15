//
//  MainPageViewController.swift
//  BookApp
//
//  Created by CGL on 7.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension MainPageViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!
        MainTableViewCell
        cell.userEmailLabel.text = "user@email.com"
        cell.likeLabel.text = "0"
        cell.commentLabel.text = "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. "
        cell.userImageView.image = UIImage(named: "plus.png")
        return cell
    }
    
}

