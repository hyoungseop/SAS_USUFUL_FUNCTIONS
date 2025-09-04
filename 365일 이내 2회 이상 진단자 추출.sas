

data a;

format date e8601da.;

input id : $8. 주상병코드 : $4. date : 10.;

datalines;
a E11 4434
a E11 4434
a E12 4434
a E13 4434
a E13 4435
b E11 3434
b E13 4443
b E14 5454
b E23 6543
c E11 4354
c E81 5354
c E34 5432
c E22 5455
d E12 1545
d E11 2354
d E54 2385
d Y76 3311
d U45 4565
e E32 15545
e E22 22453
e E11 23445
e E11 24455
;

run;

data a0(where = (주상병코드 in ('E10' 'E11' 'E12' 'E13' 'E14'))); set a; run;

proc sort data = a0; by id date; run;


data b(keep = date rename = (date = date_next)); set a0(firstobs = 2); run;


data null; run;


data c_set;
retain id 주상병코드 date date_next;
*row수는 b 기준으로 생성되어 마지막 row를 생성해야함;
set a0;
set b null end = eof;

if eof then date_next = date;

run;


/*가로 결합해도 상관 없음
data c_merge;

merge a0 b end = eof;

if eof then date_next = date;
run;
*/

proc sort data = c_set; by id date; run;


data c_set1;

set c_set;

retain 순서;

by id date;

횟수 = 1;

if first.id then 순서 = 1;
else 순서 + 1;

if last.id then date_next = date;

연도간차이 = intck('day',date,date_next);

run;


proc sql;
create table c_set2 as
select *, sum(횟수) as 총횟수
from c_set1
group by id
order by id,순서;
quit;


data c_set3;
set c_set2(where = (총횟수 > 1 and 연도간차이 < 365));

by id 순서;

if last.id then 마지막날 = 1;

if first.id and missing(마지막날) then output c_set3;

run;




