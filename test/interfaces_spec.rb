require_relative './spec_helper'

describe Interfaces do
  interface :Thingable do
    requires :thingy

    def whatsit
      thingy + 4
    end
  end

  it 'creates a constant with the interface name' do
    Object.const_defined?(:Thingable, true).must_equal true
  end

  class A
    def thingy
      2
    end

    implement Thingable
  end

  it "extends the implementing class with the interface's methods" do
    A.new.must_respond_to :whatsit
  end

  it 'the methods return the correct results' do
    A.new.whatsit.must_equal 6
  end

  class B
    implement Thingable
  end

  it "doesn't extend the implementing class if the required methods aren't defined" do
    B.new.wont_respond_to :whatsit
  end
end
