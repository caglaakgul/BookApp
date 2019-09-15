//
//  SharingPageViewController.swift
//  BookApp
//
//  Created by CGL on 7.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit
import Firebase

class SharingPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var sharingButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage) )
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func chooseImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeAlert(titleInput : String, messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true, completion: nil)
    }
    
    
    @IBAction func sharingButton(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        //kod ile firebase'de dosya oluşturma
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString //unic değer verecek
            
            //let imageReference = mediaFolder.child("image.jpg") //bu şekilde her görsel aynı ada sahip olur. id kullanmamız gereklidir.
            let imageReference = mediaFolder.child("\(uuid).jpg")
            
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    //print(error?.localizedDescription)
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                }else{
                    imageReference.downloadURL(completion: { (url, error) in
                        if error == nil{
                            let imageUrl = url?.absoluteString //url yi stringe çevir
                            //print(imageUrl)
                            
                            //DATABASE
                            //kullanıcının yazdığı yorumu, görselin urlsini ve tarihi veritabanına kaydetme işlemi burada gerçekleşecek
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email as Any, "postComment" : self.commentText.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                                } else {
                                    self.imageView.image = UIImage(named: "plus.png")
                                    self.commentText.text = ""
                                    //tab bar daki 0->anasayfa, 1->paylaşma, 2->ayarlar
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                            
                        }})
                    }
            }
        }
    }
    

}
