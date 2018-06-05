# Progress_bar function. 
# To use as a separate file: Should be added as a progress_bar.jl file in the same folder as your code. In the main code, use: include("progress_bar.jl");
# To use in Jupyter notebook, just include the funciton in a cell and run it. 

# Input arguments: 
# current_step = current position in the loop. Use the loop index.
# total_step = total number of steps in your loop. Note that it is assumed that the loop starts from 1 and ends at total_step.
# Nbar = how many blocks you want to include in the progress bar.


function progress_bar(current_step,total_step,Nblock)
    
    percentage = round(current_step*100/total_step,1);     # Calculate percentage completion
    
    print("\r") 
    if current_step == 1
        print("Progress = 0.0\% ");
        for i = 1:Nblock    
            print("\u2591");                      # Use the unicode character "light shade" to create the empty progress bar.
        end
        print("\r");
    end
    
    
    print("Progress = ",percentage, "\% ");         # Print percentage completion
   
    for i = 1:round(percentage*Nblock/100)        # Map the progress percentage to a 1 to Nblock grid.
        print("\u2593");                          # Use the unicode character "dark shade" to fill the progress bar.
    end

end
