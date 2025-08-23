
data a;
retain sex count;
if _n_ = 1 then do;

declare hash a();

a.definekey('sex');
a.definedata('sex','sum','count');
a.definedone();

end;

set data end = eof;

rc = a.find();

if rc ne 0 then do; *처음등장;
sum = blood_sugar;
count = 1;
a.add();
end;
else do;
sum + blood_sugar;
count + 1;
a.replace();
end;

if eof then do;

declare hiter aa('a');
rc=aa.first();
do while(rc = 0);
avg = round(sum/count,0.01);
output;
rc=aa.next();
end;
end;

keep sex avg;
run;