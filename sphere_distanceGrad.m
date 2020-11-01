%function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
%Computes the gradient of the signed distance between points and the sphere,
%consistently with the definition of sphere_distance.
function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
    gradDPointsSphere = zeros(size(points));
    for iPts=1:size(points,2)
        if sphere.xCenter == points(:,iPts)
            gradDPointsSphere(:,iPts) = zeros(2,1);
        else
            vecPCenter = sphere.xCenter - points(:,iPts);
            dPCenter = sqrt((points(1,iPts)-sphere.xCenter(1))^2+(points(2,iPts)-sphere.xCenter(2))^2);
            gradDPointsSphere(:,iPts) = vecPCenter/dPCenter;
        end
    end
end