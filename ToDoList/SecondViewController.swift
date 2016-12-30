//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Xuehua Chen on 12/29/16.
//  Copyright © 2016 Xuehua Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var todoList = [String]()
    
    @IBAction func add(_ sender: Any) {

        if let todoObj = UserDefaults.standard.object(forKey: "ToDo") {
            todoList = (todoObj as? Array<String>)!
        } else {
            todoList = [String]()
        }
        
        todoList.append(textField.text!)
        UserDefaults.standard.set(todoList, forKey: "ToDo")
        textField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

