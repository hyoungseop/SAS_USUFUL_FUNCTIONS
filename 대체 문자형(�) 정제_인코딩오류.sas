filename utf8file "~/utf8_test.txt" encoding="utf-8";

data _null_;
    file utf8file;
    put "ㄹㅜㄷㅈ벼룯ㅈ뱌ㅕㅐ룯ㅈ배루뎢배루ㅑㅕㅇㄴ물물";  
    put "ㄹㅇㄴㅁㄹㄷㅈㅂㄹㄷㅈㅂㄹㄷㅈㅂㄹㄴㄴㅁㅍㅌㅊㅍ"; 
run;



data chk;
infile "~/utf8_test.txt" encoding="euc-kr";

input a $30;
run;


data chk1; set chk;

length hexval $500;
hexval = '';
do i = 1 to length(a);
hexval = catx(' ', hexval, put(rank(substr(a,i,1)), hex2.));
end;
    
run;

