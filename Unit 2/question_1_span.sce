clc
funcprot(0)   //if variables are redefined do nothing
format('v',10)
mat = input("Enter a matrix: ")

function col_space(mat)
    
    disp(mat,"The given matrix is mat = ")
    
    mat(2,:) = mat(2,:) - (mat(2,1)/mat(1,1))*mat(1,:)
    mat(3,:) = mat(3,:) - (mat(3,1)/mat(1,1))*mat(1,:)
    disp(mat)
    
    
    mat(3,:) = mat(3,:) - (mat(3,2)/mat(2,2))*mat(2,:)
    disp(mat)
    
    
    mat(1,:) = mat(1,:)/mat(1,1)
    mat(2,:) = mat(2,:)/mat(2,2)
    disp(mat,"Row Reduced form = ")
    
    // Size gets the columsn and rows of the matrix
    [m, n] = size(mat)
    for i=1:m
        for j=i:n
            if(mat(i,j)<>0)
                disp('is a pivot column',j,'column')
                break
            end
        end
    end
        
endfunction
