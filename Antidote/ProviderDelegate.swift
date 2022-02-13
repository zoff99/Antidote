import AVFoundation
import CallKit

class ProviderDelegate: NSObject {

    private let provider: CXProvider
    fileprivate var uuid_call: UUID!

    override init() {
        provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "Antidote"))
        super.init()
        self.uuid_call = nil
        provider.setDelegate(self, queue: nil)
    }

    func reportIncomingCall(uuid: UUID, handle: String, hasVideo: Bool = false, completion: ((Error?) -> Void)?) {
        let controller = CXCallController()
        self.uuid_call = UUID()
        let transaction = CXTransaction(action: CXStartCallAction(call: self.uuid_call,
                handle: CXHandle(type: .generic, value: "XYZ is calling")))
        controller.request(transaction, completion: { error in })
        print("cc:call-startincomingcall")
    }

    func endIncomingCall() {
        print("cc:call-endincomingcall-start")
        if (self.uuid_call == nil)
        {
            return
        }

        let uuid_: UUID = self.uuid_call
        self.uuid_call = nil

        let backgroundTaskIdentifier = 
          UIApplication.shared.beginBackgroundTask(expirationHandler: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let controller2 = CXCallController()
            let transaction2 = CXTransaction(action: CXEndCallAction(call: uuid_))
            controller2.request(transaction2,completion: { error in })
            print("cc:call-endincomingcall-done")
            UIApplication.shared.endBackgroundTask(backgroundTaskIdentifier)
        }
    }

    func endIncomingCallOther() {
        print("cc:call-endincomingcallother-start")
        if (self.uuid_call == nil)
        {
            return
        }

        let backgroundTaskIdentifier = 
          UIApplication.shared.beginBackgroundTask(expirationHandler: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.provider.reportCall(with: self.uuid_call, endedAt: Date(), reason: .remoteEnded)
            self.uuid_call = nil
            print("cc:call-endincomingcallother-done")
            UIApplication.shared.endBackgroundTask(backgroundTaskIdentifier)
        }
    }
}

// MARK: - CXProviderDelegate
extension ProviderDelegate: CXProviderDelegate {

    func providerDidReset(_ provider: CXProvider) {
        print("cc:call-providerDidReset")
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
        print("cc:call-CXAnswerCallAction %@", action.callUUID)
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
        print("cc:call-CXEndCallAction %@", action.callUUID)
    }
}

