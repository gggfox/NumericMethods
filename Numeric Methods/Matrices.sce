


//MAT=[1, 2, 3, 1; 4, 5, 6, -2; 7, 8, 10, 5]
//variables para el tamano de las columna y filas 

function m = GaussJordan(MAT)
//iniciamos la funcion
    m = 0
//conseguimos los tamaños para filas y columnas
rowSize = size(MAT,1)
colSize = size(MAT,2)


for i = 1: rowSize
   
     pivote = MAT(i,i)
     for j = 1: colSize
         m(i,j) = MAT(i,j) / pivote  
     end 
     
     for k = 1: rowSize
         
        if i <> k then
            fact = -MAT(k,i)
             for j = 1: colSize
                 MAT(k,j) = MAT(k,j) + fact * MAT(i,j)
             end
        end
     end
     disp(m)
end
     for x=1:rowSize
         X(x,1) = m(x, colSize)
     end
     disp(X)
endfunction

MAT = input("dame una matriz")
X=GaussJordan(MAT)
disp(X)
