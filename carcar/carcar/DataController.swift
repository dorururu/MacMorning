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
    @IBOutlet weak var carinfoImage: UIImageView!
    var carName=""
    var carImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage(carName)
        self.loadData(carName)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadData(_ text: String) {
        
        dataText.isEditable = false
        
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
                let sql = "SELECT * FROM car WHERE name = '\(carName)'"
                let paramDictionary = [NSObject:AnyObject]()
                let results:FMResultSet? = carDB.executeQuery(sql, withParameterDictionary: paramDictionary)
            
                if (results == nil) {
                    print("Error: \(carDB.lastErrorMessage())")
                }else{
                    while(results?.next() == true) {
                        dataText.insertText((results?.string(forColumn: "name"))!+"\n")
                        dataText.insertText("모델명 : "+(results?.string(forColumn: "model"))!+"\n")
                        dataText.insertText("배기량 : "+(results?.string(forColumn: "displacement"))!+"\n")
                        dataText.insertText("최대출력 : "+(results?.string(forColumn: "maxOutput"))!+"\n")
                        dataText.insertText("연비 : "+(results?.string(forColumn: "efficiency"))!+"\n")
                        dataText.insertText("출시가 : "+(results?.string(forColumn: "price"))!+"\n")
                    }
                }
            }else {
                NSLog("디비 안 열림")
            }
        }
    }
    
    func showImage(_ carName: String) {
        carImage = UIImage(named: carName)
        carinfoImage.image = carImage
    }
}
