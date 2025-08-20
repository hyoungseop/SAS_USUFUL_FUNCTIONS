
data aa;
format start_date e8601da. end_date e8601da.;

input start_date : e8601da. end_date : e8601da.;

datalines;
2020-05-02 2026-01-02
2021-04-13 2026-01-02
2022-03-14 2026-01-02 
2022-06-07 2026-01-02
2022-07-02 2026-01-02
2024-05-21 2026-01-02
2023-06-30 2026-01-02
2025-04-22 2026-01-02
2023-04-12 2026-01-03
2021-03-29 2026-01-04
2023-02-28 2026-01-02
2022-02-12 2026-01-03
;
run;

data aa1;
set aa;

intck연도계산 = intck('year',start_date, end_date,'c');
intck날짜계산 = intck('day',start_date, end_date,'c')/365.25;
단순날짜계산 = (end_date-start_date)/365.25;

run;

