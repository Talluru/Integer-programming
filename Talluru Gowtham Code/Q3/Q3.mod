#Advanced Analytics and Metahueristics
#Home Work-3
#Gowtham Talluru
#03-26-2017

reset;
option solver cplex;



var x1 <= 10000, >=0;				# widgets from WII		

var x2 <= 7500, >=0;					# widgets additional to minimum 7500 from WRS
var b2 binary;					# binary condition to buy minimum of 7500 widgets from WRS

var x3 <= 9000, >=0;					# widgets from WU	
var b3 binary;					# binary condition to buy from Wu

var x41>=0;
var x42>=0;
var x43>=0;

var b41 binary;
var b42 binary;

######Objective function
minimize Total_Cost: 4.25*x1 + 3.15*7500*b2 + 3.15*x2 +
		 15000*b3 + 1.90*x3 + 5.5*x41 + 3.5*x42 + 2*x43;


#####Constraints
subject to Demand:
	x1 + x2 + b2*7500 + x3 + x41 + x42 + x43 >= 32000;

subject to WRS:
	x2<= 100000*b2;
	
subject to WU:
	x3<= 100000*b3;

subject to WOW11:
	b41*5000 <= x41;
subject to WOW12:
	 x41 <= 5000;
	 
subject to WOW21:
	b42*7500 <= x42;
subject to WOW22:
	 x42 <= 7500*b41;
		
subject to WOW31:
	0 <= x43 ;
subject to WOW32:
	x43 <= 12500*b42;	

solve;

display x1, x2 + b2*7500, x3, x41+x42+x43;

