
data a;

input id : $4. a : 4.3;

datalines;
a 44.0
a 86.5
a 897.6
a 243.7
a 33.2
b 454.3
b 6.76
b 43.2
b 1.23
b 564.2
b 56.67
c 45.5
c 12.3
c 22.31
c 23.43
c 2.14
c 4.2
;
run;

*1. summary 사용;
proc summary data = a;
class id;
output out = aa1(drop = _type_ _freq_ where = (not missing(id)))
sum(a)=sum;
run;

*2. retain 사용;
proc sort data = a; by id; run;

data aa2(drop = a);
set a;
retain sum;

by id;

if first.id then sum = a;
else sum = sum + a;

if last.id then output;
run;

*3. sql 사용;
proc sql;
create table aa3 as
select distinct id, sum(a) as sum
from a
group by id;
quit;