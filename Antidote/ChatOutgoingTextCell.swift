// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit
import SnapKit

class ChatOutgoingTextCell: ChatBaseTextCell {
    override func setupWithTheme(_ theme: Theme, model: BaseCellModel) {
        super.setupWithTheme(theme, model: model)

        guard let textModel = model as? ChatOutgoingTextCellModel else {
            assert(false, "Wrong model \(model) passed to cell \(self)")
            return
        }

        bubbleNormalBackground = theme.colorForType(.ChatOutgoingBubble)
        if !textModel.delivered {
            if !textModel.sentpush {
                bubbleNormalBackground = theme.colorForType(.ChatOutgoingUnreadBubble)
            } else {
                bubbleNormalBackground = theme.colorForType(.ChatOutgoingSentPushBubble)
            }
        }

        bubbleView.textColor = theme.colorForType(.ConnectingText)
        bubbleView.backgroundColor = bubbleNormalBackground
        bubbleView.tintColor = theme.colorForType(.NormalText)
        bubbleView.font = UIFont.preferredFont(forTextStyle: .body)
    }

    override func installConstraints() {
        super.installConstraints()

        bubbleView.snp.makeConstraints {
            $0.top.equalTo(movableContentView).offset(ChatBaseTextCell.Constants.BubbleVerticalOffset)
            $0.bottom.equalTo(movableContentView).offset(-ChatBaseTextCell.Constants.BubbleVerticalOffset)
            $0.trailing.equalTo(movableContentView).offset(-ChatBaseTextCell.Constants.BubbleHorizontalOffset)
        }
    }
}

// Accessibility
extension ChatOutgoingTextCell {
    override var accessibilityLabel: String? {
        get {
            return String(localized: "accessibility_outgoing_message_label")
        }
        set {}
    }
}
