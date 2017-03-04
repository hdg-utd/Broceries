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
                              if((textField?.text)! != "") {
                                 list.append((textField?.text)!)
                              }
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
   
   @IBAction func bro_shuffler(_ sender: Any) {
      var intList = [Int]()
      for item in list {
         switch item.lowercased() {
         case "cake mix", "flour", "oil", "salt", "sugar":
            intList.append(1)
         case "bagels", "buns", "muffins", "pita bread", "tortillas":
            intList.append(2)
         case "butter", "eggs", "half and half", "milk", "yogurt":
            intList.append(3)
         case "cola", "beer", "sparkling water", "sport drink", "wine":
            intList.append(4)
         case "bacon", "chicken", "sausage", "steak", "turkey":
            intList.append(5)
         case "bleach", "garbage bags", "glass cleaner", "scrubbers", "sponges":
            intList.append(6)
         case "apples", "carrots", "corn", "tomatoes", "potatoes":
            intList.append(7)
         case "body wash", "cough syrup", "deodrant", "shampoo", "pain reliever":
            intList.append(8)
         default:
            intList.append(100)
         }
      }
      
      for i in 0..<(list.count) {
         for j in 1..<(list.count - i) {
            if(intList[j - 1] > intList[j]) {
               let stringSwap = list[j - 1]
               list[j - 1] = list[j]
               list[j] = stringSwap
               
               let positionSwap = intList[j - 1]
               intList[j - 1] = intList[j]
               intList[j] = positionSwap
            }
         }
      }
      
//      for elem in list {
//         print(elem)
//      }
//      for elem in intList {
//         print(elem)
//      }
      
      list_view.reloadData()
      
      
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

