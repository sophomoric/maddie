class Team
  ADJECTIVES = %w(
    B-to-the-S-to-the- Exploding Shooting Super Deadly Fighting Lightening-quick
    Fiery Hideous Mysterious Dangerous
  )
  NOUNS = %w(
    Monsters Phoenixes Dragons Longshots Blades Spirits Warriors Breadman Mages 
    Programmers Paige-Pipers Godesses
  )

  def initialize(names)
    @names = names.split(" ").shuffle!
  end

  def markup
    adjectives = ADJECTIVES.shuffle
    nouns = NOUNS.shuffle
    @names.each_slice(2).map do |partners|
    team_name = "<b>#{adjectives.pop} #{nouns.pop}</b>"
      pair(partners, team_name)
    end.join.html_safe
  end

  private

  def pair(names, team_name)
    "<p>#{text(names)} are Team #{team_name}</p> "
  end

  def text(names)
    if names.count == 2
      "#{names.first} and #{names.last}"
    elsif names.count == 1
      "#{names.first} is alone. Sorry, buddy."
    end
  end
end
