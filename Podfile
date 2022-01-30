source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def common_pods
    pod 'objcTox', :git => 'https://github.com/zoff99/objcTox.git', :commit => '1a6ec99e8c704e7465314be87ca81cf023aad4a7'
    pod 'UITextView+Placeholder', '~> 1.1.0'
    pod 'SDCAlertView', '~> 2.5.4'
    pod 'LNNotificationsUI', :git => 'https://github.com/LeoNatan/LNNotificationsUI.git', :commit => '3f75043fc6e77b4180b76cb6cfff4faa506ab9fc'
    pod 'JGProgressHUD', '~> 1.4.0'
    pod "toxcore", :git => 'https://github.com/Zoxcore/toxcore.git', :commit => '25c99383d200d3a616b4e979dfdd0ed55276c3ea'
    pod 'SnapKit', '~> 5.0.1'
    pod 'Yaml', '~> 3.4.4'
    pod 'Firebase/Messaging'
end

target :Antidote do
    common_pods
end

target :AntidoteTests do
    common_pods
    pod 'FBSnapshotTestCase/Core'
end

target :ScreenshotsUITests do
    common_pods
end
