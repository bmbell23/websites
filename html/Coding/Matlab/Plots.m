
j=0;
for i = [18 10 0] 
    
    j = j+1 ;
    
    den = [1 i 36];
    num = 1;
    
    TF = tf(num,den);
    
    figure(j)
    step(TF)
    xlim([0,2])
    
end