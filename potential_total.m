%function [U]=potential_total(xEval,world,potential)
%Compute the function $U=U_ attr+  @ @ _iU_ rep,i$, where $ $ is given by the
%variable  @x   potential.repulsiveWeight
function [U]=potential_total(xEval,world,potential)
    potRepTot = 0;
    for i=1:size(world,2)
        potRepTot = potRepTot + potential_repulsiveSphere(xEval,world(i));
    end
    
    U = potential_attractive(xEval,potential) + potential.repulsiveWeight*potRepTot;
end