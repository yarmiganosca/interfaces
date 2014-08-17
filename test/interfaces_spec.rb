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

  describe "when the required methods aren't implemented by the including class" do
    let(:attempt) do
      proc do
        class B
          implement Thingable
        end
      end
    end

    it 'raises an error' do
      error = attempt.must_raise RequiredMethodsNotImplementedError

      error.message.must_match 'thingy'
    end
  end
end
