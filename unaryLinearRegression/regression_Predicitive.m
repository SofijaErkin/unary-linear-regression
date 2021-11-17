%%  Plotting 
fprintf('      Plotting data ...\n')
data = load('data_Analytics.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples
 
% Plot Data
% Note: You have to complete the code in plotData.m
plottingData(X, y);
 
fprintf('Program paused. Press any to continue.\n');
pause;

%% Gradient descent 
fprintf('    Running gradient descent ...')
 
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters
 
% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
fprintf('        Initial cost')
computeCost(X, y, theta)
fprintf('Press any key to continue.\n');
pause;

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);
disp(['    theta0=',num2str(theta(1)),'   theta1=',num2str(theta(2))]);
disp('Press any key to continue');
pause;

hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
fprintf('    Keep previous plot visible...\n')
hold off % don't overlay any more plots on this figure
fprintf('Program paused. Press any to continue.\n');
pause;

%% Visualizing J(theta_0, theta_1) 
fprintf('Visualizing J(theta_0, theta_1) ...\n')
 
% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
 
% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));
 
% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
      t = [theta0_vals(i); theta1_vals(j)];    
      J_vals(i,j) = computeCost(X, y, t);
    end
end

% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
fprintf('       Surface plot...\n')
figure('name','Surface plot');;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
fprintf('Press any key to continue\n');
pause;

% Contour plot
fprintf('       Contour plot...\n');
figure('name','Contour plot');;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
fprintf('Press any key to continue\n');
pause;

% Forecasting the urban population with a price of 40,000 and 80,000
predict1=[1 4]*theta;
predict2=[1 8]*theta;
predict3=[1 10]*theta;
predict4=[1 12]*theta;
predict5=[1 15]*theta;
predict6=[1 20]*theta;
predict7=[1 30]*theta;
predict8=[1 40]*theta;
predict9=[1 50]*theta;
predict10=[1 100]*theta;
fprintf('      Regression predicitive...\n')
fprintf('Population(10k)  House ($100k)\n')
disp(['      4            ',num2str(predict1)]);
disp(['      8            ',num2str(predict2)]);
disp(['      10           ',num2str(predict3)]);
disp(['      12           ',num2str(predict4)]);
disp(['      15           ',num2str(predict5)]);
disp(['      20           ',num2str(predict6)]);
disp(['      30           ',num2str(predict7)]);
disp(['      40           ',num2str(predict8)]);
disp(['      50           ',num2str(predict9)]);
disp(['      100         ',num2str(predict10)]);
disp('Program paused. Press any to continue.');
pause;
