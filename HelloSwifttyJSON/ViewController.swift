//
//  ViewController.swift
//  HelloSwifttyJSON
//
//  Created by 下村一将 on 2016/02/06.
//  Copyright © 2016年 kaz. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let dataArray = ["test1", "test2", "test3"]
        let json = JSON(dataArray)
        print(json)
        
        let dataDictionary = ["1":"test1", "2":"test2", "3":"test3"]
        let json2 = JSON(dataDictionary)
        print(json2)
        
        var list = json.arrayValue
        list.append(json2)
        
        print(JSON(list))
        */
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let url = NSURL(string:"http://geoapi.heartrails.com/api/json?method=getCities&prefecture=%E5%B2%A9%E6%89%8B%E7%9C%8C")
        
        let request = NSURLRequest(URL: url!)
        session.dataTaskWithRequest(request, completionHandler: {
            (data, response, err) in
            
            guard let data:NSData = data else {
                print(err)
                return
            }
            
            let json = JSON(data:data)
            print(json)
            
        }).resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

