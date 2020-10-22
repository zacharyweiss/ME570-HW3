%function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
%This function uses a given control field (@boxIvory2 plannerParameters.control)
%to implement a generic potential-based planner with step size @boxIvory2
%plannerParameters.epsilon, and evaluates the cost along the returned path. The
%planner must stop when either the number of steps given by @boxIvory2
%plannerParameters.NSteps is reached, or when the norm of the vector given by
%@boxIvory2 plannerParameters.control is less than $10^-3$ (equivalently,
%@boxIvory2 1e-3).
function [xPath,UPath]=potential_planner(xStart,world,potential,plannerParameters)
