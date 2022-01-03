// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit
import SnapKit

private struct Constants {
    static let TopBorderHeight = 0.5
    static let Offset: CGFloat = 5.0
    static let CameraHorizontalOffset: CGFloat = 10.0
    static let CameraBottomOffset: CGFloat = -10.0
    static let TextViewMinHeight: CGFloat = 35.0
    static let MAX_TEXT_INPUT_CHARS = 1000
}

protocol ChatInputViewDelegate: class {
    func chatInputViewCameraButtonPressed(_ view: ChatInputView, cameraView: UIView)
    func chatInputViewSendButtonPressed(_ view: ChatInputView)
    func chatInputViewTextDidChange(_ view: ChatInputView)
}

class ChatInputView: UIView {
    weak var delegate: ChatInputViewDelegate?

    var text: String {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
            updateViews()
        }
    }

    var maxHeight: CGFloat {
        didSet {
            updateViews()
        }
    }

    var cameraButtonEnabled: Bool = true{
        didSet {
            updateViews()
        }
    }

    fileprivate var topBorder: UIView!
    fileprivate var cameraButton: UIButton!
    fileprivate var textView: UITextView!
    fileprivate var sendButton: UIButton!

    init(theme: Theme) {
        self.maxHeight = 0.0

        super.init(frame: CGRect.zero)

        backgroundColor = theme.colorForType(.ChatInputBackground)

        createViews(theme)
        installConstraints()
        updateViews()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func becomeFirstResponder() -> Bool {
        return textView.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        return textView.resignFirstResponder()
    }
}

// MARK: Actions
extension ChatInputView {
    @objc func cameraButtonPressed() {
        delegate?.chatInputViewCameraButtonPressed(self, cameraView: cameraButton)
    }

    @objc func sendButtonPressed() {
        delegate?.chatInputViewSendButtonPressed(self)
    }
}

extension ChatInputView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updateViews()
        delegate?.chatInputViewTextDidChange(self)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under MAX_TEXT_INPUT_CHARS characters
        return updatedText.count <= Constants.MAX_TEXT_INPUT_CHARS
    }
}

private extension ChatInputView {
    func createViews(_ theme: Theme) {
        topBorder = UIView()
        topBorder.backgroundColor = theme.colorForType(.SeparatorsAndBorders)
        addSubview(topBorder)

        let cameraImage = UIImage.templateNamed("chat-camera")

        cameraButton = UIButton()
        cameraButton.setImage(cameraImage, for: UIControlState())
        cameraButton.tintColor = theme.colorForType(.LinkText)
        cameraButton.addTarget(self, action: #selector(ChatInputView.cameraButtonPressed), for: .touchUpInside)
        cameraButton.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        addSubview(cameraButton)

        textView = UITextView()
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 16.0)
        textView.backgroundColor = theme.colorForType(.NormalBackground)
        textView.layer.cornerRadius = 5.0
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = theme.colorForType(.SeparatorsAndBorders).cgColor
        textView.layer.masksToBounds = true
        textView.setContentHuggingPriority(UILayoutPriority(rawValue: 0.0), for: .horizontal)
        textView.autocapitalizationType = .none

        addSubview(textView)

        sendButton = UIButton(type: .system)
        sendButton.setTitle(String(localized: "chat_send_button"), for: UIControlState())
        sendButton.titleLabel?.font = UIFont.antidoteFontWithSize(16.0, weight: .bold)
        sendButton.addTarget(self, action: #selector(ChatInputView.sendButtonPressed), for: .touchUpInside)
        sendButton.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        addSubview(sendButton)
    }

    func installConstraints() {
        topBorder.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.height.equalTo(Constants.TopBorderHeight)
        }

        cameraButton.snp.makeConstraints {
            $0.leading.equalTo(self).offset(Constants.CameraHorizontalOffset)
            $0.bottom.equalTo(self).offset(Constants.CameraBottomOffset)
        }

        textView.snp.makeConstraints {
            $0.leading.equalTo(cameraButton.snp.trailing).offset(Constants.CameraHorizontalOffset)
            // HINT: this prevents the textview to show more lines of input text
            // $0.top.equalTo(self).offset(Constants.Offset)
            $0.bottom.equalTo(self).offset(-Constants.Offset)
            $0.height.greaterThanOrEqualTo(Constants.TextViewMinHeight)
        }

        sendButton.snp.makeConstraints {
            $0.leading.equalTo(textView.snp.trailing).offset(Constants.Offset)
            $0.trailing.equalTo(self).offset(-Constants.Offset)
            $0.bottom.equalTo(self).offset(-Constants.Offset)
        }
    }

    func updateViews() {
        textView.isScrollEnabled = false
        textView.autocapitalizationType = .none
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)

        cameraButton.isEnabled = cameraButtonEnabled
        sendButton.isEnabled = !textView.text.isEmpty
    }
}
