use v6;

unit module Text::Wrap;
use Text::Tabs;

our $columns   is export = 76;
our $separator is export = "\n";

our sub wrap($init-tab, $next-tab, $source) is export {
    my $tab = $next-tab;
    $tab = $separator if $tab eq '';
    # Needs fixing.
    expand([$init-tab ~ $source.comb(/ \N ** {1..$columns})> [' '|$$]/).join($tab)])[0];
}

our sub fill($ip, $np, @raw) is export {
    my @para;
    for (split(/\n\s+/, join("\n", @raw))) {
        my $pp = $_;
        $pp ~~ s:g/\s+/ /;
        my $x = wrap($ip, $np, $pp);
        @para.push($x);
    }

    my $ps = ($ip eq $np) ?? "\n\n" !! "\n";
    join($ps, @para);
}
