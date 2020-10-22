%function [dPointsSphere]=sphere_distance(sphere,points)
%Computes the signed distance between points and the sphere, while taking into
%account whether the sphere is hollow or filled in.
function [dPointsSphere]=sphere_distance(sphere,points)

%Remember that the radius of the sphere is negative for hollow spheres.
