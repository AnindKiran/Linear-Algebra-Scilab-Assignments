clc;

function gaussJordan(n, A)

    Aug = [A, eye(n,n)];
    
    //forward elimination
    for j=1:n-1
        for i=j+1:n
            Aug(i,j:2*n) = Aug(i,j:2*n) - Aug(i,j)/Aug(j,j)*Aug(j,j:2*n)
        end
    end
    
    //backward elimination
    for j=n:-1:2
            Aug(1:j-1,:) = Aug(1:j-1,:) - Aug(1:j-1,j)/Aug(j,j)*Aug(j,:)
    end
    
    //Diagonal Normalization
    for j=1:n
        Aug(j,:) = Aug(j,:) / Aug(j,j);
    end
    
    A_inverse = Aug(:,n+1:2*n);
    disp(A_inverse,'The Inverse of A is ');
endfunction

//Alternate Gauss_Jordan Function involves using some dummy matrices. 

function gauss_jordan_inverse_alternate(n, A)
    Aug = [A, eye(n,n)];
    N = 1: n;
    for i=1: n
        dummy1 = N;
        dummy1(i) = [];
        index(i,:) = dummy1;
    end
    
    
// This for loop performs the Forward Elimination
    for j = 1:n
        [dummy12, t] = max(abs(Aug(j:n,j)));
        lrow = t+j-1;
        Aug([j,lrow],:) = Aug([lrow,j],:);
        Aug(j,:) = Aug(j,:)/Aug(j,j);
        for i=index(j,:)
            Aug(i,:) = Aug(i,:) - Aug(i,j)/Aug(j,j)*Aug(j,:);
        end
    end
    A_inverse = Aug(:,n+1:2*n);
    disp(A_inverse,'A inverse: ');
endfunction



n=input("Enter size: ");

A = [];
for i = 1:n
    for j = 1:n
        printf("Enter the element %d %d", i, j);
        A(i, j) = input("enter element: ");
    end 
end
    
gaussJordan(n, A)
gauss_jordan_inverse_alternate(n, A)
