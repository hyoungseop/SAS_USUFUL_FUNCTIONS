
data a;

input group : $4. a1 : 4.2 a2 : 7.2 x : $4.;

datalines;
a 2.2 443.1 x
a 9.9 4321.4 x
a 8.7 6564.7 x
a 34.7 43.76 x
a 54.3 547.3 x
a 7.5 5457.4 x
b 1.1 4.76 x
b 3.2 765.43 x
b 5.6 4346.3 z
b 67.7 3432.1 z
b 5.5 4343.1 z
b 3.4 644.3 z
b 33.2 7.65 z
b 4.3 233.2 z
b 4.6 5435.2 z
b 7.5 45.4 z
c 2.7 6.6 z
c 3.4 222.3 z
c 6.4 243.2 z
;
run;

ods trace on ; 

proc report data = a out = x;
columns group a1 a1 = a1_std a2 a2 = a2_std a3;
define group / group "그룹";
define a1 / analysis mean "a1평균" format = comma7.2; 
define a1_std / analysis std "a1표준편차" format = comma7.2;
define a2 / analysis mean "a2평균" format = comma7.2;
define a2_std / analysis std "a2표준편차" format = comma7.2;
define a3 / computed "계산값" format = comma7.2;
compute a3;
a3 = a1.mean + a2.mean;
endcomp;
break after group / summarize page skip; *page : 한줄 띄우기 skip : 페이지 구분;
rbreak after /summarize ol ul; *summarize: 전체에 대한 결과 요약 ol/ul: 위아래 선긋기;
run;