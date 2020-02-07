function gaussianElimination(n)

    A = [];
    b = zeros(n, 1);
    for i = 1:n
        for j = 1:n
            printf("Enter the element %d %d", i, j);
            A(i, j) = input("enter element: ");
        end 
    end
    
    for j = 1:n
     printf("Enter the corresponding constant matrix element %d", j);
        b(j, 1) = input("Enter element: ");
    end
    
A_aug = [A b];
l = A_aug;

for i=2:n
    for j =2:n+1
        l(i, j) = l(i, j) - l(1, j)*l(i, 1)/l(1,1);
end
l(i, 1) = 0;
end

for i=3:n
    for j=3:n+1
        l(i,j) = l(i,j)-l(2,j)*l(i,2)/l(2,2);
    end
    l(i,2)=0;
end

z(n)=l(n,n+1)/l(n,n);
for i=n-1:-1:1
    sumk=0;
    for k=i+1:n
    sumk=sumk+l(i,k)*z(k);
    end
z(i) = (l(i,n+1)-sumk)/l(i,i);
end

for i = 1:n
    printf("variable%d = %d\n", i, z(i));
    printf("Pivot of row %d = %d\n", i, l(i,i));
end
endfunction

n=input("Enter size: ");
gaussianElimination(n)
