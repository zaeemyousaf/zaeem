// bug: power in expression 2^2^2 error

	//---------------------------------;
	//global var
	//set line number to zero
	var lineN=1;
	var expr=[];
	//---------------------
	function dclear() {
		// display(screen) Clear
		Cal.Screen.value="";
		expr=[];	// setting expr to null
		}
	function vecToString(vector){
	// converts vector to string for evalaluation purpose
	string="";	// hold converted string
	for(i=0; i<vector.length; i++){
	string=string+vector[i];
	}
	return(string);
	
	}
	//---------------------------------;
	function hclear() {
		// History Clear
		document.getElementById("History").innerHTML="";
		lineN=1;	// resetting line to 1
		}
	
	//---------------------------------;
	function lastNumeric(){
	//returns last number from expression
	// e.g "3+222+9-33"	will return "33"
	var lstNum=[];
		element=expr[(expr.length)-1];
		len=expr.length;
		while(isNumericSign(element) && expr.length > 0){
			lstNum[lstNum.length]=element;
			expr.pop();
			element=expr[(expr.length)-1];
			}
		//flip this vector
		lstNum.reverse();
		// make it string from vector
		lstNum=vecToString(lstNum);
		return(lstNum);
	}
	//----------------------------------;
	function isNumericSign(char){
	NumericSignList=["0","1","2","3","4","5","6","7","8","9","."];
	for(i=0; i<12; i++){
	if(char==NumericSignList[i]){
	return(true);
	}
	}
	return(false);
	}
	//----------------------------------
		
	function draw(onScreen, forExpr){
	Cal.Screen.value=(Cal.Screen.value)+onScreen;
	expr[expr.length]=forExpr;
	}
	//---------------------------------;
	function EvaluateIt() {
	hist=document.getElementById("History").innerHTML;
	strExpr=vecToString(expr);
		if(strExpr==""){
		Cal.Screen.value="";
		}
		
		else{
		hist=hist+ lineN +" &#8594 Input: " + Cal.Screen.value + "<br/>" +lineN + " 			&#8594 Output: "+ eval(strExpr) + "<br/> <br/>";
		//hist=hist+ lineN +" --* Input: ";
		Cal.Screen.value=eval(strExpr);
		expr=[];
		expr[0]=eval(strExpr);
		document.getElementById("History").innerHTML=hist;
		lineN++;
			}
			
		}
	//------------------------------;

	
	function backs(){
		string=Cal.Screen.value;
		nst="";
		for(i=0; i< ((string.length)-1); i++){
			nst=nst+string[i];
			// replacing last element with NullChar
			}
			//return(nst);
			Cal.Screen.value=nst;
			expr.pop();
		}

		//--------------------------
		function prmResult(){
		hist=document.getElementById("History").innerHTML;
			// puts prime result into Screen area
			if(Cal.Screen.value==""){
				Cal.Screen.value="";
				}
			else {
				//get his before updating Cal.Screen.value
				hist=hist+ lineN +" &#8594 Input: " +"is Prime? "+ Cal.Screen.value + "<br/>" +lineN + " &#8594 Output: "+ isPrime(Cal.Screen.value)+ "<br/> <br/>";
				Cal.Screen.value=isPrime(Cal.Screen.value);
				expr=[];
				expr=Cal.Screen.value;
				document.getElementById("History").innerHTML=hist;
				lineN++;
	
				}
				return(0);
			}
		//------------------------------

		//------------------------------
		
		function divisorResult(){
		hist=document.getElementById("History").innerHTML;
			//puts divisors result into Screen area;
			if(Cal.Screen.value==""){
				Cal.Screen.value="";
				}
				else{
				var x=eval(Cal.Screen.value);
				dlst=[];
		for (i=1; i<=Math.sqrt(Math.abs(x)); i++){
		if(x%i==0){
			dlst[dlst.length]=i;
			// do not dublicate divisor e.g [1,25,5,5]
			if(dlst[dlst.length-1] != x/i){
			dlst[dlst.length]=x/i;
			}
				}
			}
					hist=hist+ lineN +" &#8594 Input: " +"List Divisors of "+ Cal.Screen.value + "<br/>" +lineN + " &#8594 Output: "+ "Total : "+"["+dlst.length+"] "+dlst+ "<br/> <br/>";
					Cal.Screen.value="Total : "+"["+dlst.length+"] "+dlst;
					expr=[];
					expr[0]=Cal.Screen.value;
					document.getElementById("History").innerHTML=hist;
					lineN++;
					}
			}
		//--------------------------

		function isPrime(x){
			//first EvaluateIt the value in Screen and later check it whether prime
			var x=Math.abs(eval(x));
			if(x==1){return("Not Prime")};
			var divisors=0;
			for(i=1; i<=Math.sqrt(x); i++){
				if(x%i==0){
					divisors++;
					divisors++;
					}
					if (divisors >2){
						return("Not Prime");
						}
				}
			
				if(divisors==2){return("Yes: Prime")} else{return("Not Prime")}
			}
		//-----------------------------
		function primesBetween(lower,upper){
		hist=document.getElementById("History").innerHTML;
		if((lower+upper)%1==0){
		plst=[];
			var i;
			for(i=Math.floor(lower); i<=upper; i++){
				if(isPrime(i)=="Yes: Prime"){
					//document.write("it is in if loop");
					plst[plst.length]=i;
					}
				}
			//return(plst);
			hist=hist+ lineN +" &#8594 Input: How many primes between "+ lower +" and " + upper+"<br/>" +lineN + " &#8594 Output: " +"Total: "+ "["+plst.length+"] "+plst+"<br/> <br/>";
			Cal.Screen.value= "Total: "+ "["+plst.length+"] "+plst;
			expr=[];
			expr[0]=Cal.Screen.value;
			//document.write(lst);
			document.getElementById("History").innerHTML=hist;
			lineN++;
			}
			}
	//************************************************************************************
			
	function primesBetween(){
		hist=document.getElementById("History").innerHTML;
		var upper=Math.ceil(eval(lastNumeric()));
		expr.pop();
		var lower=Math.floor(eval(lastNumeric()));
		if((lower+upper)%1==0){
		plst=[];
			var i;
			for(i=lower; i<=upper; i++){
				if(isPrime(i)=="Yes: Prime"){
					//document.write("it is in if loop");
					plst[plst.length]=i;
					}
				}
			//return(plst);
			hist=hist+ lineN +" &#8594 Input: How many primes between "+ lower +" and 				" + upper+"<br/>" +lineN + " &#8594 Output: " +"Total: "+ "["+plst.length+"] "+plst+"<br/> <br/>";
			Cal.Screen.value= "Total: "+ "["+plst.length+"] "+plst;
			expr=[];
			expr[0]=Cal.Screen.value;
			//document.write(lst);
			document.getElementById("History").innerHTML=hist;
			lineN++;
			}
			}
	//-------------------------------------------------------------
	function zfactorial(){
	hist=document.getElementById("History").innerHTML;
	var Product=1;
	var x=eval(Cal.Screen.value);
	if(x%1==0){
	// x is an integer
	for(i=x; i>0; i--){
	Product=Product*i;
	}
	}
	else{
	Cal.Screen.value="Wrong input...";
	}
	//return(sum);
	hist=hist+ lineN +" &#8594 Input: Factorial of "+ x +"<br/>" +lineN + " &#8594 Output: " 	+Product+"<br/> <br/>";
			Cal.Screen.value= Product;
			expr=[];
			expr[0]=Cal.Screen.value;
			//document.write(lst);
			document.getElementById("History").innerHTML=hist;
			lineN++;
	}
	//-----------------------------------------------------------
	function prmFactorial(){
	hist=document.getElementById("History").innerHTML;
	x=eval(Cal.Screen.value);
	var prmProduct=1;
	var i;
	for(i=x; i>0; --i){
	if(isPrime(i)=="Yes: Prime"){
	prmProduct=prmProduct*i;
	}
	}
	//return(prmProduct);
	hist=hist+ lineN +" &#8594 Input: Prime factorial of "+ x +"<br/>" +lineN + " &#8594 Output: " 	+prmProduct+"<br/> <br/>";
			Cal.Screen.value= prmProduct;
			expr=[];
			expr[0]=Cal.Screen.value;
			//document.write(lst);
			document.getElementById("History").innerHTML=hist;
			lineN++;
	}
