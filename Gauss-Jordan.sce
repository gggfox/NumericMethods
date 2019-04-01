clear
clc
///////////////////////////////////////////////////////
//  Gauss-Jordan.sce
//
//   Nombre   Gerardo Galan Garzafox
//   Matricula   A00821196
//   21 / FEB  / 2019    version 1.0
//
//////////////////////////////////////////////////////


/////////////////////////////////////////////////////
//  funcion para factorial
//
//  Funcion que calcula el factorial de un numero
//
//  Parametros:
//      dFact     es el valor que se va multiplicar por todos los anteriores
//
//  Regresa
//      dFact     es el factorial que se obtiene con una funcion recursiva
/////////////////////////////////////////////////////
function dFact = Factorial(dFact)
    if (dFact <= 0) then dFact = 1 
    else
        dFact = dFact* Factorial(dFact-1)
    end
endfunction

/////////////////////////////////////////////////////
//  funcion para Serie de Maclaurin
//
//  Funcion que calcula el temino que se va a sumar a las demas iteraciones 
//
//  Parametros:
//      dI     es el valor actual de la iteracion va a ser el exponente de x
//              y su factorial nuestro denominador
//      dX      el coseno de esta variable es a la cual nos queremos aproximar
//      dSigno  Especifica el signo de la iteracion actual
//  Regresa
//      dSuma     es la ecuacion para la iteracion actual
/////////////////////////////////////////////////////
function dSuma = Maclaurin(dI,dX,dSigno)    
dSuma=(dSigno*dX^dI)/Factorial(dI)
endfunction

/////////////////////////////////////////////////////
//  funcion para Error Relacional
//
//  Funcion que calcula el Error Relacional, la diferencia entre el total,
//  Coseno de x y nuestra aproximacion
//
//  Parametros:
//      dX      el coseno de esta variable es a la cual nos queremos aproximar
//      dNuevo  Es la suma actual de nuestras iteraciones 
//  Regresa
//      dErrorRelacional     Es un porcentaje de 0 a 100
/////////////////////////////////////////////////////
function dErrorRelacional = ErrorReal(dX,dNuevo)
    dErrorRelacional=((cos(dX) - dNuevo) / cos(dX))* 100
    if dErrorRelacional < 0 then
        dErrorRelacional = dErrorRelacional* -1
    end
endfunction

/////////////////////////////////////////////////////
//  funcion para Error Aproximado
//
//  Funcion que calcula el Error Aproximado, la diferencia entre la iteracion //    anterior y la actual.
//
//  Parametros:
//      dViejo  Es nuestra iteracion previa 
//      dNuevo  Es la suma actual de nuestras iteraciones 
//  Regresa
//      dErrorAproximado     Es un porcentaje de 0 a 100
/////////////////////////////////////////////////////
function dErrorAproximado = ErrorAproximado(dNuevo,dViejo)
    dErrorAproximado = ((dNuevo - dViejo) / dNuevo)* 100
    if dErrorAproximado < 0 then
        dErrorAproximado = dErrorAproximado* -1
    end
endfunction
/////// Programa Principal

// pido los valores
MAT = input("Dame la matriz")
dX = input("dame el numero de renglones")
dY = input("dame el numero de columnas")
i = 1
pivote = A(i,i)
//valor inicial que incrementara de 2 en 2 hasta llegar a dN
dI=0

//valores para guardar la sumatoria previa y la actual
dNuevo=0
dViejo=0

//valor que va a cambiar el signo en nuestra serie de Maclaurin
dSigno=1

//verifica que dN sea par y positivo, de no serlo detiene el programa
if dN < 0||modulo(dN,2)~=0 then
    printf("El numero que escribiste es invalido")
    abort
end

// ciclo que despliega nuestra aproximacion utilizando 
//la serie de Maclaurin para cada iteracion
while(dI<=dN)  
dNuevo = Maclaurin(dI,dX,dSigno) + dViejo
disp(" n = " + string(dI) + "  suma = "+ string(dNuevo)+" Error Real rel% = "+string(ErrorReal(dX,dNuevo)))

//si hay un iteracion previa despliega el Error Aproximado
if dViejo ~= 0 then
    disp ("Error aprox rel% = " + string(ErrorAproximado(dNuevo,dViejo)))
end

//hace los cambios necesarios para la siguiente iteracion
if dI <= dN then
dI = dI + 2
dSigno = dSigno* -1
dViejo = dNuevo
end
end

