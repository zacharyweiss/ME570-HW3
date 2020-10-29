%function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
%This function uses a given control field (@boxIvory2 plannerParameters.control)
%to implement a generic potential-based planner with step size @boxIvory2
%plannerParameters.epsilon, and evaluates the cost along the returned path. The
%planner must stop when either the number of steps given by @boxIvory2
%plannerParameters.NSteps is reached, or when the norm of the vector given by
%@boxIvory2 plannerParameters.control is less than $10^-3$ (equivalently,
%@boxIvory2 1e-3).
function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
    xPath = zeros(2, plannerParameters.NSteps);
    UPath = zeros(1, plannerParameters.NSteps);
    
    xPath(:,1) = xStart;
    UPath(:,1) = plannerParameters.U(xPath(:,1),world,potential);
    
    i = 1;
    finished = false;
    while(~finished)
        i = i + 1;
        xPath(:,i) = xPath(:,i-1) + plannerParameters.epsilon*plannerParameters.control(xPath(:,i-1),world,potential);
        UPath(:,i) = plannerParameters.U(xPath(:,i),world,potential);
        
        if (i>=plannerParameters.NSteps)
            finished = true;
        end
        if (xPath(:,i) == potential.xGoal)
            xPath(:,i+1:plannerParameters.NSteps)=NaN(2,plannerParameters.NSteps-(i+1));
            UPath(:,i+1:plannerParameters.NSteps)=NaN(2,plannerParameters.NSteps-(i+1));
            finished = true;
        end 
    end
end