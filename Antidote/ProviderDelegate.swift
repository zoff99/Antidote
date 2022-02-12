import AVFoundation
import CallKit

class ProviderDelegate: NSObject {

  private let provider: CXProvider
  
  override init() {
    provider = CXProvider(configuration: ProviderDelegate.providerConfiguration)
    super.init()
    provider.setDelegate(self, queue: nil)
  }
  
  static var providerConfiguration: CXProviderConfiguration = {
    let providerConfiguration = CXProviderConfiguration(localizedName: "Antidote")
    
    providerConfiguration.supportsVideo = true
    providerConfiguration.maximumCallsPerCallGroup = 2
    providerConfiguration.includesCallsInRecents = false
    // providerConfiguration.supportedHandleTypes = [.phoneNumber]
    
    return providerConfiguration
  }()

  func reportIncomingCall(uuid: UUID, handle: String, hasVideo: Bool = false, completion: ((Error?) -> Void)?) {
    let update = CXCallUpdate()
    update.remoteHandle = CXHandle(type: .generic, value: handle)
    update.hasVideo = hasVideo
  
    provider.reportNewIncomingCall(with: uuid, update: update) { error in
        if error == nil {
            print("cc:call-in")
        }
        completion?(error)
    }
  }
}

// MARK: - CXProviderDelegate
extension ProviderDelegate: CXProviderDelegate {
  func providerDidReset(_ provider: CXProvider) {
    print("cc:call-providerDidReset")
  }

  func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    print("cc:call-CXAnswerCallAction %@", action.callUUID)
    action.fulfill()
  }

  func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
    print("cc:call-didActivate")
  }

  func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    print("cc:call-CXEndCallAction %@", action.callUUID)
    action.fulfill()
  }

}


