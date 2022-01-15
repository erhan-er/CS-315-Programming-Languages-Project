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
move_hor_one_ms		moveForWardStopBackward
connect_to_comp		connect
disconnect_to_comp	disconnect
turn_on_off_spray	changeSpray
set_altitude		setAltitude
set_heading			setHeading
get_battery_perc	getBatteryPerc
set_height			setHeight

%%
GRD-START												printf("GRD_START ");
{comment}												printf("COMMENT ");
{string}                                                printf("STRING ");
{int}                                                   printf("INT ");
{double}                                                printf("DOUBLE ");
{boolean}                                               printf("BOOLEAN ");
{char}													printf("CHAR ");
{semc}                                                  printf("SEMC ");
{lp}                                                    printf("LP ");
{rp}                                                    printf("RP ");
{lsb}                                               	printf("LSB ");
{rsb}                                               	printf("RSB ");
{lcb}                                               	printf("LCB ");
{rcb}                                               	printf("RCB ");
{dot}                                                   printf("DOT ");
{comma}                                                 printf("COMMA ");
{eq}                                              	    printf("EQ ");
{not_eq}                                          	    printf("NOT_EQ ");
{assign}                                             	printf("ASSIGN ");
{gte}                                                	printf("GTE ");
{lte}                                                	printf("LTE ");
{gt}                                                 	printf("GT ");
{lt}                                                 	printf("LT ");
{or}                                                 	printf("OR ");
{and}                                                	printf("AND ");
{add}                                                	printf("ADD ");
{sub}                                                	printf("SUB ");
{div}                                                	printf("DIV ");
{mult}                                                	printf("MULT ");
{rmd}                                                	printf("RMD ");
{inc}													printf("INCREMENT ");
{dec}													printf("DECREMENT ");
int														printf("INT_TYPE ");
string													printf("STRING_TYPE ");	
boolean													printf("BOOLEAN_TYPE ");
char													printf("CHAR_TYPE ");	
double													printf("DOUBLE_TYPE ");												
if                                                    	printf("IF ");
else                                                  	printf("ELSE ");
for                                                   	printf("FOR ");
while                                                	printf("WHILE ");
function                                          	    printf("FUNCTION ");
input												    printf("INPUT ");
out														printf("OUT ");
outln													printf("OUTLN ");		
return													printf("RETURN ");
{read_altitude}											printf("READ_ALTITUDE ");
{read_heading}											printf("READ_HEADING ");
{read_temperature}										printf("READ_TEMPERATURE ");
{turn_heading}											printf("TURN_HEADING_ONE_DEGREE ");
{climb_ver}												printf("CLIMB_VER ");
{move_hor_one_ms}										printf("MOVE_HOR_ONE_MS ");
{connect_to_comp}										printf("CONNECT_TO_COMPUTER ");
{disconnect_to_comp}									printf("DISCONNECT_TO_COMPUTER ");
{turn_on_off_spray}										printf("TURN_ON_OFF_SPRAY ");
{set_altitude}											printf("SET_ALTITUDE ");
{set_heading}											printf("SET_HEADING ");
{get_battery_perc}										printf("GET_BATTERY_PERCENTAGE ");
{set_height}											printf("SET_HEIGHT ");
{identifier}                                            printf("IDENTIFIER ");	

%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}