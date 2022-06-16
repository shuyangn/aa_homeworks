require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "SpongeBob") }
  let(:muffin) { Dessert.new("muffin", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(muffin.type).to eq("muffin")
    end

    it "sets a quantity" do
      expect(muffin.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(muffin.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("biscuit", "tons", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      muffin.add_ingredient("egg")
      expect(muffin.ingredients).to include("egg")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        muffin.add_ingredient(ingredient)
      end

      expect(muffin.ingredients).to eq(ingredients)
      muffin.mix!
      expect(muffin.ingredients).not_to eq(ingredients)
      expect(muffin.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      muffin.eat(1)
      expect(muffin.quantity).to eq(99)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { muffin.eat(101)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef SpongeBob the Great Baker")
      expect(muffin.serve).to eq("Chef SpongeBob the Great Baker has made 100 muffins!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(muffin)
      muffin.make_more
    end
  end
end
