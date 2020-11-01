%function [dPointsSphere]=sphere_distance(sphere,points)
%Computes the signed distance between points and the sphere, while taking into
%account whether the sphere is hollow or filled in.
function [dPointsSphere]=sphere_distance(sphere,points)
    dPointsSphere = zeros(1, size(points,2));
    for iPts=1:size(points,2)
        dPCenter = sqrt((points(1,iPts)-sphere.xCenter(1))^2+(points(2,iPts)-sphere.xCenter(2))^2);
        dPointsSphere(iPts) = dPCenter - abs(sphere.radius);
        if sphere.radius<0
            dPointsSphere(iPts) = dPointsSphere(iPts)*(-1); 
        end
    end
end
%Remember that the radius of the sphere is negative for hollow spheres.
