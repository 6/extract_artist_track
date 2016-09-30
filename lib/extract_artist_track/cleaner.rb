module ExtractArtistTrack
  class Cleaner
    def self.clean_title(title)
      return if !title.is_a?(String)
      title = clean_file_extension(title)
      clean_fluff(title)
    end

    def self.clean_artist(artist)
      artist = clean_fluff(artist.strip)
        .gsub(/\s*[0-1][0-9][0-1][0-9][0-3][0-9]\s*/, '') # date formats ex. 130624
        .gsub(/^[\/\s,:;~\-–_\s"]+/, '') # trim starting white chars and dash
        .gsub(/[\/\s,:;~\-–_\s"]+$/, '') # trim trailing white chars and dash
      clean_quotes(artist)
    end

    def self.clean_track(track)
      track = clean_fluff(track.strip)
        .gsub(/\s*\*+\s?\S+\s?\*+$/, '') # **NEW**
        .gsub(/\s*video\s*clip/i, '') # video clip
        .gsub(/\s+\(?live\)?$/i, '') # live
        .gsub(/\(\s*\)/, '') # Leftovers after e.g. (official video)
        .gsub(/\[\s*\]/, '') # Leftovers after e.g. [1080p]
        .gsub(/【\s*】/, '') # Leftovers after e.g. 【MV】
        .gsub(/^(|.*\s)"(.*)"(\s.*|)$/, '\2') # Artist - The new "Track title" featuring someone
        .gsub(/^(|.*\s)'(.*)'(\s.*|)$/, '\2') # 'Track title'
        .gsub(/^[\/\s,:;~\-–_\s"]+/, '') # trim starting white chars and dash
        .gsub(/[\/\s,:;~\-–_\s"]+$/, '') # trim trailing white chars and dash
      clean_quotes(track)
    end

  private

    def self.clean_file_extension(string)
      file_extensions = MIME::Types[/^(audio|video)/].map {|mime| mime.extensions }.flatten.uniq
      file_extensions_regex = %r{\.(#{file_extensions.join("|")})$}i
      string.gsub(file_extensions_regex, '')
    end

    # Remove various versions of "MV" and "PV" markers
    def self.clean_mvpv(string)
      string
        .gsub(/\s*\[\s*([PM]\/?V)\s*\]/, '') # [MV] or [M/V]
        .gsub(/\s*\(\s*([PM]\/?V)\s*\)/, '') # (MV) or (M/V)
        .gsub(/\s*【\s*([PM]\/?V)\s*】/, '') # 【MV】 or 【M/V】
        .gsub(/[\s\-–_]+([PM]\/?V)\s*/, '') # MV or M/V at the end
        .gsub(/([PM]\/?V)[\s\-–_]+/, '') # MV or M/V at the start
    end

    def self.clean_fluff(string)
      clean_mvpv(string)
        .gsub(/\s*\[[^\]]+\]$/, '') # [whatever] at the end
        .gsub(/^\s*\[[^\]]+\]\s*/, '') # [whatever] at the start
        .gsub(/\s*\([^\)]*\bver(\.|sion)?\s*\)$/i, '') # (whatever version)
        .gsub(/\s*[a-z]*\s*\bver(\.|sion)?$/i, '') # ver. and 1 word before (no parens)
        .gsub(/\s*(of+icial\s*)?(music\s*)?video/i, '') # (official)? (music)? video
        .gsub(/\s*(ALBUM TRACK\s*)?(album track\s*)/i, '') # (ALBUM TRACK)
        .gsub(/\s*\(\s*of+icial\s*\)/i, '') # (official)
        .gsub(/\s*\(\s*[0-9]{4}\s*\)/i, '') # (1999)
        .gsub(/\s+\(\s*(HD|HQ)\s*\)$/, '') # HD (HQ)
        .gsub(/[\s\-–_]+(HD|HQ)\s*$/, '') # HD (HQ)
        .gsub(/(\s*[-~_\/]\s*)?\b(with\s+)?lyrics\s*/i, '')
        .gsub(/\(\s*(with\s+)?lyrics\s*\)\s*/i, '')
    end

    def self.clean_quotes(string)
      regexes = QUOTES.map { |set| %r{^#{set[0]}(.*?)#{set[1]}\s*} }
      regexes.reduce(string) do |str, regex|
        str.gsub(regex, '\1 ')
      end.strip
    end
  end
end
