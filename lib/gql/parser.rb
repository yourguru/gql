#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'active_support/json'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/object/json'

require 'gql/tokenizer'

module GQL
  class Parser < Tokenizer

module_eval(<<'...end parser.racc/module_eval...', 'parser.racc', 136)

  class Query < Struct.new(:root, :variables)
    def as_json(*)
      {
        root:       root.as_json,
        variables:  variables
      }
    end
  end

  class Root < Struct.new(:call, :fields)
    def as_json(*)
      {
        call:       call.as_json,
        fields:     fields.as_json
      }
    end
  end

  class Node < Struct.new(:id, :alias_id, :call, :fields)
    def as_json(*)
      {
        id:         id,
        alias_id:   alias_id,
        call:       call.as_json,
        fields:     fields.as_json
      }
    end
  end

  class Call < Struct.new(:id, :arguments, :call, :fields)
    def as_json(*)
      {
        id:         id,
        arguments:  arguments,
        call:       call.as_json,
        fields:     fields.as_json
      }
    end
  end

  def initialize(str)
    super()
    scan_setup str
  end

  def parse
    do_parse
  end

  def on_error(token, value, vstack)
    raise Errors::SyntaxError.new(lineno, value, token_to_str(token))
  end

  private
    def convert_number(str)
      str.count('.') > 0 ? str.to_f : str.to_i
    end
...end parser.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
    35,    31,    32,    33,    34,    35,     6,    28,    35,    31,
    32,    33,    34,    51,    39,    28,    45,    29,    55,    35,
    31,    32,    33,    34,     7,    29,    28,    37,    72,     6,
    46,    38,    14,     6,    71,    12,    29,    35,    31,    32,
    33,    34,    12,    10,    28,    35,    31,    32,    33,    34,
    16,     6,    28,    12,    29,    59,    35,    31,    32,    33,
    34,    68,    29,    28,    43,    69,    39,    73,    42,    66,
    67,    38,     6,    29,    12,    22,    36,    12,    43,    39,
    12,    12,    12,    70,    43,    35 ]

racc_action_check = [
    29,    29,    29,    29,    29,    28,     0,    29,    14,    14,
    14,    14,    14,    28,    21,    14,    21,    29,    29,    22,
    22,    22,    22,    22,     1,    14,    22,    18,    56,     3,
    22,    18,     5,    22,    56,     6,    22,    67,    67,    67,
    67,    67,     2,     2,    67,    70,    70,    70,    70,    70,
     7,    67,    70,    39,    67,    39,    72,    72,    72,    72,
    72,    52,    70,    72,    20,    52,    20,    60,    20,    47,
    47,    60,     8,    72,    10,    11,    15,    38,    40,    41,
    42,    43,    45,    54,    63,    69 ]

racc_action_pointer = [
   -10,    24,    34,    13,   nil,    17,    27,    50,    56,   nil,
    66,    63,   nil,   nil,     6,    59,   nil,   nil,    17,   nil,
    57,     5,    17,   nil,   nil,   nil,   nil,   nil,     3,    -2,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    69,    45,
    71,    70,    72,    73,   nil,    74,   nil,    56,   nil,   nil,
   nil,   nil,    51,   nil,    65,   nil,    14,   nil,   nil,   nil,
    57,   nil,   nil,    77,   nil,   nil,   nil,    35,   nil,    83,
    43,   nil,    54,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -26,   -52,   -52,   -27,   -28,   -52,   -52,   -52,   -26,    -2,
   -52,    -7,   -51,   -29,   -52,   -52,    79,    -1,   -52,   -17,
   -24,    -6,   -52,   -30,   -32,   -33,   -34,   -35,   -52,   -52,
   -45,   -46,   -47,   -48,   -49,   -50,   -31,    -3,   -52,   -52,
   -22,   -21,   -52,   -52,    -4,   -52,    -8,   -52,   -11,   -12,
   -13,   -36,   -52,   -39,   -52,   -41,   -52,   -44,   -16,   -14,
   -52,   -18,   -19,   -23,   -25,    -5,    -9,   -52,   -37,   -52,
   -52,   -42,   -52,   -15,   -20,   -10,   -38,   -40,   -43 ]

