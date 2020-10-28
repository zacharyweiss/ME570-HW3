%function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
%Computes the gradient of the signed distance between points and the sphere,
%consistently with the definition of sphere_distance.
function [gradDPointsSphere]=sphere_distanceGrad(sphere,points)
    gradDPointsSphere = zeros(2, size(points,2));
    for i=1:size(points,2)
        if (sphere.xCenter == points(:,i))
            gradDPointsSphere(:,i) = zeros(2,1);
        else
            vecPCenter = sphere.xCenter' - points(:,i);
            dPCenter = sqrt((points(1,i)-sphere.xCenter(1))^2+(points(2,i)-sphere.xCenter(2))^2);
            gradDPointsSphere(:,i) = vecPCenter/dPCenter;
        end
    end
end