require 'interfaces/interface'

interface :Enoomerable do
  requires :each

  def map
    values = []

    each do |value|
      values << yield(value)
    end

    values
  end
end
