//
//  backend.swift
//  
//
//  Created by 安创 on 2017/8/30.
//
//

import Alamofire

func get_country(type: String) -> String {
    
    Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
        if((responseData.result.value) != nil) {
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            if let resData = swiftyJsonVar["contacts"].arrayObject {
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 0 {
                self.tblJSON.reloadData()
            }
        }
    }
}
