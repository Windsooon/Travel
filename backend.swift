//
//  backend.swift
//  
//
//  Created by 安创 on 2017/8/30.
//
//

import Alamofire
import SwiftyJSON

let base_url = "http://127.0.0.1:8000/api/"

func getCountry(completionHandler: @escaping ([JSON]?, Error?) -> ()) {
    getBackend(base_url, "country", completionHandler: completionHandler)
}

func getBackend(_ url: String, _ section: String, completionHandler: @escaping ([JSON]?, Error?) -> ()) {
    Alamofire.request(base_url + section + "/").validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            let countryList = JSON(value)
            completionHandler(countryList["results"].array, nil)
        case .failure(let error):
            completionHandler(nil, error)
        }
    }
}
