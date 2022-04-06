import Foundation
import ObjectMapper

class ProfileError : Mappable {
	var status : Int?
    var message : String?
    
    required init?(map: Map) {

	}
    func mapping(map: Map) {
		status <- map["status"]
        message <- map["message"]
	}

}
