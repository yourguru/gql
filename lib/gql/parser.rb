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
  class Parser < Racc::Parser

module_eval(<<'...end parser.racc/module_eval...', 'parser.racc', 135)

  class Query < Struct.new(:root, :variables)
    def as_json(*)
      {
        root:       root.as_json,
        variables:  variables
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
    31,    32,    33,    34,     7,    29,    28,    37,    71,     6,
    46,    38,    14,     6,    70,    12,    29,    35,    31,    32,
    33,    34,    12,    10,    28,    35,    31,    32,    33,    34,
    16,     6,    28,    12,    29,    59,    35,    31,    32,    33,
    34,    67,    29,    28,    43,    68,    39,    72,    41,    65,
    66,    38,     6,    29,    12,    22,    36,    12,    43,    12,
    12,    12,    69,    43,    35 ]

racc_action_check = [
    29,    29,    29,    29,    29,    28,     0,    29,    14,    14,
    14,    14,    14,    28,    21,    14,    21,    29,    29,    22,
    22,    22,    22,    22,     1,    14,    22,    18,    56,     3,
    22,    18,     5,    22,    56,     6,    22,    66,    66,    66,
    66,    66,     2,     2,    66,    69,    69,    69,    69,    69,
     7,    66,    69,    39,    66,    39,    71,    71,    71,    71,
    71,    52,    69,    71,    20,    52,    20,    60,    20,    47,
    47,    60,     8,    71,    10,    11,    15,    38,    40,    41,
    43,    45,    54,    62,    68 ]

racc_action_pointer = [
   -10,    24,    34,    13,   nil,    17,    27,    50,    56,   nil,
    66,    63,   nil,   nil,     6,    59,   nil,   nil,    17,   nil,
    57,     5,    17,   nil,   nil,   nil,   nil,   nil,     3,    -2,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    69,    45,
    71,    71,   nil,    72,   nil,    73,   nil,    56,   nil,   nil,
   nil,   nil,    51,   nil,    64,   nil,    14,   nil,   nil,   nil,
    57,   nil,    76,   nil,   nil,   nil,    35,   nil,    82,    43,
   nil,    54,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -25,   -51,   -51,   -26,   -27,   -51,   -51,   -51,   -25,    -2,
   -51,    -7,   -50,   -28,   -51,   -51,    78,    -1,   -51,   -17,
   -23,    -6,   -51,   -29,   -31,   -32,   -33,   -34,   -51,   -51,
   -44,   -45,   -46,   -47,   -48,   -49,   -30,    -3,   -51,   -51,
   -21,   -51,   -20,   -51,    -4,   -51,    -8,   -51,   -11,   -12,
   -13,   -35,   -51,   -38,   -51,   -40,   -51,   -43,   -16,   -14,
   -51,   -18,   -22,   -24,    -5,    -9,   -51,   -36,   -51,   -51,
   -41,   -51,   -15,   -19,   -10,   -37,   -39,   -42 ]

racc_goto_table = [
    24,    48,    49,    15,     9,    18,    42,    20,     2,    53,
    54,    40,    44,     1,     8,    57,    17,    21,    47,    58,
    13,    23,    52,    56,   nil,   nil,    61,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    60,    20,    20,   nil,   nil,   nil,
    63,   nil,   nil,    62,   nil,    74,    49,    64,    73,    75,
    54,   nil,   nil,   nil,   nil,    76,   nil,    77 ]

racc_goto_check = [
    12,    10,    11,     6,     4,     5,    14,     6,     2,    22,
    23,     8,     8,     1,     3,    12,     2,     7,     9,    13,
    16,    17,    21,    24,   nil,   nil,    14,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     5,     6,     6,   nil,   nil,   nil,
     6,   nil,   nil,     4,   nil,    10,    11,     4,    14,    22,
    23,   nil,   nil,   nil,   nil,    12,   nil,    12 ]

