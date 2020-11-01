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
    
    iStep = 1;
    finished = false;
    while ~finished
        iStep = iStep + 1;
        xPath(:,iStep) = xPath(:,iStep-1) + plannerParameters.epsilon*plannerParameters.control(xPath(:,iStep-1),world,potential);
        UPath(:,iStep) = plannerParameters.U(xPath(:,iStep),world,potential);
        
        if iStep>=plannerParameters.NSteps
            finished = true;
        end
        if xPath(:,iStep)==potential.xGoal
            xPath(:,iStep+1:plannerParameters.NSteps)=NaN(2,plannerParameters.NSteps-(iStep+1));
            UPath(:,iStep+1:plannerParameters.NSteps)=NaN(2,plannerParameters.NSteps-(iStep+1));
            finished = true;
        end 
    end
end