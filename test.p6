use v6;

my $file = open 'scores';
my @names = $file.get.words;

my %matches;
my %sets;

for $file.lines -> $line {
    my ($pairing, $result) = $line.split(' | ');

    my ($p1, $p2) = $pairing.words;
    my ($r1, $r2) = $result.split(':');

    %sets{$p1} += $r1;
    %sets{$p2} += $r2;

    if $r1 > $r2 {
        %matches{$p1}++;
    } else {
        %matches{$p2}++;
    }
}

my @sorted = @names.sort({ %sets{$_} }).sort({ %matches{$_} }).reverse;

for @sorted -> $n {
    say "$n has won %matches{$n} matches and %sets{$n} sets";
}

my Int $a = 2;
say $a;
say '1' if $a == 1;
say '2' if $a == 2;
# $a = "hoge";
# say $a;

my @a = (2, 5, 3, 1, 9);
say @a;
for @a -> $i {
    say $i;
}
for @a.sort -> $i {
    say $i;
}
@a.sort.print;
say '';

class Hoge {
    has $.def;
    has $.abc;
    has $!hoge;

    submethod BUILD(:$!abc, :$!def) {
        $!hoge = "$!abc hoge";
    }

    method say_abc() {
        say $!hoge;
        say $.abc;
        $!abc = "$!abc hoge";
    }

    method say_def() {
        say $.def;
    }
}

my $ho = Hoge.new( abc=>'gefu', def=>1 );
$ho.say_abc;
$ho.say_abc;
$ho.say_abc;
$ho.say_def;
