# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube_artist_track_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_artist_track_parser"
  spec.version       = YoutubeArtistTrackParser::VERSION
  spec.authors       = ["Peter Graham"]
  spec.email         = ["peterghm@gmail.com"]

  spec.summary       = %q{Extract artist and track from YouTube video title.}
  spec.description   = %q{Extract artist and track from a freeform YouTube video title.}
  spec.homepage      = "https://github.com/6/youtube_artist_track_parser"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its", "~> 1.2"
end
