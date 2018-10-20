function [X]=myidft2(F)
[R,C]=size(F);
X=zeros(R,C);
for u=1:R
    for y= 1:C
        for v=1:C
            X(u,y)= X(u,y)+F(u,v)*exp(2*pi*v*y*j);
        end
    end
end

for y=1:C
    for x=1:R
        for u=1:R
            X(x,y)=X(x,y)+X(u,y)*exp(2*pi*u*x*j); 
        end
    end
end

end
