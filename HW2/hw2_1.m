clc
clear

% x = input('Enter x of the end-effector:');
% y = input('Enter y of the end-effector:');
% alpha = input('Enter alpha of the end-effector:');

a1 = input('Enter a1:');
a2 = input('Enter a2:');
a3 = input('Enter a3:');

% q1 = None;
% q2 = None;
% q3 = None;


% T03 = ([
% [cos(q1 + q2 + q3), -sin(q1 + q2 + q3), 0, a1*cos(q1) + a2*cos(q1 + q2) + a3*cos(q1 + q2 + q3)];
% [sin(q1 + q2 + q3),  cos(q1 + q2 + q3), 0, a1*sin(q1) + a2*sin(q1 + q2) + a3*sin(q1 + q2 + q3)];
% [                0,                  0, 1,                                                0];
% [                0,                  0, 0,                                                1]]);


%case_1 = [1 0 0 9; 0 1 0 0; 0 0 1 0; 0 0 0 1];
 case_1 = [0.5 -0.866 0 7.5373; 0.866 0.6 0 3.9266; 0 0 1 0; 0 0 0 1];
% case_1 = [0 1 0 -3; -1 0 0 2; 0 0 1 0; 0 0 0 1];
% case_1 = [0.866 0.5 0 -3.1245; -0.5 0.866 0 9.1674; 0 0 1 0; 0 0 0 1];


wrist_frame_transform = [1 0 0 a3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
wrist_frame = case_1/wrist_frame_transform;
c_alpha = wrist_frame(1,1);
s_alpha = wrist_frame(2,1);
x = wrist_frame(1,1);
y = wrist_frame(2,4);

c2 = (x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2);


%the solution only exists when the cosine is between -1 and 1
if (abs(c2)) < 1
    s2 = sqrt(1-c2^2);
    
    % we have 2 answers for theta2
    theta2 = [atan2(s2,c2) atan2(-s2, c2)];
    
    % with comparing 2 matrixes we will have these equations for theta1
    k1 = a1 + a2*c2;
    k2 = a2*s2;
    theta1 = [(atan2(y,x) - atan2(k2,k1)) (atan2(y,x) - atan2(-k2,k1))];
    
    % calculating theta 3 from the robot
    alpha = atan2(s_alpha, c_alpha);
    theta3 = alpha - theta1 - theta2;

    fprintf('theta1 = %3.3f, \t%3.3f\n', rad2deg(theta1));
    fprintf('theta2 = %3.3f, \t%3.3f\n', rad2deg(theta2));
    fprintf('theta3 = %3.3f, \t%3.3f\n', rad2deg(theta3));
    
else
    fprintf('The goal is outside of the workspace');
    return;
    
end

