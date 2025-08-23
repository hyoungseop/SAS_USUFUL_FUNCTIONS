

**예시 데이터 만들기***;

data data;

call streaminit(0); *난수 고정을 위한 세팅;

do i = 1 to 100;

*id 생성;
id = catt("a",(put(i,z3.)));

*성별 생성;
*난수값을 지정(0~1)하여 0.5 이상 시 남자, 그외 여자;
if rand('uniform') > 0.5 then sex = '남자';
else sex = '여자';

*혈당 생성;
*정규분포가 100이고 표준편차가 25인 랜덤 혈당 데이터 생성;
blood_sugar = round(rand('normal',100,25),0.01);

drop i;
output;

end;

run;