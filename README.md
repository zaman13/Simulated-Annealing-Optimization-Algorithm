# Simulated-Annealing-Optimization-Algorithm
Julia code for general simulated annealing optimization algorithm. The code can find the global maximum (or minimum) of a multi-modal function of continuous variables.

# Reference
The code is based upon the algorithm presented in the paper: 
Corana, Angelo, Michele Marchesi, Claudio Martini, and Sandro Ridella. "Minimizing multimodal functions of continuous variables with the “simulated annealing” algorithm Corrigenda for this article is available here." ACM Transactions on Mathematical Software (TOMS) 13, no. 3 (1987): 262-280.

# Use
The code is general and can be applied to optimization problems with arbitrary number of parameters. The number of optimizing parameters is referred to as the dimension of the optmization space (represented by the variable "D" in the code). To use the code, the dimension and the bounds of the optimization space must be defined. This is accomplished at the beginning of the code:

``` julia
D = 5;                       # Dimension of the test fitness function.
bL = -5.12*ones(D,1);        # lower limit of the parameters for the optimization
bU = 5.12*ones(D,1);         # Upper limit of the parameters for the optimization
```
In the above example, the bounds are set to be equal in all dimensions. However, this is not necessary. The code will work with general bounds. For example:

``` julia
bL = [-3 -4.5 -5 -2.4 0];
bU = [4 0 2 3.1 6];
```
A algorithm maximizes the function fitness.jl. A set of benchmark functions are implemented in the fitness.jl file present in the repository. The user can use his/her own fitness function. The output of the fitness function needs to be a single scalar value. For a custom fitness function, very little adjustments are necessary in the main optimization code. Only the dimension (D) and the bounds (the arrays bL and bU) must be adjusted based on the fitness function. The code should work fine without any furhter modifications.

The behavior of the optimization algorithm is determined by the following parameters in the code:

``` julia           
gmax = 1000;               # Maximum number of generations (max iteration number)
Ns = 20;                   # tests for step variation
NT = 100;                  # tests for temperature reduction
rT = 0.85;                 # reduction coefficient
ci = 2;                    # varying criterion
```
The default parameter values are taken from literature. The user can tweak these values based on their fitness function chracteristics. 

## Two step optimization
The results of the optmization algorithm can be refined by running it a second time. The output of the first optimizaiton step is set as initial condition of the second step. In the jupyter notebook, the two step process can be implemented by running the main optimization loop twice. The initial condition will be adjused automatically. 


# Sample Output
Rastrigin function with D = 3. Results after 2 step optimization. The exact solution is [0, 0, 0] with function value = 0.

```julia
Progress = 100.0% ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
elapsed time: 10.424191605 seconds 
Optimized parameters = [-2.29578e-9, 1.0972e-9, -4.77537e-10]
Final fitness value = -0.0
```
