//
//  DetailViewController.swift
//  listofimages
//
//  Created by Sema Topcu on 1/27/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never // the large titles should behave properly now

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            /*
             UIImage, 'view' içermiyor yani UIImageView gibi bize bir şey göstermiyor diyebiliriz. Bunun yerine UIImage; PNG ve JPEGleri yüklemek için kullanıyoruz (load to image data). named parameterinde tuttuğu dosya adını arayıp, yüklüyor. ViewControllerdan seçilen selectedımage özelliğini geçiricek buraya ve görseli yükleyecek.
             */
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    /* We're using override for each of these methods, because they already have defaults defined in UIViewController and we're asking it to use ours instead.
     Both methods use the super prefix again: super.viewWillAppear() and super.viewWillDisappear(). This means "tell my parent data type that these methods were called." In this instance, it means that it passes the method on to UIViewController, which may do its own processing.
     We’re using the navigationController property again, which will work fine because we were pushed onto the navigation controller stack from ViewController. We’re accessing the property using ?, so if somehow we weren’t inside a navigation controller the hidesBarsOnTap lines will do nothing.*/
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
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
