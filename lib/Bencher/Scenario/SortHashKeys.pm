package Bencher::Scenario::SortHashKeys;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark Sort::HashKeys',
    participants => [
        {
            name => 'map',
            code_template => 'state $h = <hash>; map {($_, $h->{$_})} sort keys %$h',
            result_is_list => 1,
        },
        {
            module => 'Sort::HashKeys',
            function => 'sort',
            code_template => 'state $h = <hash>; Sort::HashKeys::sort(%$h)',
            result_is_list => 1,
        },
    ],
    datasets => [
        {name=>'2key'   , args=>{hash=>{map {$_=>1} 1..   2}} },
        {name=>'10key'  , args=>{hash=>{map {$_=>1} 1..  10}} },
        {name=>'100key' , args=>{hash=>{map {$_=>1} 1.. 100}} },
        {name=>'1000key', args=>{hash=>{map {$_=>1} 1..1000}} },
    ],
};

1;
# ABSTRACT:
