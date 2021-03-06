# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'phantom_forms'
  s.version     = '0.3.0'
  s.summary     = 'Phantom Forms'
  s.description = 'rails helpers for bootstrap 3'
  s.licenses = ['GNU GPL-3', 'AGPL-3']

  s.author            = ['Vassil Kalkov', 'Rei Kagetsuki', 'Nakaya Yukiharu']
  s.email             = 'info@genshin.org'
  s.homepage          = 'http://github.com/Genshin/phantom_forms'

  s.files = Dir["{lib,vendor}/**/*"] + ["README.md"]
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'
  s.add_dependency 'rails4_client_side_validations', '~> 4.2'
  s.add_dependency 'rails'
  s.add_dependency 'phantom_helpers', '~> 0.11.0'
end
