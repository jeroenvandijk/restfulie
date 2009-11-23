require 'net/http'
require 'uri'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Restfulie::Transition do
  
  class Order
    attr_accessor :status
  end
  
  context "when executing a transition" do
    it "should change its status if there is a resulting status to move to, always setting a string" do
      
      [:paid, "paid"].each do |result|
        order = Order.new
        order.status = "unpaid"
      
        pay = Restfulie::Transition.new(:pay, {}, result, nil)
        pay.execute_at order
        order.status.should == "paid"
      end

    end
    it "should bit change its status if there is a resulting status to move to" do
      
      order = Order.new
      order.status = "unpaid"
    
      pay = Restfulie::Transition.new(:pay, {}, nil, nil)
      pay.execute_at order
      order.status.should == "unpaid"

    end
  end
  
end