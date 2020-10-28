%function [dPointsSphere]=sphere_distance(sphere,points)
%Computes the signed distance between points and the sphere, while taking into
%account whether the sphere is hollow or filled in.
function [dPointsSphere]=sphere_distance(sphere,points)
    dPointsSphere = zeros(1, size(points,2));
    for i=1:size(points,2)
        dPCenter = sqrt((points(1,i)-sphere.xCenter(1))^2+(points(2,i)-sphere.xCenter(2))^2);
        dPointsSphere(i) = dPCenter - abs(sphere.radius);
        if (sphere.radius<0); dPointsSphere(i) = dPointsSphere(i)*(-1); end
    end
end
%Remember that the radius of the sphere is negative for hollow spheres.
