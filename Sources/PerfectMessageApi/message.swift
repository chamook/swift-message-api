import PerfectLib
import Foundation

class Message : JSONConvertibleObject {

	static let registerName = "message"

  var msgId = ""
  var title = ""
  var body = ""

  init(msgId u : String, title t : String, body b : String) {
      self.msgId = u
      self.title = t
      self.body = b
  }

  convenience init(title t : String, body b : String) {
      let id = Foundation.UUID()
      self.init(msgId: id.uuidString, title: t, body: b)
  }

	override public func setJSONValues(_ values: [String : Any]) {
		  self.msgId =
        getJSONValue(named: "msgId", from: values, defaultValue: "")
		  self.title =
        getJSONValue(named: "title", from: values, defaultValue: "")
		  self.body =
        getJSONValue(named: "body", from: values, defaultValue: "")
	}

	override public func getJSONValues() -> [String : Any] {
		return [
			"msgId": msgId,
			"title": title,
			"body": body
		]
	}

}
