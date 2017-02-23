import Foundation
import ScriptingBridge

let defaultAppLocations = [
    "/Applications",
    "/Applications/Utilities",
    "/System/Library/CoreServices"
]

public func appPathForName(_ name: String, locations: [String] = defaultAppLocations) -> String? {
    var path: String?
    for location in locations {
        let possiblePath = "\(location)/\(name).app"
        var isDirectory = ObjCBool(false)
        if FileManager.default.fileExists(atPath: possiblePath, isDirectory: &isDirectory) && isDirectory.boolValue {
            path = possiblePath
            break
        }
    }

    return path
}

public func application(bundleIdentifier: String) -> AnyObject? {
    return SBApplication(bundleIdentifier: bundleIdentifier)
}

public func application(path: String) -> AnyObject? {
    var app: AnyObject?
    if let bundle = Bundle(path: path) {
        app = application(bundleIdentifier: bundle.bundleIdentifier!)
    }

    return app
}

public func application(name: String, locations: [String] = defaultAppLocations) -> AnyObject? {
    var app: AnyObject?
    if let path = appPathForName(name, locations: locations) {
        app = application(path: path)
    }

    return app
}
