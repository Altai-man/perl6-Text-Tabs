use v6;

unit module Text::Tabs:ver<0.2.0>;

sub expand(Int :ts(:$tab-stop) = 8, *@input --> Iterable) is export {
    my Array $output = [];
    for @input -> $el {
        my $tmp = '';
        for $el.split(/^/, :skip-empty) -> Str $line {
            $tmp ~= expand-one($line, $tab-stop);
        }
        $output.push($tmp);
    }
    $output;
}

sub expand-one(Str $input, Int $tab-stop = 8 --> Str) {
    my $output = q{};
    my $position = 0;
    for $input.split(/\t/, :v) -> $part {
        if ($part eq "\t") {
            my $distance-from-stop = $position % $tab-stop;
            my $tab-length = $tab-stop - $distance-from-stop;
            $output ~= q{ } x $tab-length;
            $position += $tab-length;
        } else {
            $position += $part.chars;
            $output ~= $part;
        }
    }

    $output;
}

sub unexpand(Int :ts(:$tab-stop) = 8, *@input --> Iterable) is export {
    my $output;
    my $ts_as_space = " " x $tab-stop;
    my @lines;

    for @input -> $el {
        @lines = split("\n", $el, :skip-empty);
        @lines = [expand(@lines).flat];
        my @buff;
        for @lines -> $line {
            my $replaced = $line
            .comb($tab-stop)
            .map({ $_ eq $ts_as_space ?? "\t" !! $_ })
            .join('');
            @buff.push($replaced);
        }
        $output.push(join("\n", @buff));
    }
    $output;
}
