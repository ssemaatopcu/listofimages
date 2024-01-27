//
//  ViewController.swift
//  listofimages
//
//  Created by Sema Topcu on 1/23/24.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // One of Apple’s design guidelines is the use of large titles – the text that appears in the gray bar at the top of apps.
        
        let fm = FileManager.default
        //fm sabit. filemanager.defult ise dosya sistemiyle çalışmayı sağlıyor, biz dosya aramak için kullanıcaz
        let path = Bundle.main.resourcePath! //this line tell me where i can find all images in app.
        let items = try! fm.contentsOfDirectory(atPath: path)
        /*  items set the contents directory at path (ask which path?), this constant will be array of strings containing filenames.
        try! and bundle.main.resourcePath! use because if this code fails it means app cannot read its own data so something must be wrong. */
        
        for item in items {
            if item.hasPrefix("nssl"){
                //this is a picture to load!
                pictures.append(item)
            }
                 }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        /*
         the override keyword means the method has been defined already, and we want to change (override) the last behavior with this new behavior. If you didn't override it, then the previously defined method would execute, and in this instance it would say there are no rows.
         tableView is the name that we can use to reference the table view inside the method, and UITableView is the data type (the bit that describes what it is).
         _ means the first parameter isn’t passed in using a name when called externally (this is a remnant of Objective-C) where the name of the first parameter was usually built right into the method name.
         _tableView gives method name.
         */
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row] //there might be a text label, or there might not be.
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    /* So, we need to use ? just like when we were setting the text label of our cell: “try doing this, but do nothing if there was a problem.”
     The technical term for this is “typecasting”: asking Swift to treat a value as a different type. Swift has several ways of doing this, but we’re going to use the safest version: it effectively means, “please try to treat this as a DetailViewController, but if it fails then do nothing and move on.”

*/
}


