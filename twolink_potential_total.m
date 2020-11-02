%function [UTheta]=twolink_potential_total(thetaEval,world,potential)
%Compute the potential $U$ pulled back through the kinematic map of the two-link
%manipulator, i.e., $U(  Wp_ eff(vec17E ))$, where $U$ is defined as in Question 
%q:total-potential, and $  Wp_ eff( )$ is the position of the end effector in the
%world frame as a function of the joint angles $vec17E = _1\\ _2$.
function [UTheta]=twolink_potential_total(thetaEval,world,potential)
    %twolinkPos = twolink_jacobianMatrix(thetaEval)';
    %[twolinkPos,~,~] = twolink_kinematicMap(theta);
    wRbone = rot2d(thetaEval(1));
    boneRbtwo = rot2d(thetaEval(2));
    vertexEffectorTransf = wRbone*boneRbtwo*[5; 0] + wRbone*[5; 0];
    %test comment
    
    potRepTot = 0;
    for iRep=1:size(world,2)
        potRepTot = potRepTot + potential_repulsiveSphere(vertexEffectorTransf,world(iRep));
    end
    
    UTheta = potential_attractive(vertexEffectorTransf,potential) + potential.repulsiveWeight*potRepTot;
end