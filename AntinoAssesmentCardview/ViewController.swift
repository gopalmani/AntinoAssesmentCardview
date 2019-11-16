//
//  ViewController.swift
//  Antino Assesment Cardview
//
//  Created by Gopal mani Dubey on 15/11/19.
//  Copyright © 2019 Gopal Mani. All rights reserved.
//

import UIKit
import SDWebImage

typealias ServerResponseCompletion = () -> Void

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    final let url = URL(string: "http://demo8716682.mockable.io/cardData" )
    var users: UserModel = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        downloadJson()
        // Do any additional setup after loading the view.
    }
    func downloadJson() {
    guard let downloadURL = url else {return}
    URLSession.shared.dataTask(with: downloadURL) { data, URLResponse, error in
        guard let data=data, error==nil, URLResponse != nil else {
            print("something is wrong")
            return
        }
        print("downloaded")
        do{
            let decoder = JSONDecoder()
            self.users = try decoder.decode(UserModel.self, from: data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("Serever response model \(self.users)")
        } catch let error {
            print("something wrong \(error)")
            return
        }
        
    }.resume()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
            let info = users[indexPath.row]
            cell.nameLbl.text = info.name
            cell.ageLbl.text = info.age
            cell.locationLbl.text = info.location
            if let url = URL(string: info.url ?? "") {
                cell.imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
            }
//            cell..text = "Name: " + users[indexPath.row].name
//            cell.detaillbl.text = "Details: " + users[indexPath.row].Details
            
//            cell.contentView.backgroundColor = UIColor.darkGray
//            cell.backgroundColor = UIColor.darkGray
//            if let imageURL = URL(string: users[indexPath.row].image) {
//                DispatchQueue.global().async {
//                    let data = try? Data(contentsOf: imageURL)
//                    if let data = data {
//                        let image = UIImage(data: data)
//                        DispatchQueue.main.async {
//                            cell.imgView.image = image
//                        }
//                    }
//                }
//            }
            return cell
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

//}
