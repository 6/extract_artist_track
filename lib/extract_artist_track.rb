require "ostruct"
require "mime/types/full"

require "extract_artist_track/version"
require "extract_artist_track/splitter"
require "extract_artist_track/cleaner"
require "extract_artist_track/parser"

module ExtractArtistTrack
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