racc_goto_table = [
    24,    48,    49,    53,    15,     9,    41,     1,    20,    54,
    18,    40,    44,     2,     8,    57,    21,    47,    58,    13,
    23,    17,    52,    56,   nil,   nil,    61,   nil,   nil,   nil,
   nil,   nil,    62,   nil,   nil,   nil,    20,    20,   nil,    60,
   nil,    64,   nil,   nil,    76,    63,    75,    49,    65,    74,
    54,   nil,   nil,   nil,   nil,   nil,    77,   nil,    78 ]

racc_goto_check = [
    12,    10,    11,    22,     6,     4,    14,     1,     6,    23,
     5,     8,     8,     2,     3,    12,     7,     9,    13,    16,
    17,     2,    21,    24,   nil,   nil,    14,   nil,   nil,   nil,
   nil,   nil,     8,   nil,   nil,   nil,     6,     6,   nil,     5,
   nil,     6,   nil,   nil,    22,     4,    10,    11,     4,    14,
    23,   nil,   nil,   nil,   nil,   nil,    12,   nil,    12 ]

racc_goto_pointer = [
   nil,     7,    13,    12,     3,     0,    -2,     5,    -9,    -5,
   -21,   -20,   -14,   -20,   -14,   nil,    16,     6,   nil,   nil,
   nil,    -6,   -25,   -19,    -6 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,    11,   nil,   nil,   nil,
   nil,     5,    50,    19,   nil,     3,     4,   nil,    25,    26,
    27,   nil,   nil,    30,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 22, :_reduce_1,
  1, 24, :_reduce_2,
  3, 24, :_reduce_3,
  3, 25, :_reduce_4,
  4, 25, :_reduce_5,
  2, 25, :_reduce_6,
  0, 28, :_reduce_7,
  2, 28, :_reduce_8,
  3, 28, :_reduce_9,
  3, 30, :_reduce_10,
  1, 30, :_reduce_11,
  1, 31, :_reduce_none,
  1, 31, :_reduce_none,
  2, 29, :_reduce_14,
  3, 29, :_reduce_15,
  3, 26, :_reduce_16,
  1, 26, :_reduce_17,
  3, 34, :_reduce_18,
  3, 34, :_reduce_19,
  4, 34, :_reduce_20,
  2, 34, :_reduce_21,
  2, 34, :_reduce_22,
  3, 34, :_reduce_23,
  1, 34, :_reduce_24,
  2, 35, :_reduce_25,
  0, 23, :_reduce_26,
  1, 23, :_reduce_none,
  1, 36, :_reduce_none,
  2, 36, :_reduce_29,
  3, 37, :_reduce_30,
  3, 32, :_reduce_31,
  1, 38, :_reduce_none,
  1, 33, :_reduce_none,
  1, 33, :_reduce_none,
  1, 33, :_reduce_none,
  2, 39, :_reduce_36,
  3, 39, :_reduce_37,
  3, 42, :_reduce_38,
  1, 42, :_reduce_none,
  3, 43, :_reduce_40,
  2, 40, :_reduce_41,
  3, 40, :_reduce_42,
  3, 45, :_reduce_43,
  1, 45, :_reduce_44,
  1, 41, :_reduce_none,
  1, 41, :_reduce_46,
  1, 41, :_reduce_47,
  1, 41, :_reduce_48,
  1, 41, :_reduce_49,
  1, 44, :_reduce_none,
  1, 27, :_reduce_51 ]

racc_reduce_n = 52

racc_shift_n = 79

racc_token_table = {
  false => 0,
  :error => 1,
  :STRING => 2,
  :NUMBER => 3,
  :TRUE => 4,
  :FALSE => 5,
  :NULL => 6,
  :AS => 7,
  :IDENT => 8,
  "{" => 9,
  "}" => 10,
  "." => 11,
  "(" => 12,
  ")" => 13,
  "," => 14,
  "=" => 15,
  "<" => 16,
  ">" => 17,
  ":" => 18,
  "[" => 19,
  "]" => 20 }

