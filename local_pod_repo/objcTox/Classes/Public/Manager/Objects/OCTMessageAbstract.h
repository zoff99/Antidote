// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#import "OCTObject.h"

@class OCTFriend;
@class OCTChat;
@class OCTMessageText;
@class OCTMessageFile;
@class OCTMessageCall;

/**
 * An abstract message that represents one chunk of chat history.
 *
 * Please note that all properties of this object are readonly.
 * You can change some of them only with appropriate method in OCTSubmanagerObjects.
 */
@interface OCTMessageAbstract : OCTObject

/**
 * The date interval when message was send/received.
 */
@property NSTimeInterval dateInterval;

/**
 * Unixtimestamp when messageV3 was sent or 0.
 */
@property NSTimeInterval tssent;

/**
 * Unixtimestamp when messageV3 was received or 0.
 */
@property NSTimeInterval tsrcvd;

/**
 * Unique identifier of friend that have send message.
 * If the message if outgoing senderUniqueIdentifier is nil.
 */
@property (nullable) NSString *senderUniqueIdentifier;

/**
 * The chat message message belongs to.
 */
@property (nonnull) NSString *chatUniqueIdentifier;

/**
 * Message has one of the following properties.
 */
@property (nullable) OCTMessageText *messageText;
@property (nullable) OCTMessageFile *messageFile;
@property (nullable) OCTMessageCall *messageCall;

/**
 * The date when message was send/received.
 */
- (nonnull NSDate *)date;

/**
 * Indicates if message is outgoing or incoming.
 * In case if it is incoming you can check `sender` property for message sender.
 */
- (BOOL)isOutgoing;

@end

RLM_ARRAY_TYPE(OCTMessageAbstract)
