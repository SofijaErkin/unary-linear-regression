function plottingData(x, y)

%PLOTDATA Plots the data points x and y into a new figure 

%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

figure('name','Observations'); 
% open a new figure window

plot(x,y,'rx','MarkerSize',8); 
%plot the data

ylabel('Profit in House in $ 100k');   
%set the y-axis label

xlabel('Population of City in 10k');
%set the x-axis label

title('data_Analytics.txt');

% ============================================================
end
