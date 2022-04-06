import Foundation
import ObjectMapper

class SingleDealResponse : Mappable {
	var status : Int?
	var message : String?
	var detail : SingleDealDetail?

    required init?(map: Map) {

	}

    func mapping(map: Map) {

		status <- map["status"]
		message <- map["message"]
		detail <- map["detail"]
	}

}
