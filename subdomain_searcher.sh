amass enum --passive -silent -d $1 -o $1  && subfinder -silent -d $1 -o domains_subfinder_$1 && cat domains_subfinder_$1 | tee -a $1 && rm -rf domains_subfinder_$1 && chaos -d $1 | tee -a $1 && assetfinder $1 --subs-only | tee -a $1 && python3 ./github-search/github-subdomains.py -d $1 -t api-key| tee -a $1 && uniq $1 -u | tee $1_OK
sort -k2n $1_OK | sed '$!N; /^\(.*\)\n\1$/!P; D' >> $1_domain.txt   && rm -rf  $1_OK $1 && echo "SubDomain Search Succuess!"