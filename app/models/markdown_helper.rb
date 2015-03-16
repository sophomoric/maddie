require "redcarpet"

class MarkdownHelper
  REDCARPET_OPTIONS = {
    hard_wrap: true,
    autolink: true,

    #  use underscores without seeing_italics_.
    no_intra_emphasis: true,

    fenced_code_blocks: true,
    disable_indented_code_blocks: true,
    gh_blockcode: true
  }

  def initialize(text)
    @text = text
  end

  def render
    options = REDCARPET_OPTIONS
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(@text).html_safe
  end
end
