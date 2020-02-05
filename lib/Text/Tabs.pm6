use v6;

unit module Text::Tabs;

multi sub expand(@input, Int $tabstop = 8 --> Array) is export {
    my Array $output = [];
    for @input -> $el {
        my $tmp = '';
        for $el.split(/^/, :skip-empty) -> Str $line {
            $tmp ~= expand($line, $tabstop);
        }
        $output.push($tmp);
    }
    $output;
}

multi sub expand(Str $input, Int $tabstop = 8 --> Str) is export {
    my $output = q{};
    my $position = 0;
    for $input.split(/\t/, :v) -> $part {
        if ($part eq "\t") {
            my $distance-from-stop = $position % $tabstop;
            my $tab-length = $tabstop - $distance-from-stop;
            $output ~= q{ } x $tab-length;
            $position += $tab-length;
        } else {
            $position += $part.chars;
            $output ~= $part;
        }
    }

    $output;
}

our sub unexpand(@input, $tabstop = 8 --> Array) is export {
    my $output;
    my $ts_as_space = " " x $tabstop;
    my @lines;

    for @input -> $el {
        @lines = split("\n", $el, :skip-empty);
        @lines = [expand(@lines).flat];
        my @buff;
        for @lines -> $line {
            my $replaced = $line
            .comb($tabstop)
            .map({ $_ eq $ts_as_space ?? "\t" !! $_ })
            .join('');
            @buff.push($replaced);
        }
        $output.push(join("\n", @buff));
    }
    $output;
}
