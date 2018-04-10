import PerfectHTTP
import PerfectHTTPServer
import PerfectLib

class Handlers {
    var msgs = Messages()

    func listHandler(request: HTTPRequest, response: HTTPResponse) {
        do {
            response.setHeader(.contentType, value: "application/json")
            let body = try msgs.messages.jsonEncodedString()
            response.appendBody(string: body)
            response.next()
        } catch {
            response.status = .internalServerError
            response.completed()
        }
    }

    func addHandler(request: HTTPRequest, response: HTTPResponse) {
        guard let x = request.postBodyString else {
            response.status = .internalServerError
            response.completed()
            return ()
        }
        guard let y = try? x.jsonDecode() as! [String:Any] else {
            response.status = .badRequest
            response.appendBody(string: "Could not decode")
            response.completed()
            return ()
        }

        let msg = Message(y)
        msgs.addMessage(msg)
        response.appendBody(string: msg.id)
        response.next()
    }

    func getHandler(request: HTTPRequest, response: HTTPResponse) {
        guard let id = request.urlVariables["id"],
              let msg = msgs.findMessage(id: id),
              let body = try? msg.jsonEncodedString() else {
            response.status = .notFound
            response.completed()
            return ()
        }

        response.appendBody(string: body)
        response.next()
    }

    func patchHandler(request: HTTPRequest, response: HTTPResponse) {
        guard let x = request.postBodyString else {
            response.status = .internalServerError
            response.completed()
            return ()
        }
        guard let y = try? x.jsonDecode() as! [String:Any] else {
            response.status = .badRequest
            response.appendBody(string: "Could not decode")
            response.completed()
            return ()
        }
        guard let id = request.urlVariables["id"],
              let msg = msgs.findMessage(id: id) else {
            response.status = .notFound
            response.completed()
            return ()
        }

        msg.setJSONValues(y)
        if let resp = try? msg.jsonEncodedString() {
            response.appendBody(string: resp)
        }

        response.next()
    }
}
