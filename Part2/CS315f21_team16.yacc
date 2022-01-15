%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
%}

%token GRD_START COMMENT STRING INT DOUBLE BOOLEAN CHAR SEMC LP RP LSB RSB LCB RCB DOT COMMA EQ NOT_EQ ASSIGN GTE LTE GT LT OR AND ADD SUB DIV MULT  RMD INCREMENT DECREMENT INT_TYPE STRING_TYPE BOOLEAN_TYPE CHAR_TYPE DOUBLE_TYPE VOID_TYPE IF ELSE ELSE_IF FOR WHILE FUNCTION INPUT OUT OUTLN RETURN READ_ALTITUDE READ_HEADING READ_TEMPERATURE TURN_HEADING_ONE_DEGREE CLIMB_VER MOVE_HOR_ONE_MS CONNECT_TO_COMPUTER DISCONNECT_TO_COMPUTER TURN_ON_OFF_SPRAY SET_ALTITUDE SET_HEADING GET_BATTERY_PERCENTAGE SET_HEIGHT WAIT_NEXT_INST IDENTIFIER

%%

program: GRD_START LCB stmt_list RCB {printf("Input program is valid\n"); return 0;};

stmt_list: stmt | stmt_list stmt;

stmt: expression | COMMENT;

expression: conditional | non_conditional;

conditional: IF LP logic_expression RP LCB stmt_list RCB | IF LP logic_expression RP LCB stmt_list RCB ELSE LCB stmt_list RCB | IF LP logic_expression RP LCB stmt_list RCB else_if;

else_if: ELSE_IF LP logic_expression RP LCB stmt_list RCB | ELSE_IF LP logic_expression RP LCB stmt_list RCB ELSE LCB stmt_list RCB | ELSE_IF LP logic_expression RP LCB stmt_list RCB else_if;

non_conditional: declaration_stmt SEMC | assignment_stmt SEMC | input_stmt SEMC | output_stmt SEMC | loop_stmt | func_declaration | func_call SEMC | return_stmt SEMC | primitive_funcs SEMC;

declaration_stmt: initialized_declaration | not_initialized_declaration;

initialized_declaration: int_declaration | double_declaration | char_declaration | string_declaration | boolean_declaration;

int_declaration: INT_TYPE IDENTIFIER ASSIGN func_call | INT_TYPE IDENTIFIER ASSIGN arithmetic_exprs;

double_declaration: DOUBLE_TYPE IDENTIFIER ASSIGN func_call | DOUBLE_TYPE IDENTIFIER ASSIGN arithmetic_exprs;

char_declaration: CHAR_TYPE IDENTIFIER ASSIGN func_call | CHAR_TYPE IDENTIFIER ASSIGN arithmetic_exprs;

string_declaration: STRING_TYPE IDENTIFIER ASSIGN func_call | STRING_TYPE IDENTIFIER ASSIGN arithmetic_exprs;

boolean_declaration: BOOLEAN_TYPE IDENTIFIER ASSIGN func_call | BOOLEAN_TYPE IDENTIFIER ASSIGN arithmetic_exprs;

not_initialized_declaration: INT_TYPE IDENTIFIER | DOUBLE_TYPE IDENTIFIER | CHAR_TYPE IDENTIFIER | STRING_TYPE IDENTIFIER | BOOLEAN_TYPE IDENTIFIER;

assignment_stmt: IDENTIFIER ASSIGN func_call | IDENTIFIER ASSIGN logic_expression | IDENTIFIER ASSIGN arithmetic_exprs | increment_expr | decrement_expr;

func_declaration: INT_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB | DOUBLE_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB | BOOLEAN_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB | STRING_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB | CHAR_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB | VOID_TYPE FUNCTION IDENTIFIER LP param_list RP LCB func_body RCB;

param_list: empty | param | param_list COMMA param;

param: INT_TYPE IDENTIFIER | STRING_TYPE IDENTIFIER | DOUBLE_TYPE IDENTIFIER | CHAR_TYPE IDENTIFIER | BOOLEAN_TYPE IDENTIFIER | const;

func_body: stmt_list return_stmt | stmt_list;

func_call: IDENTIFIER LP identifier_list RP | IDENTIFIER LP logic_expression_list RP;

logic_expression_list: logic_expression | logic_expression_list COMMA logic_expression;

identifier_list: empty | arithmetic_exprs | identifier_list COMMA arithmetic_exprs;

loop_stmt: while_stmt | for_stmt;

