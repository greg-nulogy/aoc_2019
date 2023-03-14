class Computer
  attr_accessor :instruction_pointer, :memory

  def initialize(raw_integers)
    @memory = raw_integers
    @instruction_pointer = 0
  end

  def run
    keep_running = true
    while keep_running do
      current_instruction = parse_instruction
      keep_running = current_instruction.run(memory)
      @instruction_pointer += current_instruction.class.size if keep_running
    end
  end

  private

  def parse_instruction
    registered_instructions = {
      Addition.opcode => Addition,
      Multiplication.opcode => Multiplication,
      Exit.opcode => Exit
    }
    instruction_class = registered_instructions[memory[instruction_pointer]]
    data_start_location = instruction_pointer + 1
    data_end_location = instruction_pointer + instruction_class.size
    instruction_parameters = memory[data_start_location...data_end_location]
    instruction_class.new(*instruction_parameters)
  end

end

class Addition
  def self.opcode
    1
  end

  def self.size
    4
  end

  def initialize(input_address1, input_address2, output_address)
    @input_address1 = input_address1
    @input_address2 = input_address2
    @output_address = output_address
  end

  def run(state)
    state[@output_address] = state[@input_address1] + state[@input_address2]
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

  def initialize(input_address1, input_address2, output_address)
    @input_address1 = input_address1
    @input_address2 = input_address2
    @output_address = output_address
  end

  def run(state)
    state[@output_address] = state[@input_address1] * state[@input_address2]
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
