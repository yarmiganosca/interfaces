require 'interfaces/required_methods_not_implemented_error'

class Interface < Module
  def requires(*method_names)
    @required_methods = method_names
  end

  attr_reader :required_methods

  def included(base)
    unless required_methods_implemented_by_class?(base)
      raise RequiredMethodsNotImplementedError.new(required_methods)
    end
  end

  def required_methods_implemented_by_class?(cls)
    required_methods.all? do |required_method_name|
      cls.method_defined?(required_method_name)
    end
  end
end
