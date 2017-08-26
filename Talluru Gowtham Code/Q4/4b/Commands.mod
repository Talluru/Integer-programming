option cplex_options 'presolve=0 mipcuts=-1 splitcuts=-1 heuristicfreq=-1 mipsearch=1 timing=1 mipdisplay=5 mipinterval=1 mipsearch=1';

solve;

display Worst_Case_Distance;
display x;
display y;
display popPerSite;
display CostPerSite;
display DistPerDistrict;
display sum{j in J} CostPerSite[j];
	
