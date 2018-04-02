//
//  MainViewViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 23/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit

class MainViewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {


    
    @IBOutlet weak var emailUserLBL: UILabel!
    
    @IBOutlet weak var newTextTF: UITextField!
    @IBOutlet weak var sendTextBTN: UIButton!
    
    @IBOutlet weak var mesagesCLLCTN: UICollectionView!
    var messages = [Message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Delegados
        mesagesCLLCTN.delegate = self
        mesagesCLLCTN.dataSource = self
        
        guard let usermail = Auth.auth().currentUser?.email else {
            emailUserLBL.text = "¿dónde está el usuario?"
            return
        }
        emailUserLBL.text = usermail
        TC_Serv_Channel().returnMessages("DMPgUh8MKRk9ZJcCwQcw") { (error, _messages) in
            if _messages != nil {
                self.messages = _messages!
                self.mesagesCLLCTN.reloadData()
            }
        }
        
        listener()
        
        
    }
    
    func listener(){
        TC_Serv_Channel().messagesCollection("DMPgUh8MKRk9ZJcCwQcw").addSnapshotListener { (query, error) in
            guard let snap = query else{
                return
            }
            snap.documentChanges.forEach({ (diff) in
                if diff.type == .added {
                    self.messages.append(Message(diff.document))
                    DispatchQueue.main.async {
                        self.mesagesCLLCTN.reloadData()
                    }
                }
            })
        }
        
    }
    
    
    @IBAction func newMessage(_ sender: Any) {
        if newTextTF.text?.count != 0 {
            TC_Serv_Channel().newMessage("DMPgUh8MKRk9ZJcCwQcw", newTextTF.text, Auth.auth().currentUser?.uid) { (error, bool) in
                if error != nil {
                    print(error)
                } else {
//                    print("se ha creado con éxito")
                }
            }
        }
    }
    
    
}


extension MainViewViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if messages.count < 1 {
            return 1
        }
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mesagesCLLCTN.dequeueReusableCell(withReuseIdentifier: "message", for: indexPath) as! mainViewCollectionViewCell
        
//        if (indexPath.row % 2) == 0 {
        if messages.count != 0 {
            cell.text.text = messages[indexPath.row].text
            if (messages[indexPath.row].uidSender != Auth.auth().currentUser?.uid){
                cell.backgroundColor = UIColor.red
                cell.text.textAlignment = .left
                
            } else {
                cell.backgroundColor = UIColor.green
                cell.text.textAlignment = .right
                
            }
        }
        
        return cell
    }
    
    
    

    
}
