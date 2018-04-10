import PerfectLib
import Foundation

class Message : JSONConvertibleObject {

  static let registerName = "message"

  var id = ""
  var title = ""
  var body = ""

  init(id : String, title : String, body : String) {
      self.id = id
      self.title = title
      self.body = body
  }

  override convenience init() {
      self.init(id: "", title: "", body: "")
  }

  override public func setJSONValues(_ values: [String : Any]) {
      self.id =
        getJSONValue(named: "id", from: values, defaultValue: self.id)
      self.title =
        getJSONValue(named: "title", from: values, defaultValue: self.title)
      self.body =
        getJSONValue(named: "body", from: values, defaultValue: self.body)
  }

  override public func getJSONValues() -> [String : Any] {
    return [
      "id": id,
      "title": title,
      "body": body
    ]
  }

  convenience init(_ values: [String : Any]) {
      let id = UUID().uuidString
      self.init()

      self.id = id
      self.title =
        getJSONValue(named: "title", from: values, defaultValue: self.title)
      self.body =
        getJSONValue(named: "body", from: values, defaultValue: self.body)
  }
}
