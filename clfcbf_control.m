%function [uOpt]=clfcbf_control(xEval,world,potential)
%Compute $u^*$ according to    @  (  eq:clfcbf-qp \@@italiccorr ), where $m$ is
%given by the variable @boxIvory2 potential.repulsiveWeight
function [uOpt]=clfcbf_control(xEval,world,potential)

%This function should use qp_minEffortFix from Question~ q:minEffortFix, by
%building $A_ attr$, $b_ attr$ according to $ $ in    @  (  eq:CLF \@@italiccorr
%), $A_ barrier$, $b_ barrier$ according to $ $ in    @  (  eq:CBF \@@italiccorr
%).
