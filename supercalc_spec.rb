require_relative './supercalc'
require 'rspec'

describe Calculator do
  let (:calc) {Calculator.new}

  describe "splitit" do
    it "takes input" do
      expect(calc.splitit("123")).to eq([[123],[]])
    end

    it "cuts whitespace" do
      expect(calc.splitit(" 1 2       3")).to eq([[123],[]])
    end

    it "converts numbers to ints" do
      expect(calc.splitit("2")).to eq([[2],[]])
    end

    it "splits a simple number from a non-number" do
      expect(calc.splitit("2+")).to eq([[2], [:+]])
    end

    it "splits numbers after a non-number" do
      expect(calc.splitit("2+2")).to eq([[2, 2], [:+]])
    end

    it "splits a string of multiple numbers and operators" do
      expect(calc.splitit("2+2+2")).to eq([[2, 2, 2], [:+, :+]])
    end

    it "takes floats" do
      expect(calc.splitit("2.0+2")).to eq([[2.0, 2], [:+]])
    end

    it "returns floats" do
      expect(calc.splitit("2.5+2")).to eq([[2.5, 2], [:+]])
    end

    it "evaluates '2 divided by 2'" do
      expect(calc.splitit("2 divided by 2")).to eq([[2, 2], [:/]])
    end
  end

  describe "cleanops" do

    it "evaluates 'plus'" do
      expect(calc.cleanops(["plus"])).to eq([:+])
    end

    it "evaluates 'minus'" do
      expect(calc.cleanops(["minus"])).to eq([:-])
    end

    it "evaluates 'times'" do
      expect(calc.cleanops(["times"])).to eq([:*])
    end

    it "evaluates 'dividedby'" do
      expect(calc.cleanops(["dividedby"])).to eq([:/])
    end

    it "evaluates 'tothepowerof'" do
      expect(calc.cleanops(["tothepowerof"])).to eq([:**])
    end

    it "evaluates 'squareroot'" do
      pending 'not sure how to create symbol out of Math.sqrt'
      expect(calc.cleanops(["squareroot"])).to eq([])
    end
  end
end