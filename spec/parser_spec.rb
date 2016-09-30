describe YoutubeArtistTrackParser::Parser do
  context "with nil title" do
    subject { described_class.new(title: nil) }

    its(:artist) { is_expected.to be_nil }
    its(:track) { is_expected.to be_nil }
  end

  context "with empty title" do
    subject { described_class.new(title: "") }

    its(:artist) { is_expected.to be_nil }
    its(:track) { is_expected.to be_nil }
  end

  YAML.load_file('./spec/fixtures/songs.yml').each do |song|
    describe song["title"] do
      subject { described_class.new(title: song["title"]) }

      its(:artist) { is_expected.to eq(song["artist"]) }
      its(:track) { is_expected.to eq(song["track"]) }
    end
  end
end
