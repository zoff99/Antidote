// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    static var lastRemoteNotifictionTS: Int64 = 0
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        var change: Bool = false

        var diffTime = Date().millisecondsSince1970 - NotificationService.lastRemoteNotifictionTS
        print("noti:Tlast=\(NotificationService.lastRemoteNotifictionTS)")
        print("noti:Tnow=\(Date().millisecondsSince1970)")
        print("noti:Tdiff=\(diffTime)")

        var lastTs = NotificationService.lastRemoteNotifictionTS

        // check if last notification was received less than 24 seconds ago
        if (diffTime < (24 * 1000)) {
            print("noti:change=true")
            change = true
        }

        NotificationService.lastRemoteNotifictionTS = Date().millisecondsSince1970

        if let bestAttemptContent = bestAttemptContent {
            if (change) {
                print("noti:actually changing")
                bestAttemptContent.title = "connecting ... ts=\(lastTs)"
            }
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

extension Date {
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
