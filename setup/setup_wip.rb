require 'json'

extensions = %w[
  wingrunr21.vscode-ruby
  castwide.solargraph
  misogi.ruby-rubocop
  fnando.linter
  pavlitsky.yard
  CraigMaslowski.erb
  aliariff.vscode-erb-beautify
  kaiwood.endwise
]
GEMS = %w[
  solargraph
  rubocop
  reek
  htmlbeautifier
]

RUBOCOP_SETTINGS =  {
  "ruby.rubocop.onSave": true,
  "ruby.rubocop.useBundler": false,
  "ruby.rubocop.executePath": "/Users/harryyuan/.rbenv/shims/"
}
SOLARGRAPH_SETTINGS = {
  "solargraph.useBundler": false,
  "solargraph.commandPath": File.expand_path("~/.rbenv/shims/solargraph"),
  "solargraph.definitions": true,
  "solargraph.symbols": true,
  "solargraph.hover": true,
  "solargraph.references": true
}

File.open(File.expand_path('~/Library/Application Support/Code/User/settings2.json')) do |raw_settings|
  settings = JSON.parse(raw_settings)

  raw_settings.write JSON.generate settings.merge(SOLARGRAPH_SETTINGS)
end