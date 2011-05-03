require 'spec_helper'
require 'catch'

describe Catch do
  describe "instantiation from configure" do
    context "..." do
      it "instantiates the class" do
        catch = Catch.configure do |config|
        end
      end
    end
  end
end
