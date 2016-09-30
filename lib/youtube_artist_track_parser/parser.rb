module YoutubeArtistTrackParser
  class Parser
    def initialize(title:)
      @title = Cleaner.clean_title(title)
    end

    def artist
      return @artist if defined?(@artist)
      return @artist = nil if invalid? || splitter.artist.nil?
      @artist = Cleaner.clean_artist(splitter.artist)
    end

    def track
      return @track if defined?(@track)
      return @track = nil if invalid? || splitter.track.nil?
      @track = Cleaner.clean_track(splitter.track)
    end

  private

    def invalid?
      @title.nil? || @title.empty?
    end

    def splitter
      @splitter ||= Splitter.new(title: @title)
    end
  end
end
