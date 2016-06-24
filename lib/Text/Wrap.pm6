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

our sub fill($ip, $np, @raw) {
    my @para;
    my $pp;
    for (split(/\n\s+/, join("\n", @raw))) -> $pp {
        $pp ~~ s:g/\s+/ /;
        my $x = wrap($ip, $np, $pp);
        @para.push($x);
    }

    my $ps = ($ip eq $np) ?? "\n\n" !! "\n";
    join($ps, @para);
}
