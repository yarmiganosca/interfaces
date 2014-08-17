class Class
  def implement(interface)
    if implements_methods_required_by?(interface)
      include interface
    end
  end

  def implements_methods_required_by?(interface)
    interface.required_methods.all? do |method_name|
      method_defined? method_name
    end
  end
end
