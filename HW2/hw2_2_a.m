clc
clear

x = input('Enter x of the Point:');
y = input('Enter y of the Point:');
T = input('Enter the Angel for rotation:');

rotated_point = rotate(x, y, T);

% original_x = 3;
% original_y = 4;
% rotation_angle = 45; % in degrees

function rotated_point = rotate(x, y, angle)
    % Convert angle to radians
    angle_radians = deg2rad(angle);
    
    % Defining the rotation matrix
    rotation_matrix = [cos(angle_radians), -sin(angle_radians); sin(angle_radians), cos(angle_radians)];
    
    % Create column vector for the input point
    point = [x; y];
    
    % Perform the rotation
    rotated_point = rotation_matrix * point;
    
    % Extract x and y coordinates of the rotated point
    rotated_x = rotated_point(1);
    rotated_y = rotated_point(2);
    
    % Plot the original point
    plot(x, y, 'o', 'MarkerSize', 12, 'MarkerFaceColor', 'b', 'DisplayName', 'Original Point');
    hold on;
    
    % Plot the rotated point
    plot(rotated_x, rotated_y, 'o', 'MarkerSize', 12, 'MarkerFaceColor', 'r', 'DisplayName', 'Rotated Point');
    
    
    % Plot lines connecting the points to the origin
    plot([0, x], [0, y], 'b--', 'LineWidth', 1.5, 'DisplayName', 'Original Line');
    plot([0, rotated_x], [0, rotated_y], 'r--', 'LineWidth', 1.5, 'DisplayName', 'Rotated Line');
    
    
    % Plot the origin (0, 0)
    plot(0, 0, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'black', 'DisplayName', 'Origin');
    
    axis equal;
    xlabel('X-axis');
    ylabel('Y-axis');
    legend;
    title('Rotation of a Point');
    grid on;
    
    % Return
    rotated_point = [rotated_x, rotated_y];
end



