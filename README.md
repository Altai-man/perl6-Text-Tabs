# NAME

Text::Tabs-Wrap - simple manipulations with text.

# SYNOPSIS

```
# Now:
use Text::Tabs;
say expand(@lines-with-tabs, 4);
# Text with TAB characters replaced by 4 spaces.
say unexpand(@lines-without-tabs, 8);
# Opposite, but 8 spaces is one TAB character now.
# In future:
use Text::Wrap;
wrap("\t", "", $text);
fill("\t", "", $text);
```

# DESCRIPTION

It's a simple port of Perl 5 two libraries: Text::Tabs and Text::Wrap, which in turn just Perlish implementation of expand/unexpand utilites and a little paragraph formatter. First module is mostly done and only need proper tests/docs, second is still undone.

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Text-Tabs-Wrap/issues

But consider that this module is still at development stage.

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
