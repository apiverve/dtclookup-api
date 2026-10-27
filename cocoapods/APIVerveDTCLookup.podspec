Pod::Spec.new do |s|
  s.name             = 'APIVerveDTCLookup'
  s.version          = '1.2.3'
  s.summary          = 'DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100.'
  s.description      = <<-'DESC'
DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code's system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.

This iOS/macOS SDK provides a convenient way to access the DTC Lookup from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/dtclookup?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/dtclookup-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveDTCLookup/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