racc_goto_pointer = [
   nil,    13,     8,    12,     2,    -5,    -3,     6,    -9,    -4,
   -21,   -20,   -14,   -19,   -14,   nil,    17,     7,   nil,   nil,
   nil,    -6,   -19,   -18,    -6 ]

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
  4, 34, :_reduce_19,
  2, 34, :_reduce_20,
  2, 34, :_reduce_21,
  3, 34, :_reduce_22,
  1, 34, :_reduce_23,
  2, 35, :_reduce_24,
  0, 23, :_reduce_25,
  1, 23, :_reduce_none,
  1, 36, :_reduce_none,
  2, 36, :_reduce_28,
  3, 37, :_reduce_29,
  3, 32, :_reduce_30,
  1, 38, :_reduce_none,
  1, 33, :_reduce_none,
  1, 33, :_reduce_none,
  1, 33, :_reduce_none,
  2, 39, :_reduce_35,
  3, 39, :_reduce_36,
  3, 42, :_reduce_37,
  1, 42, :_reduce_none,
  3, 43, :_reduce_39,
  2, 40, :_reduce_40,
  3, 40, :_reduce_41,
  3, 45, :_reduce_42,
  1, 45, :_reduce_43,
  1, 41, :_reduce_none,
  1, 41, :_reduce_45,
  1, 41, :_reduce_46,
  1, 41, :_reduce_47,
  1, 41, :_reduce_48,
  1, 44, :_reduce_none,
  1, 27, :_reduce_50 ]

racc_reduce_n = 51

racc_shift_n = 78

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
      result = Node.new(nil, nil, val[0], nil   )  
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 9)
  def _reduce_3(val, _values, result)
      result = Node.new(nil, nil, nil,    val[1])  
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
       result = Node.new(val[0], val[3], val[2], nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 47)
  def _reduce_20(val, _values, result)
       result = Node.new(val[0], val[1], nil,    nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 48)
  def _reduce_21(val, _values, result)
       result = Node.new(val[0], nil,    nil,    val[1].presence)   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 49)
  def _reduce_22(val, _values, result)
       result = Node.new(val[0], nil,    val[2], nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 50)
  def _reduce_23(val, _values, result)
       result = Node.new(val[0], nil,    nil,    nil            )   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 54)
  def _reduce_24(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 58)
  def _reduce_25(val, _values, result)
       result = {}   
    result
  end
.,.,

# reduce 26 omitted

# reduce 27 omitted

module_eval(<<'.,.,', 'parser.racc', 64)
  def _reduce_28(val, _values, result)
       result.update val[1]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 68)
  def _reduce_29(val, _values, result)
       result = { val[0] => val[2] }     
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 72)
  def _reduce_30(val, _values, result)
       result = val[1]   
    result
  end
.,.,

# reduce 31 omitted

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

module_eval(<<'.,.,', 'parser.racc', 86)
  def _reduce_35(val, _values, result)
       result = {}       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 87)
  def _reduce_36(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 91)
  def _reduce_37(val, _values, result)
       result.update val[2]    
    result
  end
.,.,

# reduce 38 omitted

module_eval(<<'.,.,', 'parser.racc', 96)
  def _reduce_39(val, _values, result)
       result = { val[0] => val[2] }    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 100)
  def _reduce_40(val, _values, result)
       result = []       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 101)
  def _reduce_41(val, _values, result)
       result = val[1]   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 105)
  def _reduce_42(val, _values, result)
       result.push val[2]    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 106)
  def _reduce_43(val, _values, result)
       result = val          
    result
  end
.,.,

# reduce 44 omitted

module_eval(<<'.,.,', 'parser.racc', 111)
  def _reduce_45(val, _values, result)
       result = convert_number(val[0])   
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 112)
  def _reduce_46(val, _values, result)
       result = true                     
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 113)
  def _reduce_47(val, _values, result)
       result = false                    
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 114)
  def _reduce_48(val, _values, result)
       result = nil                      
    result
  end
.,.,

# reduce 49 omitted

module_eval(<<'.,.,', 'parser.racc', 121)
  def _reduce_50(val, _values, result)
       result = val[0].to_sym    
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end # GQL
