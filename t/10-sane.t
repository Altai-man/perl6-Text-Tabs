use v6;

use Test;
use lib 'lib';
use Text::Tabs;

plan 20;

is expand("		", :tab-stop(4)), "        ", 'two tabs were converted to 8 spaces';
is unexpand("            ", :tab-stop(4)), "			", '12 spaces were converted to 3 tabs.';
is unexpand(expand("			", :ts(4)), :ts(4)), "			", "unexpand and expand are even";

is expand(""), [], "empty strings are working";
is unexpand(""), [], "empty strings are working";

is expand("no tabs"), 'no tabs', 'No tabs';
is expand("\t1234567", :tab-stop(4)), '    1234567', 'Tab in 1st position';
is expand("1\t234567", :tab-stop(4)), '1   234567', 'Tab in 2nd position';
is expand("12\t34567", :tab-stop(4)), '12  34567', 'Tab in 3rd position';
is expand("123\t4567", :tab-stop(4)), '123 4567', 'Tab in 4th position';
is expand("1234\t567", :tab-stop(4)), '1234    567', 'Tab in 5th position';
is expand("12345\t67", :tab-stop(4)), '12345   67', 'Tab in 6th position';
is expand("123456\t7", :tab-stop(4)), '123456  7', 'Tab in 7th position';
is expand("1234567\t", :tab-stop(4)), '1234567 ', 'Tab in 8th position';
is expand("f\t\too"), 'f               oo', '2 middle tabs within text';
is expand("\tfoo\tbar"), '        foo     bar', 'mixed tabs/text';

is unexpand("foo" ~ ' ' x 5 ~ "bar"), "foo\tbar", 'Exactly one tabstop';
is unexpand("foo" ~ ' ' x 7 ~ "bar"), "foo\t  bar", 'One tabstop and extra';
is unexpand("foo" ~ ' ' x 13 ~ "bar"), "foo\t\tbar", 'Exactly two tabstops';
is unexpand("foo" ~ ' ' x 15 ~ "bar"), "foo\t\t  bar", 'Two tabstops and extra';
