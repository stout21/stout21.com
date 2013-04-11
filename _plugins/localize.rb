module Localize
  def localize(input, locale = 'en')
    @context.registers[:site].config['locales'][locale][input]
  end

  Liquid::Template.register_filter self
end

