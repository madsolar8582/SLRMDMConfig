Pod::Spec.new do |s|
  s.name                      = 'SLRMDMConfig'
  s.version                   = '1.0.0'
  s.summary                   = 'MDM config for macOS, iOS, and tvOS.'
  s.description               = 'Helps apps retrieve MDM configuration values.'
  s.homepage                  = 'https://github.com/madsolar8582/SLRMDMConfig'
  s.license                   = { :type => 'LGPLv3', :file => 'LICENSE.md' }
  s.author                    = 'Madison Solarana'
  s.ios.deployment_target     = '13.0'
  s.macos.deployment_target   = '10.15'
  s.tvos.deployment_target    = '13.0'
  s.ios.frameworks            = 'Foundation'
  s.macos.frameworks          = 'Foundation'
  s.tvos.frameworks           = 'Foundation'
  s.source                    = { git: 'https://github.com/madsolar8582/SLRMDMConfig.git', tag: s.version.to_s }
  s.source_files              = 'SLRMDMConfig/**/*.{h,m}'
  s.requires_arc              = true
end
