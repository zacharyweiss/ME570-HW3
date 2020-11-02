%function [uOpt]=clfcbf_control(xEval,world,potential)
%Compute $u^*$ according to    @  (  eq:clfcbf-qp \@@italiccorr ), where $m$ is
%given by the variable @boxIvory2 potential.repulsiveWeight
function [uOpt]=clfcbf_control(xEval,world,potential)
    UAttr = potential_attractive(xEval,potential);
    gradUAttr = potential_attractiveGrad(xEval,potential);
    
    gradDPointsSphere = zeros(2,size(world,2));
    dPointsSphere = zeros(1,size(world,2));
    for iSphere = 1:size(world,2)
        gradDPointsSphere(:,iSphere) = sphere_distanceGrad(world(1,iSphere),xEval);
        dPointsSphere(iSphere) = sphere_distance(world(1,iSphere),xEval);
    end
    
    [uOpt,~] = qp_minEffortFix(gradUAttr',UAttr,-gradDPointsSphere',-dPointsSphere',potential.repulsiveWeight);
end
%This function should use qp_minEffortFix from Question~ q:minEffortFix, by
%building $A_ attr$, $b_ attr$ according to $ $ in    @  (  eq:CLF \@@italiccorr
%), $A_ barrier$, $b_ barrier$ according to $ $ in    @  (  eq:CBF \@@italiccorr
%).
