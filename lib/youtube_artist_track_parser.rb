require "ostruct"
require "youtube_artist_track_parser/version"

# These regexes are reused from:
# https://github.com/david-sabata/web-scrobbler/blob/9b4fc43b97c0e66e7b0576fb2ac0a57dc5b59c70/connectors/v2/youtube.js
class YoutubeArtistTrackParser
  SEPARATORS = [
    ' -- ',
    '--',
    ' - ',
    ' – ',
    ' — ',
    ' _ ',
    '-',
    '–',
    '—',
    ':',
    '|',
    '///',
    ' / ',
    '_',
    '/',
  ]

  attr_reader :title
  def initialize(title:)
    @title = clean_title(title)
  end

  def artist
    return @artist if defined?(@artist)
    return @artist = nil if invalid?
    artist = title[0..separator.index-1]
  end

  def track
    return @track if defined?(@track)
    return @track = nil if invalid?
    track = title[separator.index + separator.size..-1]
  end

private

  def invalid?
    separator.nil? || title.nil? || title.empty?
  end

  def clean_title(title)
    # remove [genre] from the beginning of the title
    title&.sub(/^\[[^\]]+\]\s*-*\s*/i, '')
  end

  def separator
    return @separator if defined?(@separator)
    return @separator = nil if title.nil? || title.empty?
    SEPARATORS.each do |separator|
      index = title.index(separator)
      if index
        return @separator = OpenStruct.new({
          index: index,
          size: separator.size,
        })
      end
    end
    @separator = nil
  end
end
