class Team
  def initialize(names)
    @names = names.split(" ").shuffle!
  end

  def markup
    markup = ""
    until @names.empty?
      markup += pair(@names.pop(2))
    end
    markup.html_safe
  end

  private

  def pair(two_names)
    "<p>#{two_names.first} and #{two_names.last}</p>"
  end
end
