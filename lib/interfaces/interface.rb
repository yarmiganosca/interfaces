class Interface < Module
  def requires(*method_names)
    @required_methods = method_names
  end

  attr_reader :required_methods
end
