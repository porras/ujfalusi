class Parser

token WALK
token TURN

rule
  Root:
    /* nothing */ { result = Nodes.new([]) }
  | Moves         { result = val[0] }
  ;
  
  Moves:
    Move        { result = Nodes.new(val)}
  | Moves Move  { result = val[0] << val[1] }
  ;
  
  Move:
    WALK { result = WalkNode.new }
  | TURN { result = TurnNode.new(val[0]) }
  ;
end

---- header

  require 'lexer'
  require 'nodes'

---- inner

  def parse(code, show_tokens = false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end
  
  def next_token
    @tokens.shift
  end