class Team
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

  def text(names)
    if names.count == 2
      "#{names.first} and #{names.last}"
    elsif names.count == 1
      "#{names.first} is alone. Sorry, buddy."
    end
  end
end