racc_nt_base = 21

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "STRING",
  "NUMBER",
  "TRUE",
  "FALSE",
  "NULL",
  "AS",
  "IDENT",
  "\"{\"",
  "\"}\"",
  "\".\"",
  "\"(\"",
  "\")\"",
  "\",\"",
  "\"=\"",
  "\"<\"",
  "\">\"",
  "\":\"",
  "\"[\"",
  "\"]\"",
  "$start",
  "query",
  "variables",
  "root",
  "call",
  "field_list",
  "identifier",
  "arguments",
  "fields",
  "argument_list",
  "argument",
  "variable_identifier",
  "json_value",
  "field",
  "alias_identifier",
  "variable_list",
  "variable",
  "variable_value",
  "object",
  "array",
  "scalar",
  "pairs",
  "pair",
  "string",
  "values" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.racc', 4)
  def _reduce_1(val, _values, result)
      result = Query.new(val[1], val[0].merge(val[2]))  
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 8)
  def _reduce_2(val, _values, result)
      result = Node.new('[root]', nil, val[0], nil   )  
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 9)
  def _reduce_3(val, _values, result)
      result = Node.new('[root]', nil, nil,    val[1])  
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 13)
  def _reduce_4(val, _values, result)
       result = Call.new(val[0], val[1], nil,    val[2].presence)   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 14)
  def _reduce_5(val, _values, result)
       result = Call.new(val[0], val[1], val[3], nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 15)
  def _reduce_6(val, _values, result)
       result = Call.new(val[0], val[1], nil,    nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 19)
  def _reduce_7(val, _values, result)
       result = []       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 20)
  def _reduce_8(val, _values, result)
       result = []       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 21)
  def _reduce_9(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 25)
  def _reduce_10(val, _values, result)
       result.push val[2]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 26)
  def _reduce_11(val, _values, result)
       result = val          
    result
  end
.,.,

# reduce 12 omitted

# reduce 13 omitted

module_eval(<<'.,.,', 'parser.racc', 35)
  def _reduce_14(val, _values, result)
       result = []       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 36)
  def _reduce_15(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 40)
  def _reduce_16(val, _values, result)
       result.push val[2]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 41)
  def _reduce_17(val, _values, result)
       result = val          
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 45)
  def _reduce_18(val, _values, result)
       result = Node.new(val[0], val[2], nil,    val[1].presence)   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 46)
  def _reduce_19(val, _values, result)
       result = Node.new(val[0], val[1], nil,    val[2].presence)   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 47)
  def _reduce_20(val, _values, result)
       result = Node.new(val[0], val[3], val[2], nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 48)
  def _reduce_21(val, _values, result)
       result = Node.new(val[0], val[1], nil,    nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 49)
  def _reduce_22(val, _values, result)
       result = Node.new(val[0], nil,    nil,    val[1].presence)   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 50)
  def _reduce_23(val, _values, result)
       result = Node.new(val[0], nil,    val[2], nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 51)
  def _reduce_24(val, _values, result)
       result = Node.new(val[0], nil,    nil,    nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 55)
  def _reduce_25(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 59)
  def _reduce_26(val, _values, result)
       result = {}   
    result
  end
.,.,

# reduce 27 omitted

# reduce 28 omitted

module_eval(<<'.,.,', 'parser.racc', 65)
  def _reduce_29(val, _values, result)
       result.update val[1]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 69)
  def _reduce_30(val, _values, result)
       result = { val[0] => val[2] }     
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 73)
  def _reduce_31(val, _values, result)
       result = val[1]   
    result
  end
.,.,

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

# reduce 35 omitted

module_eval(<<'.,.,', 'parser.racc', 87)
  def _reduce_36(val, _values, result)
       result = {}       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 88)
  def _reduce_37(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 92)
  def _reduce_38(val, _values, result)
       result.update val[2]    
    result
  end
.,.,

# reduce 39 omitted

module_eval(<<'.,.,', 'parser.racc', 97)
  def _reduce_40(val, _values, result)
       result = { val[0] => val[2] }    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 101)
  def _reduce_41(val, _values, result)
       result = []       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 102)
  def _reduce_42(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 106)
  def _reduce_43(val, _values, result)
       result.push val[2]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 107)
  def _reduce_44(val, _values, result)
       result = val          
    result
  end
.,.,

# reduce 45 omitted

module_eval(<<'.,.,', 'parser.racc', 112)
  def _reduce_46(val, _values, result)
       result = convert_number(val[0])   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 113)
  def _reduce_47(val, _values, result)
       result = true                     
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 114)
  def _reduce_48(val, _values, result)
       result = false                    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 115)
  def _reduce_49(val, _values, result)
       result = nil                      
    result
  end
.,.,

# reduce 50 omitted

module_eval(<<'.,.,', 'parser.racc', 122)
  def _reduce_51(val, _values, result)
       result = val[0].to_sym    
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end # GQL
