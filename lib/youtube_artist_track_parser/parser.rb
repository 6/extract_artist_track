module YoutubeArtistTrackParser
  class Parser
    attr_reader :title, :splitter
    def initialize(title:)
      @title = Cleaner.clean_title(title)
      @splitter = Splitter.new(title: @title)
    end

    def artist
      return @artist if defined?(@artist)
      return @artist = nil if invalid? || split_artist.nil?
      @artist = Cleaner.clean_artist(split_artist)
    end

    def track
      return @track if defined?(@track)
      return @track = nil if invalid? || split_track.nil?
      @track = Cleaner.clean_track(split_track)
    end

  private

    def invalid?
      title.nil? || title.empty?
    end

    def split_artist
      @split_artist ||= splitter.artist
    end

    def split_track
      @split_artist ||= splitter.track
    end
  end
end
