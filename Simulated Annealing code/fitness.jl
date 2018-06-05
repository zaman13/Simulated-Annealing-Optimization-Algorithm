# Defining the fitness function
# It calls fopa.jl which returns the gain profile and some performance parameters

# The input of fitness is vector with first element corrsponding to L, second element corresponding to λ_p1, and third element corresponding to λ_p2
# Output of the fitness function is defined as weighted sum of bandwidth (BW), peak gain (Gpeak) and gain ripply (G_var)
function fitness(A,fnc)
    if fnc == "ackley"
        x = A[1];
        y = A[2];
        f = -20*exp(-0.2* ( 0.5*(x^2 + y^2) )^0.5 ) - exp( 0.5*( cos(2*pi*x) + cos(2*pi*y) )) + exp(1) + 20;  
        f = -f;
    end
    
    if fnc == "sphere"
        f = sum(A.^2);
        f = -f;
    end
    
    if fnc == "rosenbrock"
        D = length(A);
        sum = 0;
        for m = 1:D-1
            sum = sum + 100*(A[m+1]-A[m]^2)^2 + (1-A[m])^2;
        end
        f = -sum;
    end
    
        
    if fnc == "rastrigin"
        D = length(A);
        sum = 0;
        for m = 1:D
            sum = sum + A[m]^2 - 10*cos(2*pi*A[m])
        end
        f = -1*(sum + 10*D);
    end
    
    
    
    if fnc == "double_gaussian"
        x0 = 0.1;
        y0 = -0.2;
        z0 = 0.3;

        f1 = exp(-(A[1]-x0).^2 -(A[2]-y0).^2 -(A[3]-z0).^2);

        x0 = -0.2;
        y0 = 0.2;
        z0 = -0.1;

        f2 = exp(-(A[1]-x0).^2 -(A[2]-y0).^2 -(A[3]-z0).^2);
        f =f1 + 0.6*f2;
    end
    return f
end



# A = [.1 -.2 .3];     # test input 

# println("Testing the fitness function:")
# println("Test input = ", A)
# println("Fitness value = ", fitness(A))
