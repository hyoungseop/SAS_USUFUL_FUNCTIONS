
data a0;

input 음식_대 : $10. 음식_소 : $20. 음식_소_번호 : 3.;

datalines;
떡볶이 응급실떡볶이 1
떡볶이 마라떡볶이 2
떡볶이 신전떡볶이 3
떡볶이 떡볶이 4
떡볶이 궁중떡볶이 5
떡볶이 로제떡볶이 6
김밥 참치김밥 7
김밥 치즈김밥 8
김밥 김치김밥 9
라면 라면 10
불고기 오리불고기 11
불고기 소불고기 12
불고기 돼지불고기 13
;

run;

data aa(index = (음식_대));

retain 음식_대_번호;

length 음식_대 $10. 음식_대_번호 3.;

if _n_ = 1 then do;

declare hash a1();

call missing(of _all_);

a1.definekey("음식_대");
a1.definedata("음식_대","음식_대_번호");
a1.definedone();

end;

set a0(keep = 음식_대) end = eof;

rc = a1.find();

if rc ne 0 then 음식_대_번호 + 1;       


rc = a1.replace();

if eof then do;

declare hiter aa('a1');

rc = aa.first();
do while(rc = 0);
output;
rc = aa.next();
end;
end;

run;

data aaa; 

set a0;
set aa key = 음식_대/unique;

if _iorc_ = %sysrc(_dsenom) then do;
call missing(of _all_);
put "오류";
end;

run;


