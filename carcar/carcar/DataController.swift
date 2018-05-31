//
//  DataController.swift
//  carcar
//
//  Created by 김민주 on 2018. 5. 31..
//  Copyright © 2018년 MacMorning. All rights reserved.
//

import UIKit

class DataController: UIViewController {

    @IBOutlet weak var dataText: UITextView!
    
    var carName=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataText.text = carName
        
        //self.loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadData(_ text: String) {
        
        dataText.isEditable = false
        //dataText.insertText(text)
        
        let fileManager = FileManager.default
        let dirPaths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        var databasePath = dirPaths.appendingPathComponent("cars.db").path
    
        let sourcePath = Bundle.main.path(forResource: "cars", ofType: "db")
        let destinationPath = databasePath
    
        if !fileManager.fileExists(atPath: databasePath) {
            do {
                try FileManager.default.copyItem(atPath: sourcePath!, toPath: destinationPath)
            } catch let _ as NSError {
                NSLog("카피 실패")
            }
        }
    
        if !fileManager.fileExists(atPath: databasePath) {
            NSLog("카피 했는데 또 없으면 이상한 것")
        }else {
            print("Database file found at path: \(databasePath)")
            let carDB = FMDatabase(path: databasePath)
        
            if carDB == nil {
                print("Error: \(carDB.lastErrorMessage())")
            }
        
            if carDB.open() {
                NSLog("디비 열림")
                let sql = "SELECT name, info FROM car WHERE name = 'kia'"
                let paramDictionary = [NSObject:AnyObject]()
                let results:FMResultSet? = carDB.executeQuery(sql, withParameterDictionary: paramDictionary)
            
                if (results == nil) {
                    print("Error: \(carDB.lastErrorMessage())")
                }else{
                    while(results?.next() == true) {
                        NSLog((results?.string(forColumn: "name"))!)
                        NSLog((results?.string(forColumn: "info"))!)
                        dataText.insertText((results?.string(forColumn: "name"))!)
                        dataText.insertText((results?.string(forColumn: "info"))!)
                    }
                }
            }else {
                NSLog("디비 안 열림")
            }
        }
    }
    
    
    
}
