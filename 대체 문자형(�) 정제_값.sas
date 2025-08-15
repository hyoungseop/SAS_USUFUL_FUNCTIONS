

data test_char;
    length text $50;

    /* 1) 직접 �를 넣은 경우 */
    text = "Hello�World";

    output;

    /* 2) HEX값으로 넣는 경우 (UTF-8: EFBFBD) */
    text = cats("Hello", 'EFBFBD'x, "World");

    output;
run;

data chk; set test_char;

a = compress(text,'efbfbd'x);

run;