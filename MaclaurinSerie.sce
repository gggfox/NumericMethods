clear
clc
///////////////////////////////////////////////////////
//  MaclaurinSerie.sce
//
//   Nombre   Gerardo Galan Garzafox
//   Matricula   A00821196
//   24 / ENE  / 2019    version 1.0
//
//     cos x = 1 - x 2 / 2 ! + x 4 / 4 ! - x 6 / 6 ! + x 8 / 8 ! ......
//
//  Utilizando la serie de arriba aproxima el valor del coseno de una x 
//  dada para una serie de términos dado
//
//  El programa debe pedir "x" y "n" el valor del exponente hasta el cual 
//  se quiere sumar
//
//  El programa debe validar que la n sea positiva y par, en caso contrario
//  no podrá realizar la suma y deberá desplegar error
//
//  La sumatoria aproxima el valor del coseno del número x.
//
//  El programa debe desplegar el error real  relativo % en cada aproximación
//  y debe desplegar el error aproximado relativo % a partir de la segunda 
//  aproximación
//
//////////////////////////////////////////////////////

//////////////////////////////////////////////////////
//  
//                  Ejemplos:
//
//para x = .5 y n = 2
//
//n = 0  suma = 1.0  Error Real rel % = 13.9494
//n = 2  suma = 0.875  Error Real rel % = 0.2943  Error aprox rel % = 14.2857
//
// 
//para x = .5 y n = 4
//
//n = 0  suma = 1.0  Error Real rel % = 13.9494
//n = 2  suma = 0.875  Error Real rel % = 0.2943   Error aprox rel % = 14.2857
//n = 4  suma = 0.8776  Error Real rel % = 0.0025  Error aprox rel % = 0.2967
//
/////////////////////////////////////////////////////

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
dN = input("Dame la n de la funcion")
dX = input("Dame la x de la funcion")

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

