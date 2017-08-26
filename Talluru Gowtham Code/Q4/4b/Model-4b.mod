#Advanced Analytics and Metahueristics
#Home Work-3
#Gowtham Talluru
#03-26-2017



#Sets
set I;                        # districts
set J; 						  # locations
#Parameters
param p {I} ; 					# Population
param d {I,J};					# Distance between district and site
param B;						# Budget
param f {J};					# Fixed Cost
param c {J};					# Variable Cost

#Primary Variables
var y {J} binary;				# Selection of Site
var x {I,J} binary;				# District i served by site j

#Secondary Variables for convinience
var temp1 binary;				# Temp binary variable
var popPerSite{J};				# Total population served by each site
var CostPerSite{J};				# Total Cost associated per each site
var DistPerDistrict{I};			# Distance for each district
var D;							# Worst case distance

#Objective function
minimize Worst_Case_Distance: D;

#Constraints

#Each district should get exactly one site
subject to District_to_one_site {i in I}:
	sum{j in J} x[i,j] = 1;

#District cannto be assigned to unused site	
subject to No_District_to_unused_site {j in J}:
	sum{i in I} x[i,j] <= y[j] *1000;

# Either Site 1&2 or Site 3&4 should be selected	
subject to Selection_12: 
	y[1] + y[2] >= 2*temp1;	
subject to Selection_34: 	
	y[3] + y[4] >= 2*(1-temp1);

#Population served by each site	
subject to Population_Served {j in J}:
	popPerSite[j] = sum{ i in I} p[i] * x[i,j];

#Total cost associated with each site (Population dependent + Fixed)
subject to Cost_Per_site {j in J}:
	CostPerSite[j] = c[j] * popPerSite[j] + f[j] * y[j];

#Total Cost	
subject to Budget: sum{j in J} CostPerSite[j] <= B;

#Distance between each district and its alloted site
subject to Distance {i in I}:
	DistPerDistrict[i] = sum{j in J} x[i,j] * d[i,j];

#Worst case Distance
subject to Worst_distance {i in I}:
	D >= sum{j in J} d[i,j] * x[i,j];
	
