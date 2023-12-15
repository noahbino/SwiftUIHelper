Pod::Spec.new do |spec|

  spec.name         = "SwiftUIHelper"
  spec.version      = "0.0.3"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you do SwiftUI stuff.
                   DESC

  spec.homepage     = "https://github.com/noahbino/SwiftUIHelper"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "noahbino" => "noahiarrobino@yahoo.com" }

  spec.ios.deployment_target = "16.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/noahbino/SwiftUIHelper.git", :tag => "#{spec.version}" }
  spec.source_files  = "SwiftUIHelper/**/*.{h,m,swift}"

end