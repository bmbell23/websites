%% BRANDON BELL - MAE 4421 - HW5 - Q9
j=0; m=zeros(1e4,4); r=zeros(1e4,4);

for i=linspace(1,100,1e4)
    
    j = j+1;
    m(j,:) = roots([1 6 11 8 i]);

end

for i=1:10000
    for j=1:4
       if real(m(i,j))<= 0;
           r(i,j)=1;
       else
           r(i,j)=0;
       end 
    end
end
k=zeros(1e4,1);
for i=1:10000
    if sum(r(i,:))==4;
        k(i)=1; 
    else
        k(i)=0;
    end
end
K = sum(k)/100;

fprintf('Thus, the bounds are 0<K<%0.2f\n\n',K)
       
