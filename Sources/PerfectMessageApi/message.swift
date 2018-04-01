import PerfectLib

class Message : JSONConvertibleObject {

	static let registerName = "message"

  var userId = ""
  var title = ""
  var body = ""

  init(userId u : String, title t : String, body b : String){
      self.userId = u
      self.title = t
      self.body = b
  }

	override public func setJSONValues(_ values: [String : Any]) {
		  self.userId =
        getJSONValue(named: "userId", from: values, defaultValue: "")
		  self.title =
        getJSONValue(named: "title", from: values, defaultValue: "")
		  self.body =
        getJSONValue(named: "body", from: values, defaultValue: "")
	}

	override public func getJSONValues() -> [String : Any] {
		return [
			"userId": userId,
			"title": title,
			"body": body
		]
	}

}
