# Defining the fitness function
# It calls fopa.jl which returns the gain profile and some performance parameters

# The input of fitness is vector with first element corrsponding to L, second element corresponding to λ_p1, and third element corresponding to λ_p2
# Output of the fitness function is defined as weighted sum of bandwidth (BW), peak gain (Gpeak) and gain ripply (G_var)
function fitness(A)
    x0 = 0.1;
    y0 = -0.2;
    z0 = 0.3;
	
	f1 = exp(-(A[1]-x0).^2 -(A[2]-y0).^2 -(A[3]-z0).^2);
	
	x0 = -0.2;
    y0 = 0.2;
    z0 = -0.1;
	
	f2 = exp(-(A[1]-x0).^2 -(A[2]-y0).^2 -(A[3]-z0).^2);
	
    return f1 + 0.6*f2
end



# A = [.1 -.2 .3];     # test input 

# println("Testing the fitness function:")
# println("Test input = ", A)
# println("Fitness value = ", fitness(A))
