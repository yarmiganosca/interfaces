require 'interfaces/interface'

module Kernel
  def interface(interface_name, &interface_definition)
    Object.const_set(interface_name, Interface.new(&interface_definition))
  end
end
