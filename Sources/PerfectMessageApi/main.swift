import PerfectHTTP
import PerfectHTTPServer
import PerfectLib

let handlers = Handlers()
let confData = [
	"servers": [
		[
			"name":"localhost",
			"port":8181,
			"routes":[
				["method":"get",
         "uri":"/",
         "handler": handlers.listHandler],
				["method":"get",
         "uri":"/message/{id}/",
         "handler": handlers.getHandler],
				["method":"post",
         "uri":"/message/",
         "handler": handlers.addHandler],
				["method":"patch",
         "uri":"/message/{id}",
         "handler": handlers.patchHandler],
			]
		]
	]
]

do {
	try HTTPServer.launch(configurationData: confData)
} catch {
	fatalError("\(error)")
}

