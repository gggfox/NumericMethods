clear

//Karyme Nahle Acosta A00823898
//Gerardo Galan Garzafox A00821196

function D=displayMatrix(MAT)
    D = ""
    disp(MAT)
endfunction

function X= GetMatrix(MAT)
    
//Se asigna el valor de las filas y columnas dependiendo la matriz que ingrese el usuario
   rowSize=size(MAT,1)
   colSize=size(MAT,2)
   
//la primera vez nuestro determinante anterior vale 1
PivoteAnterior = 1

//Para cada renglon i desde 1 hasta numero de renglones
for i = 1:rowSize
     //Para cada renglon k desde 1 hasta el numero de renglones
     for k = 1:rowSize
         if i <> k//Si k es diferente a la i
             //Para cada columna j desde i + 1 hasta numero de columnas
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
  //Para cada renglon i desde 1 hasta Renglones -1
  for i = 1:(rowSize-1)
      MAT(i,i) = PivoteAnterior
  end
  //desplegamos nuestra matriz identidad sin dividir
  displayMatrix(MAT)
  
  for i=1:rowSize
      //Para cada renglon i desde 1 hasta Renlones
      X(i)= MAT(i,colSize)/PivoteAnterior
      
  end
  
endfunction
//pedimos la matriz al usuario
MAT= input("Dame una matriz")
//igualamos X a nuestra funcion de montante que toma la matriz
X = GetMatrix(MAT)
//desplegamos la X
displayMatrix(X)

