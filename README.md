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

# Text paragraph formatter:
use Text::Wrap;
wrap("\t", "|", $text);
fill("\t", "", @text);
```

# DESCRIPTION

It's a simple port of Perl 5 two libraries: Text::Tabs and Text::Wrap, which in turn just Perlish implementation of expand/unexpand utilites and a little paragraph formatter.

Interface was simplified and is known to be incompatible with original modules. Though the situation can be improved in the future, it's still not granted.

Since `taint` feature from Perl 5 is not yet implemented, this port is incomplete and more direct port is unable to be finished yet.

# BUGS

To report bugs or request features, please use
https://github.com/Altai-man/perl6-Text-Tabs-Wrap/issues

But consider that this module is still at development stage.

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
