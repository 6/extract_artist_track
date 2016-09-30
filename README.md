# ExtractArtistTrack

Ruby port of [get-artist-title.js](https://github.com/goto-bus-stop/get-artist-title) for getting the song artist and track name from a freeform string, e.g. a YouTube video title.

Example:

```ruby
parser = ExtractArtistTrack::Parser.new(title: "Madeon - The City (Official Video).mp4")
parser.artist
=> "Madeon"
parser.track
=> "The City"

parser = ExtractArtistTrack::Parser.new(title: "[MV] Perfume「ねぇ」")
parser.artist
=> "Perfume"
parser.track
=> "ねぇ"
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'extract_artist_track'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extract_artist_track

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

