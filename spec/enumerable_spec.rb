require "enumerable"

describe Enumerable do

let(:arr) {	[1,2,3] }

let(:letter_arr) {	["A","B","A","D"] }

	describe "#my_each" do

		it "returns nil if arr is blank" do
		  expect([].my_each {|p, i| x+=p[i]}).to eql(nil)
		end

		it "sums contents in array" do
		  x=0
	      arr.my_each {|p, i| x+=p[i]}
	      expect(x).to eql(6)
		end

		it "raises error if there's no block" do
		  expect(arr.my_each).to eql("This needs a block")
		end
	end

	describe "#my_each_with_index" do

		it "returns nil if arr is blank" do
		  expect([].my_each_with_index {|p, i| x+=p[i]}).to eql(nil)
		end

		it "sums contents in array" do
		  x=0
	      arr.my_each_with_index {|p, i| x+=p[i]}
	      expect(x).to eql(6)
		end

		it "raises error if there's no block" do
		  expect(arr.my_each_with_index).to eql("This needs a block")
		end
	end

	describe "#my_select" do

		it "returns arr of numbers greater than 0" do
		  expect(arr.my_select {|x,y| x[y]>0}).to eql([1,2,3])
		end

		it "returns arr of letters not equal to \'A\'" do
		  expect(letter_arr.my_select {|x,y| x[y]!="A"}).to eql(["B","D"])
		end

		it "returns empty arr if arr is empty" do
		  expect([].my_select {|x,y| x[y]!="A"}).to eql([])
		end

	end

	describe "#my_all?" do

		it "returns arr of numbers greater than 0" do
		  expect(arr.my_all? {|x,y| x[y]>0}).to eql([1,2,3])
		end

	end	


end

