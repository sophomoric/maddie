require "rails_helper"

describe MarkdownHelper do
  describe ".render_html" do
    it "produces html" do
      markdown = MarkdownHelper.new("<p>I am so angry!</p>")
      expect(markdown.render).to eq("<p>I am so angry!</p>\n")
    end
  end
end
