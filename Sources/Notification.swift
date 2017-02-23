import Foundation

func ShowNotification(message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\"'"]).run()
}

func ShowNotification(title: String, message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\" with title \"\(title)\"'"]).run()
}

func ShowNotification(title: String, subtitle: String, message: String) {
    Task(launchPath: "/usr/bin/osascript",
         arguments: ["-e", "'display notification \"\(message)\" with title \"\(title)\" subtitle \"\(subtitle)\"'"]).run()
}
