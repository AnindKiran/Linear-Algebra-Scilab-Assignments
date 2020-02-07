funcprot(0);

function LU(n)
    A = [];
    b = zeros(n, 1);
    for i = 1:n
        for j = 1:n
            printf("Enter the element %d %d", i, j);
            A(i, j) = input("enter element: ");
        end 
    end
    
    U = A
    disp(A,"The given matrix is A = ");
    m = det(U(1,1)); 
    n = det(U(2,1));
    a = n/m;
    
    U(2,:) = U(2,:) - U(1,:)/(m/n);
    n= det(U(3,1));
    b = n/m;
    
    U(3,:) = U(3,:) - U(1,:)/(m/n);
    m = det(U(2,2));
    n = det(U(3,2));
    c = n/m;
    
    U(3,:) = U(3,:) - U(2,:)/(m/n);
    disp(U,'Displaying the upper triangular matrix U = ');
    
    L = [1,0,0;a,1,0;b,c,1];
    disp(L,'Displaying the lower triangular matrix L = ');

endfunction



n=input("Enter size: ");
LU(n);
