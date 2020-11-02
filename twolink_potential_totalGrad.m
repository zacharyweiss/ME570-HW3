%function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
%Compute the gradient of the potential $U$ pulled back through the kinematic map
%of the two-link manipulator, i.e., $ _vec17E  U(  Wp_ eff(vec17E ))$.
function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
    wRbone = rot2d(thetaEval(1));
    boneRbtwo = rot2d(thetaEval(2));
    vertexEffectorTransf = wRbone*boneRbtwo*[5; 0] + wRbone*[5; 0];
    jacobT = twolink_jacobianMatrix(thetaEval)';

    potRepGradTot = zeros(2,1);
    for iSphere=1:size(world,2)
        potRepGradTot = potRepGradTot + potential_repulsiveSphereGrad(vertexEffectorTransf,world(iSphere))*jacobT(2,:);
    end
    
    gradUTheta = potential_attractiveGrad(vertexEffectorTransf,potential) + potential.repulsiveWeight.*potRepGradTot;
end