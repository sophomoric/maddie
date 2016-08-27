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
    generate_team_markup(adjectives, nouns).html_safe
  end

  private

  def generate_team_markup(adjectives, nouns)
    @names.each_slice(2).map do |partners|
      team_name = create_team_name(adjectives.pop, nouns.pop)
      pair(partners, team_name)
    end.join
  end

  def create_team_name(adjective, noun)
    "<b>#{adjective} #{noun}</b>"
  end

  def pair(names, team_name)
    "<p>#{text(names)}: Team #{team_name}</p> "
  end

  def text(names)
    if names.count == 2
      "#{names.first} and #{names.last}"
    elsif names.count == 1
      "#{names.first} is alone. Sorry, buddy"
    end
  end
end