while_stmt: WHILE LP logic_expression RP LCB stmt_list RCB;

for_stmt: FOR LP initialized_declaration SEMC logic_expression SEMC arithmetic_exprs RP LCB stmt_list RCB | FOR LP initialized_declaration SEMC logic_expression SEMC increment_expr RP LCB stmt_list RCB | FOR LP initialized_declaration SEMC logic_expression SEMC decrement_expr RP LCB stmt_list RCB;

return_stmt: RETURN func_call | RETURN const | RETURN IDENTIFIER | RETURN;

input_stmt: INPUT LP RP;

output_stmt: OUT LP IDENTIFIER RP | OUT LP const RP | OUTLN LP IDENTIFIER RP | OUTLN LP const RP | OUT LP func_call RP | OUTLN LP func_call RP | OUT LP primitive_funcs RP | OUTLN LP primitive_funcs RP;

primitive_funcs: read_altitude | read_heading | read_temperature | turn_heading_one_degree | climb_ver | move_hor_one_ms | connect_to_computer | disconnect_to_computer | turn_on_off_spray | set_altitude | set_heading | get_battery_percentage | set_height | wait_next_inst;

read_altitude: READ_ALTITUDE LP RP;

read_heading: READ_HEADING LP RP;

read_temperature: READ_TEMPERATURE LP RP;

turn_heading_one_degree: TURN_HEADING_ONE_DEGREE LP logic_expression RP | TURN_HEADING_ONE_DEGREE LP IDENTIFIER RP;

climb_ver: CLIMB_VER LP logic_expression COMMA logic_expression RP | CLIMB_VER LP IDENTIFIER COMMA logic_expression RP | CLIMB_VER LP logic_expression COMMA IDENTIFIER RP | CLIMB_VER LP IDENTIFIER COMMA IDENTIFIER RP;

move_hor_one_ms: MOVE_HOR_ONE_MS LP logic_expression COMMA logic_expression RP | MOVE_HOR_ONE_MS LP IDENTIFIER COMMA logic_expression RP | MOVE_HOR_ONE_MS LP logic_expression COMMA IDENTIFIER RP | MOVE_HOR_ONE_MS LP IDENTIFIER COMMA IDENTIFIER RP;

connect_to_computer: CONNECT_TO_COMPUTER LP RP;

disconnect_to_computer: DISCONNECT_TO_COMPUTER LP RP;

turn_on_off_spray: TURN_ON_OFF_SPRAY LP logic_expression RP | TURN_ON_OFF_SPRAY LP IDENTIFIER RP;

set_altitude: SET_ALTITUDE LP arithmetic_exprs RP;

set_heading: SET_HEADING LP arithmetic_exprs RP;

wait_next_inst: WAIT_NEXT_INST LP arithmetic_exprs RP;

get_battery_percentage: GET_BATTERY_PERCENTAGE LP RP;

set_height: SET_HEIGHT LP RP;

logic_expression: and_out;

and_out: or_out | and_out AND or_out;

or_out: and_or_in | and_or_in OR or_out;

and_or_in: relational_expr;

relational_expr: gt_op | lt_op | gte_op | lte_op | eq_op | not_eq_op | BOOLEAN;

gt_op: arithmetic_exprs GT arithmetic_exprs;

lt_op: arithmetic_exprs LT arithmetic_exprs;

gte_op: arithmetic_exprs GTE arithmetic_exprs;

lte_op: arithmetic_exprs LTE arithmetic_exprs;

eq_op: arithmetic_exprs EQ arithmetic_exprs;

not_eq_op: arithmetic_exprs NOT_EQ arithmetic_exprs;

arithmetic_exprs: general_expr | LP general_expr RP;

general_expr: prior_expr | general_expr ADD prior_expr | general_expr SUB prior_expr;

prior_expr: term | prior_expr MULT term | prior_expr DIV term | prior_expr RMD term;

term: input_stmt | STRING | INT | DOUBLE | CHAR | IDENTIFIER | LP func_call RP| primitive_funcs;

increment_expr: IDENTIFIER INCREMENT | INCREMENT IDENTIFIER;

decrement_expr: IDENTIFIER DECREMENT | DECREMENT IDENTIFIER;

const: STRING | INT | DOUBLE | BOOLEAN | CHAR;

empty: ;
%%
#include "lex.yy.c"
main(){
	return yyparse();
}
int yyerror( char* s ){
	printf("Syntax error on line %d\n", yylineno);
}

