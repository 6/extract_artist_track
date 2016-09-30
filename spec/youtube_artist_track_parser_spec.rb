describe YoutubeArtistTrackParser do
  it 'has a version number' do
    expect(YoutubeArtistTrackParser::VERSION).not_to be nil
  end

  YAML.load_file('./spec/fixtures/songs.yml').each do |song|
    describe song["title"] do
      subject { described_class.new(title: song["title"]) }

      its(:artist) { is_expected.to eq(song["artist"]) }
      its(:track) { is_expected.to eq(song["track"]) }
    end
  end
end
