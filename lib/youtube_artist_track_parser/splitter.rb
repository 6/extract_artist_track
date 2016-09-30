module YoutubeArtistTrackParser
  class Splitter
    attr_reader :title, :artist, :track
    def initialize(title:)
      @title = title
      return if title.nil? || title.empty?
      split = split_by_separator
      split ||= split_by_quotes
      @artist = split&.artist
      @track = split&.track
    end

    def split_by_separator
      SEPARATORS.each do |separator|
        index = title.index(separator)
        if index
          return OpenStruct.new({
            artist: title[0..index-1],
            track: title[index..-1],
          })
        end
      end
      nil
    end

    def split_by_quotes
      regexes = QUOTES.map { |set| %r{#{set[0]}(.*?)#{set[1]}} }
      regexes.each do |regex|
        str = title.gsub(regex) { |match| " #{match} " }
        index = regex =~ str
        if index
          return OpenStruct.new({
            artist: str[0..index-1],
            track: str[index..-1],
          })
        end
      end
      nil
    end
  end
end
