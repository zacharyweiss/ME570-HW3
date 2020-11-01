%function [gradU]=potential_totalGrad(xEval,world,potential)
%Compute the gradient of the total potential, $ U= U_ attr+  @ @ _i U_ rep,i$,
%where $ $ is given by the variable  @x   potential.repulsiveWeight
function [gradU]=potential_totalGrad(xEval,world,potential)
    potRepGradTot = zeros(size(xEval,1),1);
    for i=1:size(world,2)
        potRepGradTot = potRepGradTot + potential_repulsiveSphereGrad(xEval,world(i));
    end
    
    gradU = potential_attractiveGrad(xEval,potential) - potential.repulsiveWeight.*potRepGradTot;

end