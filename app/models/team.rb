class Team
  ADJECTIVES = %w(
    B-to-the-S-to-the- Exploding Shooting Super Deadly Fighting Lightening-quick
    Fiery Hideous
  )
  NOUNS = %w(
    Monsters Phoenixes Dragons Longshots Blades Spirits Warriors Breadman Mages 
    Programmers Paige-Pipers
  )

  def initialize(names)
    @names = names.split(" ").shuffle!
  end

  def markup
    @names.each_slice(2).map do |partners|
      pair(partners)
    end.join.html_safe
  end

  private

  def pair(names)
    "<p>" + text(names) + "</p>"
  end

  def team_name
    "<bold>" + ADJECTIVES.sample + " " + NOUNS.sample + "</bold>"
  end

  def text(names)
    if names.count == 2
      "#{names.first} and #{names.last} are Team #{team_name}"
    elsif names.count == 1
      "#{names.first} is alone. Sorry, buddy."
    end
  end
end
