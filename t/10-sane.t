use v6;

use Test;
use lib 'lib';
use Text::Tabs;

plan 16;

ok expand(["		"], 4)[0] eq "        ", 'two tabs were converted to 8 spaces';
ok unexpand(["            "], 4) eq "			", '12 spaces were converted to 3 tabs.';
ok unexpand([expand(["			"], 4)], 4) eq "			", "unexpand and expand are even";

ok expand([""]) eq [], "empty strings are working";
ok unexpand([""]) eq [], "empty strings are working";

is expand("no tabs"), 'no tabs', 'No tabs';
is expand("\t1234567", 4), '    1234567', 'Tab in 1st position';
is expand("1\t234567", 4), '1   234567', 'Tab in 2nd position';
is expand("12\t34567", 4), '12  34567', 'Tab in 3rd position';
is expand("123\t4567", 4), '123 4567', 'Tab in 4th position';
is expand("1234\t567", 4), '1234    567', 'Tab in 5th position';
is expand("12345\t67", 4), '12345   67', 'Tab in 6th position';
is expand("123456\t7", 4), '123456  7', 'Tab in 7th position';
is expand("1234567\t", 4), '1234567 ', 'Tab in 8th position';
is expand("f\t\too"), 'f               oo', '2 middle tabs within text';
is expand("\tfoo\tbar"), '        foo     bar', 'mixed tabs/text';
