clc
clear

x = input('Enter x of the Point:');
y = input('Enter y of the Point:');
T = input('Enter the Angel for rotation:');
a = input('Enter a of the line ax+by+c=0:');
b = input('Enter b of the line ax+by+c=0:');
c = input('Enter c of the line ax+by+c=0:');

rotated_point = rotate_around_line(a, b, c, x, y, T);

function rotated_point = rotate_around_line(a, b, c, x, y, angle)
    % Parameters of the line equation: ax + by + c = 0
    
    % Original point coordinates
    original_point = [x; y];
    
    % Translate the coordinate system to make the line pass through the origin
    translated_x = x - (a * (a*x + b*y + c)) / (a^2 + b^2);
    translated_y = y - (b * (a*x + b*y + c)) / (a^2 + b^2);
    
    % Convert angle to radians
    rotation_angle = deg2rad(angle);
    
    % Perform the rotation
    rotated_translated_x = translated_x * cos(rotation_angle) - translated_y * sin(rotation_angle);
    rotated_translated_y = translated_x * sin(rotation_angle) + translated_y * cos(rotation_angle);
    
    % Translate back to the original coordinate system
    rotated_point = [rotated_translated_x + (a * (a*x + b*y + c)) / (a^2 + b^2);
                     rotated_translated_y + (b * (a*x + b*y + c)) / (a^2 + b^2)];
    
    % Plot the original point
    plot(original_point(1), original_point(2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'DisplayName', 'Original Point');
    hold on;
    
    % Plot the rotated point
    plot(rotated_point(1), rotated_point(2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r', 'DisplayName', 'Rotated Point');
    
    % Plot the line
    xlim = get(gca, 'XLim');
    ylim = get(gca, 'YLim');
    x_vals = xlim(1):0.1:xlim(2);
    y_vals = (-a * x_vals - c) / b;
    plot(x_vals, y_vals, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Line');
    
    axis equal;
    xlabel('X-axis');
    ylabel('Y-axis');
    legend;
    title('Rotation of a Point around a Line');
    grid on;
end
