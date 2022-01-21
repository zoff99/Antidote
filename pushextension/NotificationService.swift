// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    fileprivate var lastRemoteNotifictionTS: TimeInterval = 0
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        var change :Bool = false
        // check of last notification was received less than 21 seconds ago
        if ((Date().timeIntervalSince1970 - lastRemoteNotifictionTS) < 21 * 1000) {
            change = true
        }

        lastRemoteNotifictionTS = Date().timeIntervalSince1970

        if let bestAttemptContent = bestAttemptContent {
            if (change) {
                bestAttemptContent.title = "connecting ..."
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
