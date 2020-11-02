%function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
%Compute the gradient of the potential $U$ pulled back through the kinematic map
%of the two-link manipulator, i.e., $ _vec17E  U(  Wp_ eff(vec17E ))$.
function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
    twolinkPos = twolink_jacobianMatrix(thetaEval);

    potRepGradTot = zeros(size(thetaEval,1),1);
    for i=1:size(world,2)
        potRepGradTot = potRepGradTot + potential_repulsiveSphereGrad(twolinkPos(:,1),world(i));
    end
    
    gradUTheta = potential_attractiveGrad(twolinkPos(:,1),potential) + potential.repulsiveWeight.*potRepGradTot;
end