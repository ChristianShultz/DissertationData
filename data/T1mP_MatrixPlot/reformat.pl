#!/usr/bin/perl 

open IN , "<" , "matrix_plot_5.dat" || die ("couldnt open file"); 
open OUT, ">" , "matrix_plot_5.cooked.dat" || die("couldnt open out"); 

foreach my $line (<IN>)
{
    print $line; 
    my @a = split /,/, $line; 
    pop @a;
    foreach my $ele (@a)
    {
        print OUT abs($ele) . " "; 
    }
    print OUT "\n"; 
}

close IN; 

