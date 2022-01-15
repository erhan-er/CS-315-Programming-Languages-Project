sign                [+-]
digit               [0-9]
alphabetic          [a-zA-Z_]
alphanumeric        {alphabetic}|{digit}
identifier          [A-Za-z]+({alphanumeric})*
string              \"([^\\\"]|\\\"|\\\\|\\\n)*\"
int                 {sign}?{digit}+
double              {sign}?{digit}*(\.)?{digit}+
boolean             true|false
char				\'[^\'|\n]?\'
semc                \;
lp                  \(
rp                  \)
lsb                 \[
rsb                 \]
lcb					\{
rcb					\}
dot                 \.
comma               \,
eq                  \=\=
not_eq              \!\=
assign              \=
gte                 \>\=
lte                 \<\=
gt                  \>
lt                  \<
or                  \|\|
and                 \&\&
add                 \+
sub                 \-
div                 \/
mult                \*
rmd                 \%
inc					\+\+
dec					\-\-
comment             \/\*\*.*\*\*\/
read_altitude		getAltitude
read_heading		getHeading
read_temperature	getTemperature
turn_heading		turnLeftRight
climb_ver			climbUpStopDown
move_hor_one_ms		moveForwardStopBackward
connect_to_comp		connect
disconnect_to_comp	disconnect
turn_on_off_spray	changeSpray
set_altitude		setAltitude
set_heading			setHeading
get_battery_perc	getBatteryPerc
set_height			setHeight
wait_next_inst		waitNextInst

%%
GRD-START												return GRD_START;
{comment}												return COMMENT;
{string}                                                return STRING;
{int}                                                   return INT;
{double}                                                return DOUBLE;
{boolean}                                               return BOOLEAN;
{char}													return CHAR;
{semc}                                                  return SEMC;
{lp}                                                    return LP;
{rp}                                                    return RP;
{lsb}                                               	return LSB;
{rsb}                                               	return RSB;
{lcb}                                               	return LCB;
{rcb}                                               	return RCB;
{dot}                                                   return DOT;
{comma}                                                 return COMMA;
{eq}                                              	    return EQ;
{not_eq}                                          	    return NOT_EQ;
{assign}                                             	return ASSIGN;
{gte}                                                	return GTE;
{lte}                                                	return LTE;
{gt}                                                 	return GT;
{lt}                                                 	return LT;
{or}                                                 	return OR;
{and}                                                	return AND;
{add}                                                	return ADD;
{sub}                                                	return SUB;
{div}                                                	return DIV;
{mult}                                                	return MULT;
{rmd}                                                	return RMD;
{inc}													return INCREMENT;
{dec}													return DECREMENT;
int														return INT_TYPE;
string													return STRING_TYPE;	
boolean													return BOOLEAN_TYPE;
char													return CHAR_TYPE;	
double													return DOUBLE_TYPE;
void													return VOID_TYPE;										
if                                                    	return IF;
else                                                  	return ELSE;
else_if													return ELSE_IF;
for                                                   	return FOR;
while                                                	return WHILE;
function                                          	    return FUNCTION;
input												    return INPUT;
out														return OUT;
outln													return OUTLN;		
return													return RETURN;
{read_altitude}											return READ_ALTITUDE;
{read_heading}											return READ_HEADING;
{read_temperature}										return READ_TEMPERATURE;
{turn_heading}											return TURN_HEADING_ONE_DEGREE;
{climb_ver}												return CLIMB_VER;
{move_hor_one_ms}										return MOVE_HOR_ONE_MS;
{connect_to_comp}										return CONNECT_TO_COMPUTER;
{disconnect_to_comp}									return DISCONNECT_TO_COMPUTER;
{turn_on_off_spray}										return TURN_ON_OFF_SPRAY;
{set_altitude}											return SET_ALTITUDE;
{set_heading}											return SET_HEADING;
{get_battery_perc}										return GET_BATTERY_PERCENTAGE;
{set_height}											return SET_HEIGHT;
{wait_next_inst}										return WAIT_NEXT_INST;
{identifier}                                            return IDENTIFIER;	
\n 														{ yylineno++; }
%%
int yywrap(void) {
	return 1;
}