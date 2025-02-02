// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

//
//  KeyboardObserver.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 25/11/16.
//  Copyright © 2016 dvor. All rights reserved.
//

import Foundation

class KeyboardObserver {
    private(set) var keyboardVisible = false

    init() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(KeyboardObserver.keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(KeyboardObserver.keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    deinit {
        let center = NotificationCenter.default
        center.removeObserver(self)
    }

    @objc func keyboardWillShowNotification(_ notification: Notification) {
        keyboardVisible = true
    }

    @objc func keyboardWillHideNotification(_ notification: Notification) {
        keyboardVisible = false
    }
}
