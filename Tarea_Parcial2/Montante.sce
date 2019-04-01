clear

//Karyme Nahle Acosta A00823898
//Gerardo Galan Garzafox A00821196

function D=displayMatrix(MAT)
    D = ""
    disp(MAT)
endfunction

function [a,b]=linear(X,Y)
    [n,m]=size(X);
    n=n*m;
    sumx = sum(X);
    sumy = sum(Y);
    sumxx = sum(X.*X);
    sumxy = sum(X.*Y);
    a=(sumx*sumy-n*sumxy)/(sumx*sumx-n*sumxx);
    b=(sumy-a*sumx)/n;
endfunction

function X= GetMatrix(MAT)
    
//Se asigna el valor de las filas y columnas dependiendo la matriz que ingrese el usuario
   rowSize=size(MAT,1)
   colSize=size(MAT,2)
   
//la primera vez nuestro determinante anterior vale 1
PivoteAnterior = 1

//Para cada renglon i desde 1 hasta numero de renglones
for i = 1:rowSize
     
     for k = 1:rowSize
         if i <> k//mientras que i no sea igual a k
             //empecamos el ciclo para movernos por las columnas
             for j = (i+1):colSize
                 //ecuacion que usa montante para matrices
                 MAT(k,j) = (MAT(i,i)*MAT(k,j)- MAT(k,i)*MAT(i,j)) /PivoteAnterior
             
         end
         //hace que los numeros de arriba y abajo de nuestro pivote sean 0
             MAT(k,i) = 0
        end 
    end
    //actualizamos nuestro pivote anterior hacia el siguiente pivote
    PivoteAnterior = MAT(i,i)
    //desplegamos como queda la matriz tras cada ciclo
    displayMatrix(MAT)
    
  end
  //temina el ciclo de las matrices y empieza los ciclos para la X
  for i = 1:(rowSize-1)
      MAT(i,i) = PivoteAnterior
  end
  //desplegamos nuestra matriz identidad sin dividir
  displayMatrix(MAT)
  
  for i=1:rowSize
      //divide todo por el pivote anterior para conseguir la matriz identidad y la X
      X(i)= MAT(i,colSize)/PivoteAnterior
      
  end
  
endfunction

//pedimos los valores de X y de Y al usuario
UsrX=input(" Conjunto de valores de x: ")
UsrY=input(" Conjunto de valores de y: ")
Value=input ("Para que valor desea estimar?: ")
[a,b]=linear(UsrX,UsrY)
disp("Lineal: y= ")
disp(a)
disp("+(")
disp(b)
disp("), r2=")
//pedimos la matriz al usuario
//MAT= input("Dame una matriz")
//igualamos X a nuestra funcion de montante que toma la matriz
//X = GetMatrix(MAT)
//desplegamos la X
//displayMatrix(X)

