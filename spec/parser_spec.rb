describe YoutubeArtistTrackParser::Parser do
  YAML.load_file('./spec/fixtures/songs.yml').each do |song|
    describe song["title"] do
      subject { described_class.new(title: song["title"]) }

      its(:artist) { is_expected.to eq(song["artist"]) }
      its(:track) { is_expected.to eq(song["track"]) }
    end
  end
end
