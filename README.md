# NAME [![Build Status](https://travis-ci.org/Altai-man/perl6-Text-Tabs.svg?branch=master)](https://travis-ci.org/Altai-man/perl6-Text-Tabs)

Text::Tabs - Perl 6 implementation of `expand` and `unexpand` utilities.

# SYNOPSIS

```
use Text::Tabs;

# Text with TAB characters replaced by 4 spaces.
say expand(@lines-with-tabs, 4);
say expand("this\tline has \t\t tabs", 4);

# Opposite, but 8 spaces is one TAB character now.
say unexpand(@lines-without-tabs, 8);
```

# DESCRIPTION

It's a slightly expanded port of Perl 5 module `Text::Tabs`, which in turn just Perlish implementation of expand/unexpand utilities.

Unlike the Perl5 version, Unexpand does not recognize tab-stops at this time.

# BUGS

To report bugs or request features, please use
https://github.com/Altai-man/perl6-Text-Tabs/issues

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
