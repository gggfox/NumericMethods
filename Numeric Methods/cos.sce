clear
clc

//funcion para factorial
function dFact=Factorial(dFact)
    if(dFact<=0) then dFact = 1
    else
        dFact = dFact* Factorial(dFact-1)
    end
endfunction

//funcion para el exponente
function dExp=expo(x,n)
   dExp=x^n
endfunction

//funcion para coseno
function dCos=Cosine(x)
   dCos= cos(x)
endfunction

//main program
x=input("give me x ")
n=input("give me precision n")
disp(string(expo(x,n)))
