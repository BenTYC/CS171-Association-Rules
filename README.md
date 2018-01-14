Write code to perform association analysis on the data supplied in groceries.txt.   
To help the following functions have been supplied.  
• D = loaddata(filename) returns an object representing the dataset.  
• num = getcount(set,D) returns the number of transactions in the dataset D for which all element of the set set are present. set should be a vector of integers, each representing a different item.  
• I = items(D) returns a vector of all of the items (as integers) in the dataset D, in sorted order.  
• m = numexamples(D) returns the number of transactions (or examples) in the data D.  
• str = rule2str(X,Y,D) returns a string representing the rule encoded by X->Y , where X and Y are represented by vectors of integers.  
  
Write a function findrules(D,smin,amin) that accepts a dataset (as above), a minimum support, and a minimum confidence and writes (to the console) a list of all rules that meet those restrictions, sorted by confidence. For example:
