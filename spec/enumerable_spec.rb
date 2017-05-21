require "enumerable"

describe Enumerable do

let(:arr) {	[1,2,3] }

let(:letter_arr) {	["A","B","A","D"] }

#let(:hash) { {"1"=>1, "2"=>2, "3"=>3} }

#let(:other_hash) { {"1"=>1, "A"=>"A", "3"=>3, "B"=>"B"} }

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

	describe "#my_count" do

		it "returns 0 for empty arrays" do
		  expect([].count).to eql(0)
		end

		it "returns 5 for an array with 5 values" do
		  expect([1,2,3,4,5].count).to eql(5)
		end

		it "raises error if its called on nil" do
		  expect(nil.count).to raise_error(NoMethodError)
		end 
	end	

	describe "#my_all?" do

		it "returns true if all values fill the block conditions" do
		  expect(arr.my_all? {|x,y| x[y]==x[y].to_i }).to eql(true)
		end

		it "returns false if at least one value does not fill the block conditions" do
		  expect(letter_arr.my_all? {|x,y| x[y]==x[y].to_i }).to eql(false)
		end

	end	

	describe "#my_inject" do

		it "returns the sum for an array" do
		  expect(arr.my_inject { |x,y| x+=y }).to eql(6)
		end

		it "returns the product for an array" do
		  expect([5,100].my_inject { |x,y| x*=y }).to eql(500)
		end

		it "returns nil for an empty array" do
		  expect([].my_inject { |x,y| x*=y }).to eql(nil)
		end

		it "raise SyntaxError if array has letters" do
		  expect(letter_arr.my_inject { |x,y| x+=y }).to raise_error("This should not have letters")
		end

	end


end

