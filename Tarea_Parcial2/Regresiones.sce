clear

//Karyme Nahle Acosta A00823898
//Gerardo Galan Garzafox A00821196


function [a,b,c,r]=linear(X,Y,v)
    [n,m]=size(X);
    r=0;
    y=0;
    z=0;
    ymean=0;
    n=n*m;
    sumx = sum(X);
    sumy = sum(Y);
    sumxx = sum(X.*X);
    sumxy = sum(X.*Y);
    a=(sumx*sumy-n*sumxy)/(sumx*sumx-n*sumxx);
    b=(sumy-a*sumx)/n;
    for i=1:n   
        z=z+(Y(i)-(b+X(i)*a))*(Y(i)-(b+X(i)*a));
    end
    ymean=sum(Y)/n
    for i=1:n
        
        y=y+(Y(i)-ymean)*(Y(i)-ymean);
    end
    //coefficient of determination (r-squared))
    r=1-(z/y)//what percentage of total variation is described by the variation in x
    c=(b+a*v);
endfunction
function [a0,a1,r2]=exponential(X,Y)
    [n,m]=size(X);
    r2=0;
    SELine=0
    TVariance=0
    xlny=0
    ymean=0;
    n=n*m;
    sumx = sum(X);
    sumy = sum(Y);
    lny=sum(log(Y));
    for i=1:n
        xlny=xlny+log(Y(i))*X(i);
    end
    xsq=sum(X**2)
    sumxx = sum(X.*X);
    sumxy = sum(X.*Y);
    xmean=sumx/n;
    ymean=sumy/size(X);
    lnymean=lny/n;
    
    a1=(n*xlny-sumx*lny)/(n*xsq-sumx**2)
    a0=exp(lnymean-a1*xmean);
    sr=0
    st=0
    serr=0
    for i=1:n
        sr=sr+(Y(i)-a0*exp(a1*X(i)))**2
        st=st+(Y(i)-ymean)**2
    end
  
    disp(sr)
    disp(st)
    r2=((st-sr)/st)**(1/2)
    
    

endfunction


//pedimos los valores de X y de Y al usuario
UsrX=input(" Conjunto de valores de x: ")
UsrY=input(" Conjunto de valores de y: ")
Value=input ("Para que valor desea estimar?: ")
[a,b,c,r]=linear(UsrX,UsrY,Value)

disp("Lineal: y= "+string(b)+"+("+string(a)+") * x, r2= "+string(r));
[a0,a1,r2]=exponential(UsrX,UsrY)
disp("Exponential: y= "+string(a0)+" e^("+string(a1)+"*x), r2= "+string(r2))


