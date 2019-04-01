clear 

//Karyme Nahle Acosta A00823898
//Gerardo Galan Garzafox A00821196

//Este programa sirve para sacar la X por el metodo de eliminacion Gaussiana
//se crea la funcion que hara todo el proceso
/*
    AX=B
    A^-AX=A^-B
    IX=A^-B
    X=A^-B
*/
function x = Eliminacion(MAT)
 
//Se asigna el valor de las filas y columnas dependiendo la matriz que ingrese el usuario
   rowSize = size(MAT,1)
   colSize = size(MAT,2)

//Este for recorre desde la fila 1 hasta la penultima fila
//Para cada renglon i desde 1 hasta numero de renglones -1
for i = 1:rowSize-1 
    //en este ciclo nos vamos a mover por las filas debajo del indice(i) de la matriz   
    for k = i+1:rowSize
        fact = -MAT(k,i)/MAT(i,i)
        //en este ciclo nos vamos a mover por las columnas de la matriz
        for j = 1:colSize
            //modificamos la matriz 
            MAT(k,j)= MAT(k,j) + fact * MAT(i,j)
        end    
    end
    //desplegamos la matriz al final de cada ciclo
    disp(MAT)
end

//con estos ciclos conseguimos la X
for i = rowSize:-1:1
    suma = 0
    for j = i+1:rowSize
        suma = suma + MAT(i,j)*x(j)
    end
    x(i) = (MAT(i,colSize)-suma)/MAT(i,i)
end

disp(MAT)
endfunction

//Aqui pedimos la matriz
MAT= input("Dame una matriz")
//igualamos x con nuestra funcion que toma la matriz
x = Eliminacion(MAT)
//desplegamos x
disp(x)
