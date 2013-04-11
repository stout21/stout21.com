module CamelCase
  def camelcase(input)
    return input if input !~ /_|\s+/ && input =~ /[A-Z]+.*/
    input.split(/_|\s+/).map{|e| e.capitalize}.join
  end

  Liquid::Template.register_filter self
end


