

data c;

input id : $20. glucose : 4.2;

datalines;
a 2.3
c 2.3
d 42.4
w 21.4
v 32.3
d 22.1
s 55.3
a 1.2
a 9.4
c 35.6
s 8.67
c 56.4
x 54.2
e 34.5
w 66.5
w 5.2
w 1.27
d 9.9
;

run;


data hash;
length id $20. sum 8;

retain sum;

if _n_ = 1 then do;

declare hash a();

a.definekey(key:"id");
a.definedata("id","sum"); *집계할 변수만 넣으면 됨;
a.definedone();

end;

set c end = eof;

*데이터 읽으면서 집계;
if a.find() ne 0 then sum = 0;
sum + glucose;
a.replace();

*데이터 마지막에 해시 반복객체로 순회;
if eof then do;
declare hiter aa("a");
rc = aa.first();
do while(rc = 0);
output;
rc = aa.next();
end;
end;

run;







