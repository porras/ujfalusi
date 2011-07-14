class Lexer
  
  def tokenize(code)
    code.split('').map do |i|
      case i
        when '-': [:WALK, 1]
        when '<': [:TURN, 'left']
        when '>': [:TURN, 'right']
      else
        raise "Bad character: #{i}"
      end
    end
  end
  
end