import Foundation

public func ShowNotification(message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\"'"]).run()
}

public func ShowNotification(title: String, message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\" with title \"\(title)\"'"]).run()
}

public func ShowNotification(title: String, subtitle: String, message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\" with title \"\(title)\" subtitle \"\(subtitle)\"'"]).run()
}
