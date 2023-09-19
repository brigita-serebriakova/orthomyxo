#!/bin/bash

time cat <(echo) <(pigz -dc /Volumes/WD_BLACK/Brigita/Orthomyxoviridae/nr.fa.gz) \
    | perl -e 'BEGIN{ $/ = "\n>"; <>; } while(<>){s/>$//;  $i = index $_, "\n"; $h = substr $_, 0, $i; $s = substr $_, $i+1; if ($h !~ />/) { print ">$_"; next; }; $h = ">$h"; while($h =~ />([^ ]+ 
.+?) ?(?=>|$)/g){ $h1 = $1; $h1 =~ s/^\W+//; print ">$h1\n$s";} } ' \
    | seqkit grep -f /Volumes/WD_BLACK/Brigita/Orthomyxoviridae/6656.acc.txt -o /Volumes/WD_BLACK/Brigita/Orthomyxoviridae/nr.6656.fa.gz
