//
//  ViewController.swift
//  ClassOct23
//
//  Created by Guanyi Fang on 2015-10-23.
//  Copyright © 2015 Guanyi Fang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/firstmongo/collections/Student?apiKey=JosaVGrEGYbVAdO3q-WTOK6_mNvPOXoX")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value = response.result.value {
                    print("JSON: \(value)")
                    
                    var StudentList = JSON(value)
                    print(StudentList.type)
                    print(StudentList[0, "Name"])
                    
                    /*for student in StudentList {
                        print(student.type)
                    }*/
                    var st = StudentList[0]
                    print(st.type)
                    print(st["Name"])
                    
                    /*for var i = 0; i < StudentList.count; i++ {
                        print(StudentList[i, "Name"])
                    }*/
                    
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

