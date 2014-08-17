require_relative './spec_helper'
require_relative '../examples/enoomerable'

describe Enoomerable do
  class Collection
    def initialize(*items)
      @items = items
    end

    attr_reader :items

    def each
      for item in items
        yield item
      end
    end

    implement Enoomerable
  end

  describe '#map' do
    let(:collection) { Collection.new(1, 2, 3) }

    it 'works as intended' do
      collection.map { |n| n + 2 }.must_equal [3, 4, 5]
    end
  end
end
