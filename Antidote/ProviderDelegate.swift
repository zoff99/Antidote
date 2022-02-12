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
    let providerConfiguration = CXProviderConfiguration(localizedName: "Hotline")
    
    providerConfiguration.supportsVideo = true
    providerConfiguration.maximumCallsPerCallGroup = 1
    providerConfiguration.supportedHandleTypes = [.phoneNumber]
    
    return providerConfiguration
  }()

  func reportIncomingCall(uuid: UUID, handle: String, hasVideo: Bool = false, completion: ((Error?) -> Void)?) {
    let update = CXCallUpdate()
    update.remoteHandle = CXHandle(type: .phoneNumber, value: handle)
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
  }

  func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    action.fulfill()
  }

  func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
  }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    action.fulfill()
  }

}


