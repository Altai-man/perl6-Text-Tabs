use v6;

unit module Text::Wrap;
use Text::Tabs;

our $columns = 76;
our $separator = "\n";

our sub wrap($init-tab, $next-tab, $source) {
    my $tab = $next-tab;
    $tab = $separator if $tab eq '';
    expand([$init-tab ~ $source.comb(/ \N ** {1..$columns})> [' '|$$]/).join($tab)])[0];
}
