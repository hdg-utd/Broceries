//
//  ViewController.swift
//  Broceries
//
//  Created by Harsh Gosar on 3/4/17.
//  Copyright © 2017 Harsh Gosar. All rights reserved.
//

import UIKit

var list = [String]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   @IBOutlet weak var list_view: UITableView!
   
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return (list.count)
   }
   
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
      cell.textLabel?.text = list[indexPath.row]
      
      return (cell)
   }
   
   public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == UITableViewCellEditingStyle.delete {
         list.remove(at: indexPath.row)
         self.list_view.reloadData()
      }
      
   }
   
   @IBAction func addItem(_ sender: Any) {
      let alert = UIAlertController(title: "Broceries!!", message: "Add a new item", preferredStyle: .alert)
      
      // Add cancel action
      let cancel = UIAlertAction(title: "Cancel",
                                 style: UIAlertActionStyle.cancel,
                                 handler: nil)
      alert.addAction(cancel)
      
      // Add ok action
      let ok = UIAlertAction(title: "OK",
                             style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                              let textField = alert.textFields?[0]
                              list.append((textField?.text)!)
                              self.list_view.reloadData()
      }
      alert.addAction(ok)
      
      // Add text field
      alert.addTextField { (textField: UITextField) -> Void in
         textField.placeholder = "Ex. Milk, Bread"
      }
      
      // Present alert controller
      self.present(alert,
                   animated: true,
                   completion: nil)
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

