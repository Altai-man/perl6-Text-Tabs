use v6;

unit module Text::Tabs:ver<0.2.1>;

multi sub expand(Int :ts(:$tab-stop) = 8, *@input) is export {
    process-by-lines @input, -> $line {
        my ($result, @chunks) = $line.split("\t");
        for @chunks {
            $result ~= ' ' x $tab-stop - $result.chars % $tab-stop;
            $result ~= $_;
        }

        $result;
    };
}

multi sub unexpand(Int :ts(:$tab-stop) = 8, *@input) is export {
    process-by-lines @input, -> $line {
        my @e = expand($line, :$tab-stop).comb($tab-stop);
        # Unless ends on a tab-stop, trailing spaces must not be converted to tab
        my @last-one = @e.pop if @e and @e[*-1].chars < $tab-stop;
        s/ ' ' ** 2..* $ /\t/ for @e;
        (@e, @last-one).flat.join;
    };
}

# Special case single Stringy arg to return a Str
multi sub   expand(Stringy $input, *%args) is export { callsame().first }
multi sub unexpand(Stringy $input, *%args) is export { callsame().first }

sub process-by-lines(@input, &process) {
    @input.map: {
        # To preserve line endings, use .comb instead of .lines
        .comb(/:r ^^ \N* \n?/)
        # Each line gets handled separately
        .map(&process)
        # Then joined back together to map back onto a single string
        .join
    }
}
