
option validvarname = any;
option validmemname = extend;

data 샘플;

input a : $4. b : 4. c : $10.;

datalines;
a 2 asd
b 3 fdsf
b 3 fdsfd
b 3 erer
c 3 fefefe
d 3 qss
s 2 retr
a 1 iui
d 1 fgvv
;
run;

*줄바꿈;
data 줄바꿈; set 샘플;

줄바꿈 = catt(a,'0D0A'x,b);

run;

*0값 채우기;
data '0값채우기'n; set 샘플;
format b2 z2. b3 z3.;

b2 = b;
b3 = b;
run;

proc export data = 줄바꿈 outfile = "/home/a010489956630/PRACTICE/USUFUL_FUNCTION/줄바꿈.xlsx" replace dbms = xlsx; run;