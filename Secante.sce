clear
///////////////////////////////////////////////////

//Karyme Nahle Acosta A00823898
//Gerardo Galan Garzafox A00821196
//
//Este programa resolvera la funcion por el metodo de la secante 

//
///////////////////////////////////////////////////

function Despliegue(fX1,fX0,Deriv,Xi,i,ErrorA)        
       disp("f(Xi-1)=  " + string(fX1) + "  f(X0)=  " + string(fX0) + "  La derivada es  "  + string(Deriv) + "   y la nueva Xi-1 es  " + string(Xi))
       //despliega el valur absoluto despues de la primera iteracion
       if i > 1
           disp("   El error aproximado es  " + string (ErrorA))
       end
endfunction

function secante(X1,X0,Error,iN,ErrorA)
 a=%pi          
//Ciclo que corre el programa dependiendo el numero de iteraciones dada por el usuario
for i=1:iN
           
////////////////////////////////////////////////////////
//Se crean las funciones segun el metodo de la secante
/////////////////////////////////////////////////////////   
//Se calcula la funcion en Xi-1
           fX1 = a*X1*exp(2)*((9-X1)/3) - 30
//Se calcula la funcion en X0
           fX0= a*X0*exp(2)*((9-X0)/3) - 30
//Se calcula la derivada
           Deriv = (fX1-fX0)/(X1-X0);
//Se calcula la nueva Xi-1
           Xi = X1 - (fX1/Deriv);
           

        
 //Se calcula el error
 if i > 1 then
           ErrorA = abs(((Xi - Xip) / Xi)*100)  
  end             
Xip=Xi
//se despliegan los datos

       Despliegue(fX1,fX0,Deriv,Xi,i,ErrorA) 
//Si el error aproximado fue igual o menos al que el usuario pidio, se despliega el mensaje
if i > 1 then
          if (ErrorA <= Error) then
              disp("La raiz encontrada fue aproximada con el porcentaje de error")
              break
              end
       end       
//Si el error fue igual a 0 significa que la raiz fue exacta
      if i > 1 then
           if (ErrorA == 0) then     
          disp("La raiz encontrada es exacta") 
          break
      end
      end
      //Se actualizan las variables
         X0=X1
         X1=Xi
   
 end  
//Al terminar el for se despliega el mensaje de que fue calculado segun el numero de iteraciones dada por el usuario
if i == iN then
    disp("La raiz encontrada fue aproximada con el numero de iteraciones dado ")
end
          
       endfunction


///////////////////////////////////////////////////
//Se pide la X -1, X0, el error y el numero de iteraciones

       X0 = input("Introduce X-1    ")
       X1= input("Introduce X0    ")
       Error = input("Introduce el porcentaje de error en el que se quiera calcular    ")
       iN = input("Introduce el numero de iteraciones que se quieran realizar    ")
       ErrorA=0 
disp(secante(X1,X0,Error,iN,ErrorA))

      
