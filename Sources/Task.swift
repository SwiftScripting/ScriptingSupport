import Foundation

public class Task {
    private let task: Process

    private let stdout: Pipe

    public init(launchPath: String, arguments: [String]) {
        task = Process()
        task.launchPath = launchPath
        task.arguments = arguments

        stdout = Pipe()
        task.standardOutput = stdout
    }

    public func run() {
        task.launch()

        let stdoutData = stdout.fileHandleForReading.readDataToEndOfFile()
        standardOutput = String(data: stdoutData, encoding: .utf8)

        task.waitUntilExit()
    }

    private(set) public var standardOutput: String?

    public var terminationStatus: Int32 {
        return task.terminationStatus
    }
}

