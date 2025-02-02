// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

//
//  ChatBottomStatusViewManager.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 26/04/2017.
//  Copyright © 2017 dvor. All rights reserved.
//

import Foundation

class ChatBottomStatusViewManager {
    fileprivate weak var submanagerObjects: OCTSubmanagerObjects!

    fileprivate let friend: OCTFriend?
    fileprivate let undeliveredMessages: Results<OCTMessageAbstract>

    fileprivate var friendToken: RLMNotificationToken?
    fileprivate var undeliveredMessagesToken: RLMNotificationToken?

    init(friend: OCTFriend?, messages: Results<OCTMessageAbstract>, submanagerObjects: OCTSubmanagerObjects) {
        self.submanagerObjects = submanagerObjects
        self.friend = friend
        self.undeliveredMessages = messages.undeliveredMessages()

        addFriendNotification()
        addMessagesNotification()
    }

    deinit {
        friendToken?.invalidate()
        undeliveredMessagesToken?.invalidate()
    }
}

private extension ChatBottomStatusViewManager {
    func addFriendNotification() {
        guard let friend = self.friend else {
            return
        }

        friendToken = submanagerObjects.notificationBlock(for: friend) { [unowned self] change in
            switch change {
                case .initial:
                    break
                case .update:
                    self.updateTableHeaderView()
                case .error(let error):
                    break
            }
        }
    }

    func addMessagesNotification() {
        // self.undeliveredMessagesToken = undeliveredMessages.addNotificationBlock { [unowned self] change in
        //     guard let tableView = self.tableView else {
        //         return
        //     }
        //     switch change {
        //         case .initial:
        //             break
        //         case .update(_, let deletions, let insertions, let modifications):
        //             tableView.beginUpdates()
        //             self.updateTableViewWithDeletions(deletions)
        //             self.updateTableViewWithInsertions(insertions)
        //             self.updateTableViewWithModifications(modifications)

        //             self.visibleMessages = self.visibleMessages + insertions.count - deletions.count
        //             tableView.endUpdates()

        //             self.updateTableHeaderView()

        //             if insertions.contains(0) {
        //                 self.handleNewMessage()
        //             }
        //         case .error(let error):
        //             fatalError("\(error)")
        //     }
        // }
    }

    func updateTableHeaderView() {
        
    }
}
