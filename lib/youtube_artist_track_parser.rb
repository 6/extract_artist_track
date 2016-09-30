require "ostruct"
require "mime/types/full"

require "youtube_artist_track_parser/version"
require "youtube_artist_track_parser/splitter"
require "youtube_artist_track_parser/cleaner"
require "youtube_artist_track_parser/parser"

module YoutubeArtistTrackParser
  QUOTES = [
    '“”',
    '""',
    "''",
    '『』',
    '「」',
    '【】',
    '‹›' ,
    '«»',
  ]

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
end
