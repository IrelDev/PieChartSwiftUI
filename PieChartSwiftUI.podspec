Pod::Spec.new do |s|
  s.name         = "PieChartSwiftUI"
  s.version      = "1.0.0"
  s.summary      = "Simple pie chart built in Swift & SwiftUI."
  s.homepage     = "https://github.com/IrelDev/PieChartSwiftUI"
  s.swift_version= '5.0'

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Kirill Pustovalov"
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/IrelDev/PieChartSwiftUI.git", :tag => "#{s.version}" }
  s.source_files = "Sources/**/*.swift"
end
