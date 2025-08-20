

options msglevel = i;

proc printto log = "/home/a010489956630/PRACTICE/USUFUL_FUNCTION/SAMPLE/mylog.log" new; run;

data _null_; run;

proc printto log = log; run;



proc printto log = "/home/a010489956630/PRACTICE/USUFUL_FUNCTION/SAMPLE/mylog.log"; run;

%put ffff;

proc printto log = log; run;
