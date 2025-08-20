/* 직원 데이터 */
data employees;
    input emp_id name $ dept_id;
datalines;
101 Kang 1
102 Yoon 2
103 Kim 2
104 Lee 3
105 Jung 3
;
run;

/* 부서 테이블 (lookup용) */
data departments;
    input dept_id dept_name $20.;
datalines;
1 HR
2 IT
3 Sales
;
run;


***hash object***;
*결합에 주목적(엑셀의 vlookup과 같은 개념);
data hash;

length dept_name $20.;

/*해시 객체 만들기*/
if _n_ = 1 then do;

call missing(of _all_);

declare hash a(dataset:"departments");

a.definekey(key:"dept_id");
a.definedata(all:"yes");
a.definedone();

end;

set employees;

rc = a.find();

drop rc;

run;