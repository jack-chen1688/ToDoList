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
    
    ///If editActonForRowAt is defined, then commit editingStyle below won't be called.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete") { (action, index) in
            print("detete pressed")
            self.todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            UserDefaults.standard.set(self.todoList, forKey: "ToDo")

        }
        delAction.backgroundColor = UIColor.orange
        return [delAction]
    }

    ///Will take effect only when editActionForRowAt above is not used.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            UserDefaults.standard.set(todoList, forKey: "ToDo")
        }
    }
    
    /// If return true, the row can be edited. Otherwise, the row can not be edited.
    /// Without this function, rows can be edited by default.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    

 
}

