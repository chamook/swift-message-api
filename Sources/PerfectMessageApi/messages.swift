class Messages {
    private var messages : [Message] = []

    func addMessage(msg : Message) {
        messages.append(msg)
    }

    func findMessage(id : String) -> Message? {
        if id.isEmpty {
            return nil
        }

        return messages.first{ $0.msgId == id }
    }
}
