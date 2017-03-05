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
   @IBOutlet weak var storeSelector: UISegmentedControl!
   
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return (list.count)
   }
   
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
      
      var cellText = list[indexPath.row]


      
      if storeSelector.selectedSegmentIndex == 0 {
         if cellText.lowercased() == "cake mix" || cellText.lowercased() == "flour" || cellText.lowercased() == "oil" || cellText.lowercased() == "salt" || cellText.lowercased() == "sugar" {
            cellText += "        Aisle: A1"
         } else if cellText.lowercased() == "buns" || cellText.lowercased() == "muffins" || cellText.lowercased() == "pita bread" || cellText.lowercased() == "bagels" || cellText.lowercased() == "tortillas" {
            cellText += "        Aisle: B1"
         }else if cellText.lowercased() == "butter" || cellText.lowercased() == "eggs" || cellText.lowercased() == "half and half" || cellText.lowercased() == "milk" || cellText.lowercased() == "yogurt" {
            cellText += "        Aisle: C1"
         } else if cellText.lowercased() == "cola" || cellText.lowercased() == "beer" || cellText.lowercased() == "sparkling water" || cellText.lowercased() == "sport drink" || cellText.lowercased() == "wine" {
            cellText += "        Aisle: D1"
         }else if cellText.lowercased() == "bacon" || cellText.lowercased() == "chicken" || cellText.lowercased() == "sausage" || cellText.lowercased() == "steak" || cellText.lowercased() == "turkey" {
            cellText += "        Aisle: D2"
         } else if cellText.lowercased() == "garbage bags" || cellText.lowercased() == "glass cleaner" || cellText.lowercased() == "scrubbers" || cellText.lowercased() == "bleach" || cellText.lowercased() == "sponges" {
            cellText += "        Aisle: C2"
         } else if cellText.lowercased() == "apples" || cellText.lowercased() == "carrots" || cellText.lowercased() == "corn" || cellText.lowercased() == "tomatoes" || cellText.lowercased() == "potatoes" {
            cellText += "        Aisle: B2"
         }else if cellText.lowercased() == "body wash" || cellText.lowercased() == "cough syrup" || cellText.lowercased() == "deodrant" || cellText.lowercased() == "shampoo" || cellText.lowercased() == "pain reliever" {
            cellText += "        Aisle: A2"
         } else {
            cellText += "        Product not in Store"
         }
      } else {
         if cellText.lowercased() == "cake mix" || cellText.lowercased() == "flour" || cellText.lowercased() == "oil" || cellText.lowercased() == "salt" || cellText.lowercased() == "sugar" {
            cellText += "        Aisle: C1"
         } else if cellText.lowercased() == "buns" || cellText.lowercased() == "muffins" || cellText.lowercased() == "pita bread" || cellText.lowercased() == "bagels" || cellText.lowercased() == "tortillas" {
            cellText += "        Aisle: D2"
         }else if cellText.lowercased() == "butter" || cellText.lowercased() == "eggs" || cellText.lowercased() == "half and half" || cellText.lowercased() == "milk" || cellText.lowercased() == "yogurt" {
            cellText += "        Aisle: A1"
         } else if cellText.lowercased() == "cola" || cellText.lowercased() == "beer" || cellText.lowercased() == "sparkling water" || cellText.lowercased() == "sport drink" || cellText.lowercased() == "wine" {
            cellText += "        Aisle: B2"
         }else if cellText.lowercased() == "bacon" || cellText.lowercased() == "chicken" || cellText.lowercased() == "sausage" || cellText.lowercased() == "steak" || cellText.lowercased() == "turkey" {
            cellText += "        Aisle: B1"
         } else if cellText.lowercased() == "garbage bags" || cellText.lowercased() == "glass cleaner" || cellText.lowercased() == "scrubbers" || cellText.lowercased() == "bleach" || cellText.lowercased() == "sponges" {
            cellText += "        Aisle: D1"
         } else if cellText.lowercased() == "apples" || cellText.lowercased() == "carrots" || cellText.lowercased() == "corn" || cellText.lowercased() == "tomatoes" || cellText.lowercased() == "potatoes" {
            cellText += "        Aisle: A2"
         }else if cellText.lowercased() == "body wash" || cellText.lowercased() == "cough syrup" || cellText.lowercased() == "deodrant" || cellText.lowercased() == "shampoo" || cellText.lowercased() == "pain reliever" {
            cellText += "        Aisle: C2"
         } else {
            cellText += "        Product not in Store"
         }
      }
      
      
      cell.textLabel?.text = cellText
      
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
      shuffler()
   }
   
   public func shuffler() {
      var intList = [Int]()
      for item in list {
         if storeSelector.selectedSegmentIndex == 0 {
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
         } else {
            switch item.lowercased() {
            case "cake mix", "flour", "oil", "salt", "sugar":
               intList.append(3)
            case "bagels", "buns", "muffins", "pita bread", "tortillas":
               intList.append(5)
            case "butter", "eggs", "half and half", "milk", "yogurt":
               intList.append(1)
            case "cola", "beer", "sparkling water", "sport drink", "wine":
               intList.append(7)
            case "bacon", "chicken", "sausage", "steak", "turkey":
               intList.append(2)
            case "bleach", "garbage bags", "glass cleaner", "scrubbers", "sponges":
               intList.append(4)
            case "apples", "carrots", "corn", "tomatoes", "potatoes":
               intList.append(8)
            case "body wash", "cough syrup", "deodrant", "shampoo", "pain reliever":
               intList.append(6)
            default:
               intList.append(100)
            }
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

