Pod::Spec.new do |s|
  s.name = 'Warp'
  s.version = '1.2'
  s.license = 'MIT'
  s.summary = 'Most powerful Swift object-mapper'
  s.homepage = 'https://github.com/JiriTrecak/Warp'
  s.social_media_url = 'https://twitter.com/JiriTrecak'
  s.authors = { 'Jiri Trecak' => 'jiritrecak@gmail.com' }
  s.source = { :git => 'https://github.com/JiriTrecak/Warp.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end