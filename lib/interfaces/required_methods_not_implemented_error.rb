class RequiredMethodsNotImplementedError < StandardError
  def initialize(method_names)
    @method_names = method_names
  end
  attr_reader :method_names

  def to_s
    "The including class doesn't implement the required methods: #{method_names.join(', ')}"
  end
end
