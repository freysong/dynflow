require_relative 'div_tag'

module Jekyll
  class AlertBlock < DivTag
    def initialize(tag_name, markup, tokens)
      @alert_type = tag_name.split('_').first
      super tag_name, markup + ' alert alert-' + @alert_type, tokens
    end

    def tag
      'div'
    end

    HEADER = { 'info' => 'Note',
               'warning' => 'Warning'
    }

    def render_content(context, content)
      super context, content.gsub(/(\A\n+)/, format('\1**%s:** ', HEADER[@alert_type]))
    end
  end
end

Liquid::Template.register_tag('info_block', Jekyll::AlertBlock)
Liquid::Template.register_tag('warning_block', Jekyll::AlertBlock)
# Liquid::Template.register_tag('success_block', Jekyll::AlertBlock)
# Liquid::Template.register_tag('danger_block', Jekyll::AlertBlock)
