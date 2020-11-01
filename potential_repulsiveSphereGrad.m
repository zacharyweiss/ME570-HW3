%function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
%Compute the gradient of $U_ rep$ for a single sphere, as given by    @  ( 
%eq:repulsive-gradient \@@italiccorr ).
function [gradURep]=potential_repulsiveSphereGrad(xEval,sphere)
    gradURep = zeros(2,1);
    dist = sphere_distance(sphere,xEval);
    distGrad = sphere_distanceGrad(sphere,xEval);
    
    flagDistPositive = dist>0;
    gradURep(~flagDistPositive) = NaN;
    
    flagDistInfluence=dist<sphere.distInfluence;
    flagValid=flagDistPositive & flagDistInfluence;
    
    gradURep(:,flagValid) = -distGrad(:,flagValid).*(1./dist(flagValid)-1/sphere.distInfluence).*(1./(dist(flagValid).^2));
end
%This function must use the outputs of sphere_distanceGrad.
