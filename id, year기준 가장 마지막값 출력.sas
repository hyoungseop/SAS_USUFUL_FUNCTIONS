

data a;

input id : $10. year : 4. sum : 2.;

datalines;
a 2015 1
a 2013 1
a 2013 3
a 2013 2
c 2016 1
c 2015 1
c 2014 3
c 2014 2
c 2014 1
d 2013 1
d 2013 2
d 2019 4
e 2016 1
d 2013 3
e 2016 1
e 2015 2
e 2014 3
d 2015 3
d 2016 4
;
run;




proc sort data = a; by id year descending sum; run;


data aa;
set a;

by id year descending sum;
retain first_year;


if first.id and first.year and first.sum then output;
run;