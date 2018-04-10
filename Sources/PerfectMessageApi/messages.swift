class Messages {
    var messages : [Message] = []

    func addMessage(_ msg : Message) {
        messages.append(msg)
    }

    func findMessage(id : String) -> Message? {
        if id.isEmpty {
            return nil
        }

        return messages.first{ $0.id == id }
    }
}
