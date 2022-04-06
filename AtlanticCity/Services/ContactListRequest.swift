//
//  ContactListRequest.swift
//  AtlanticCity
//
//  Created by Hamza Arif on 26/08/2020.
//  Copyright © 2020 Hixol. All rights reserved.
//

import Foundation
import Alamofire

class ContactListRequest {
    static func getInvContacts(id:String,user_id:String,auth_id:String,success: @escaping(CLBase?,Error?) -> ()) {
           guard let url = URL(string: Helpers.main_url+"api/v1/get_invite_list") else {
               return
           }
           let headers: HTTPHeaders = [
               "user-id":user_id,
               "auth-id":auth_id
           ]
            let params: Parameters = [
                "user_id":id
            ]
           AF.request(url, method: .post,parameters: params,headers: headers)
               .validate(statusCode: 200..<500)
               .responseObject{ (response: AFDataResponse<CLBase>) in
                   
                   switch response.result {
                   case let .success(value):
    print(value)
                       print("contacts Validation Successful")
                       let swiftyJsonVar = value
                       success(swiftyJsonVar,nil)
                   case let .failure(error):
                       print(error)
                       success(nil,error)
                   }
           }
       }
}
