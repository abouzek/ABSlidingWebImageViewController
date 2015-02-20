Pod::Spec.new do |s|
  s.name             = "ABSlidingWebImageViewController"
  s.version          = "0.3.0"
  s.summary          = "A scrolling image collection view with asynchronous photo loading and single image focusing built in."
  s.description      = "A scrolling image collection view with asynchronous photo loading and single image focusing built in. Meant to be used with an item size and height to constrain the collection view to a single line"
  s.homepage         = "https://github.com/abouzek/ABSlidingWebImageViewController"
  s.license          = 'MIT'
  s.author           = { "abouzek" => "alan.bouzek@gmail.com" }
  s.source           = { :git => "https://github.com/abouzek/ABSlidingWebImageViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alanbouzek'

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = ['Pod/Assets/*.xib']
  s.resource_bundles = {
    'ABSlidingWebImageViewController' => ['Pod/Assets/*.png']
  }

  s.dependency 'SDWebImage', '~>3.6'
  s.dependency 'ASMediaFocusManager'
end
