//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Xuehua Chen on 12/29/16.
//  Copyright © 2016 Xuehua Chen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var todoList = [String]()
    @IBOutlet weak var todoView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        print("View did appear")
        if let todoObj = UserDefaults.standard.object(forKey: "ToDo") {
            todoList = (todoObj as? Array<String>)!
        } else {
            todoList = [String]()
        }
        todoView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel!.text = todoList[indexPath.row]
        return cell
    }
}

