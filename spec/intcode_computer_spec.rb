require "aoc_2019/intcode_computer"

RSpec.describe Computer do
  describe "day 2 part 1" do
    it "handles example 1" do
      computer = Computer.new([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50])

      computer.run

      expect(computer.state).to eq([3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50])
    end

    it "handles example 2" do
      computer = Computer.new([1, 0, 0, 0, 99])

      computer.run

      expect(computer.state).to eq([2, 0, 0, 0, 99])
    end

    it "handles example 3" do
      computer = Computer.new([2, 3, 0, 3, 99])

      computer.run

      expect(computer.state).to eq([2, 3, 0, 6, 99])
    end

    it "handles example 4" do
      computer = Computer.new([2, 4, 4, 5, 99, 0])

      computer.run

      expect(computer.state).to eq([2, 4, 4, 5, 99, 9801])
    end

    it "handles example 5" do
      computer = Computer.new([1, 1, 1, 4, 99, 5, 6, 0, 99])

      computer.run

      expect(computer.state).to eq([30, 1, 1, 4, 2, 5, 6, 0, 99])
    end
  end
end

RSpec.describe Addition do
  it "adds numbers together" do
    state = [1, 3, 2, 3]
    add = described_class.new(*state[1..])
    keep_running = add.run(state)

    expect(state).to eq([1, 3, 2, 5])
    expect(keep_running).to eq(true)
  end
end

RSpec.describe Multiplication do
  it "multiplies numbers together" do
    state = [1, 3, 2, 3]
    multiply = described_class.new(*state[1..])
    keep_running = multiply.run(state)

    expect(state).to eq([1, 3, 2, 6])
    expect(keep_running).to eq(true)
  end
end

RSpec.describe Exit do
  it "exits" do
    state = [99]
    exit_opcode = described_class.new
    expect(exit_opcode.run(state)).to eq(false)
  end

end
