class Computer
  attr_accessor :current_location, :state

  def initialize(raw_integers)
    @state = raw_integers
    @current_location = 0
  end

  def run
    keep_running = true
    while keep_running do
      current_instruction = parse_instruction
      keep_running = current_instruction.run(state)
      @current_location += current_instruction.class.size if keep_running
    end
  end

  private

  def parse_instruction
    registered_instructions = {
      Addition.opcode => Addition,
      Multiplication.opcode => Multiplication,
      Exit.opcode => Exit
    }
    instruction_class = registered_instructions[state[current_location]]
    data_start_location = current_location + 1
    data_end_location = current_location + instruction_class.size
    instruction_data = state[data_start_location...data_end_location]
    instruction_class.new(*instruction_data)
  end

end

class Addition
  def self.opcode
    1
  end

  def self.size
    4
  end

  def initialize(input_location1, input_location2, output_location)
    @input_location1 = input_location1
    @input_location2 = input_location2
    @output_location = output_location
  end

  def run(state)
    state[@output_location] = state[@input_location1] + state[@input_location2]
    true
  end
end

class Multiplication
  def self.opcode
    2
  end

  def self.size
    4
  end

  def initialize(input_location1, input_location2, output_location)
    @input_location1 = input_location1
    @input_location2 = input_location2
    @output_location = output_location
  end

  def run(state)
    state[@output_location] = state[@input_location1] * state[@input_location2]
    true
  end
end

class Exit
  def self.opcode
    99
  end

  def self.size
    1
  end

  def initialize
    # noop
  end

  def run(_state)
    false
  end
end
