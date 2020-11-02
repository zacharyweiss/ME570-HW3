%function [Jtheta]=twolink_jacobianMatrix(theta)
%Compute the matrix representation of the Jacobian of the position of the end
%effector with respect to the joint angles as derived in Question 
%q:jacobian-matrix.
function [Jtheta]=twolink_jacobianMatrix(theta)
    jOne = -5*sin(theta(1))-5*cos(theta(1))*sin(theta(2))-5*cos(theta(2))*sin(theta(1));
    jTwo = -5*cos(theta(1))*sin(theta(2))-5*cos(theta(2))*sin(theta(1));
    jThree = 5*cos(theta(1))+5*cos(theta(1))*cos(theta(2))-5*sin(theta(1))*sin(theta(2));
    jFour = 5*cos(theta(1))*cos(theta(2))-5*sin(theta(1))*sin(theta(2));

    Jtheta = [jOne jTwo;jThree jFour];
end