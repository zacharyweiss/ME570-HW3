%function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
%Compute the gradient of the potential $U$ pulled back through the kinematic map
%of the two-link manipulator, i.e., $ _vec17E  U(  Wp_ eff(vec17E ))$.
function [gradUTheta]=twolink_potential_totalGrad(thetaEval,world,potential)
    wRbone = rot2d(thetaEval(1));
    boneRbtwo = rot2d(thetaEval(2));
    vertexEffectorTransf = wRbone*boneRbtwo*[5; 0] + wRbone*[5; 0];
    jacob = twolink_jacobianMatrix(thetaEval);
    xDot = [1/2;1/2];

    potRepGradTot = zeros(2,1);
    for iSphere=1:size(world,2)
        gradUPullback = potential_repulsiveSphereGrad(vertexEffectorTransf,world(iSphere))'*jacob*xDot;
        potRepGradTot = potRepGradTot + gradUPullback;
    end
    
    gradUTheta = potential_attractiveGrad(vertexEffectorTransf,potential)'*jacob*xDot + potential.repulsiveWeight.*potRepGradTot;
end