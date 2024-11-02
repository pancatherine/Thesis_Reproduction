%% introduction
% 
% Paper reproduction
%               @By Yanting
clear;
close all;

function plot_UAV_connections(uav_positions, bs_positions, ue_positions, c_U, c_F, area_size)
    % Plot positions and connections in the UAV network
    % 
    % Inputs:
    %   uav_positions: (N x 2) matrix of UAV coordinates
    %   bs_positions: (F x 2) matrix of BS coordinates
    %   ue_positions: (M x 2) matrix of UE coordinates
    %   c_U: (N x N) matrix for UAV-to-UAV connections (1 for active, 0 for inactive)
    %   c_F: (F x N) matrix for BS-to-UAV connections (1 for active, 0 for inactive)
    %   b_U: (N x M) matrix for UAV-to-UE connections (1 for active, 0 for inactive)
    %   b_F: (F x M) matrix for BS-to-UE connections (1 for active, 0 for inactive)
    %   area_size: Scalar defining the area size for plot boundaries
    
    % Set up the plot
    figure;
    hold on;
    axis([0 area_size 0 area_size]);
    title('UAV-BS UAV-UAV Network Connections');
    xlabel('X Position');
    ylabel('Y Position');
    
    % Plot base stations
    scatter(bs_positions(:, 1), bs_positions(:, 2), 100, 's', 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
    text(bs_positions(:, 1), bs_positions(:, 2), 'BS', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    % Plot UAVs
    scatter(uav_positions(:, 1), uav_positions(:, 2), 80, 'd', 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g');
    text(uav_positions(:, 1), uav_positions(:, 2), 'UAV', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    % Plot UEs
    scatter(ue_positions(:, 1), ue_positions(:, 2), 50, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
    text(ue_positions(:, 1), ue_positions(:, 2), 'UE', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    % Plot UAV-to-UAV connections
    N = size(uav_positions, 1);
    for i = 1:N
        for j = i+1:N
            if c_U(i, j) == 1
                plot([uav_positions(i, 1), uav_positions(j, 1)], [uav_positions(i, 2), uav_positions(j, 2)], 'g-', 'LineWidth', 1.5); % Active UAV-to-UAV connection
               
            else
                plot([uav_positions(i, 1), uav_positions(j, 1)], [uav_positions(i, 2), uav_positions(j, 2)], 'g--', 'LineWidth', 1); % Inactive UAV-to-UAV connection
     
            end
        end
    end
    
    % Plot BS-to-UAV connections
    F = size(bs_positions, 1);
    for i = 1:F
        for j = 1:N
            if c_F(i, j) == 1
                plot([bs_positions(i, 1), uav_positions(j, 1)], [bs_positions(i, 2), uav_positions(j, 2)], 'b-', 'LineWidth', 1.5); % Active BS-to-UAV connection
            else
                plot([bs_positions(i, 1), uav_positions(j, 1)], [bs_positions(i, 2), uav_positions(j, 2)], 'b--', 'LineWidth', 1); % Inactive BS-to-UAV connection
            end
        end
    end
    
    
    % % Legend
    % legend({'Base Stations', 'UAVs', 'UEs', 'Active UAV-to-UAV', 'Inactive UAV-to-UAV', 'Active BS-to-UAV', 'Inactive BS-to-UAV'}, ...
    %        'Location', 'bestoutside');
    
    hold off;
end



function plot_UE_network_connections(uav_positions, bs_positions, ue_positions, b_U, b_F, area_size)
    % Plot positions and connections in the UAV network
    % 
    % Inputs:
    %   uav_positions: (N x 2) matrix of UAV coordinates
    %   bs_positions: (F x 2) matrix of BS coordinates
    %   ue_positions: (M x 2) matrix of UE coordinates
    %   c_U: (N x N) matrix for UAV-to-UAV connections (1 for active, 0 for inactive)
    %   c_F: (F x N) matrix for BS-to-UAV connections (1 for active, 0 for inactive)
    %   b_U: (N x M) matrix for UAV-to-UE connections (1 for active, 0 for inactive)
    %   b_F: (F x M) matrix for BS-to-UE connections (1 for active, 0 for inactive)
    %   area_size: Scalar defining the area size for plot boundaries
    
    % Set up the plot
    figure;
    hold on;
    axis([0 area_size 0 area_size]);
    title('BS-UE UAV-UE Network Connections');
    xlabel('X Position');
    ylabel('Y Position');
    
    % Plot base stations
    scatter(bs_positions(:, 1), bs_positions(:, 2), 100, 's', 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
    text(bs_positions(:, 1), bs_positions(:, 2), 'BS', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    % Plot UAVs
    scatter(uav_positions(:, 1), uav_positions(:, 2), 80, 'd', 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g');
    text(uav_positions(:, 1), uav_positions(:, 2), 'UAV', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    % Plot UEs
    scatter(ue_positions(:, 1), ue_positions(:, 2), 50, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
    text(ue_positions(:, 1), ue_positions(:, 2), 'UE', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    
    
    % Plot BS-to-UE connections
    M = size(ue_positions, 1);
    F = size(bs_positions, 1);
    N = size(uav_positions, 1);
    for i = 1:F
        for k = 1:M
            if b_F(i, k) == 1
                plot([bs_positions(i, 1), ue_positions(k, 1)], [bs_positions(i, 2), ue_positions(k, 2)], 'b-', 'LineWidth', 1.5); % Active BS-to-UE connection
            end
        end
    end
    
    % Plot UAV-to-UE connections
    for j = 1:N
        for k = 1:M
            if b_U(j, k) == 1
                plot([uav_positions(j, 1), ue_positions(k, 1)], [uav_positions(j, 2), ue_positions(k, 2)], 'g-', 'LineWidth', 1.5); % Active UAV-to-UE connection
            end
        end
    end
    
    % % Legend
    % legend({'Base Stations', 'UAVs', 'UEs', 'Active BS-to-UE', 'Active UAV-to-UE'}, ...
    %        'Location', 'bestoutside');
    % 
    hold off;
end




%% Algorithm 1 Initialization

% Parameters
N = 2; % Number of UAVs (example)
F = 1;  % Number of BSs (example)
M = 4; % Number of UEs (example)
Rc = 100; % Communication range threshold
Rt = 50; % Maximum coverage radius for UAVs
sqrt3Rt = sqrt(3) * Rt;

% Initialize variables
a = ones(N, 1);        % State of each UAV (1 = active, 0 = idle)
U_r = 1:N;             % Set of candidate UAVs for possible deletion
U_f = [];              % Set of idle UAVs that cannot be deleted

% Initialize connection matrices
c_U = zeros(N, N);     % Single-hop connection matrix among UAVs
c_F = zeros(F, N);     % Single-hop connection matrix between BSs and UAVs

% Random positions for demonstration (assuming a 2D plane for simplicity)
uav_positions = rand(N, 2) * 200; % Positions of UAVs (e.g., in a 500x500 area)
bs_positions = rand(F, 2) * 200;  % Positions of BSs
ue_positions = rand(M, 2) * 200;  % Positions of UEs


% Calculate distances and populate connection matrices
for i = 1:N

     % Distance between UAV i and UAV j
    for j = 1:N
        if i ~= j
            dist_UU = norm(uav_positions(i, :) - uav_positions(j, :)); % Distance between UAV i and UAV j
            if dist_UU <= Rc
                c_U(i, j) = 1; % Set connection if within communication range
            end
        end
    end

    % Distance between BS l and UAV i
    for l = 1:F
        dist_FB = norm(bs_positions(l, :) - uav_positions(i, :)); % Distance between BS l and UAV i
        if dist_FB <= Rc
            c_F(l, i) = 1; % Set connection if within communication range
        end
    end
end

% Plotting
area_size = 200;
plot_UAV_connections(uav_positions, bs_positions, ue_positions, c_U, c_F, area_size)





%% 
% Algorithm 2 Build/Update Connection Graphs

% Parameters

% Const for pathloss
f0 = 2e9; % Carrier frequency in Hz (example: 2 GHz)
c = 3e8; % Speed of light in m/s

% Const for connection
SINR_threshold = 1;  % SINR threshold for connection
ph = 0.1;             % Transmission power for UAVs
pf = 0.2;             % Transmission power for BSs
N0 = 1e-3;            % Noise power

alpha = 1; % ??
beta = 2; % ??
eta_LoS = 0.1; % ??
eta_NLoS = 0.2; % ??

height_UAV = 10; 
height_BS = 5; 

% Association matrices and degrees from Algorithm 1 (assumed initialized)
b_U = zeros(N, M);    % Association between UAVs and UEs
b_F = zeros(F, M);    % Association between BSs and UEs

zeta_u = zeros(N, 1); % Degree of each UAV (number of UEs connected to each UAV)
zeta_f = zeros(F, 1); % Degree of each BS (number of UEs connected to each BS)

xi_u = zeros(M, 1);   % Degree of each UE - UAVs
xi_f = zeros(M, 1);   % Degree of each UE - BSs
xi = zeros(M, 1);     % Total degree of each UE

% Distances between UAVs and UEs, BSs and UEs (example calculation)
uav_ue_distances = pdist2(uav_positions, ue_positions); % N x M matrix
bs_ue_distances = pdist2(bs_positions, ue_positions);   % F x M matrix

% Calculate the elevation angle in radians
tan_uav_ue = height_UAV ./ uav_ue_distances; % Angle between UAV i and point k (in degrees or radians)
theta_uav_ue = atan(tan_uav_ue);

tan_bs_ue = height_BS ./ bs_ue_distances; % Angle between UAV i and point k (in degrees or radians)
theta_bs_ue = atan(tan_bs_ue);



% Pathloss BS - UE
P_LoS_bs_ue = 1 ./ (1 + alpha * exp(-beta * (theta_bs_ue - alpha))); % matrix
FSPL_bs_ue = 20 * log10(bs_ue_distances) + 20 * log10(f0) + 20 * log10(4 * pi / c); % matrix
average_pathloss_LoSbs_ue = FSPL_bs_ue + eta_LoS ; % matrix
average_pathloss_NLoSbs_ue = FSPL_bs_ue + eta_NLoS ; % matrix
g_bs_ue = P_LoS_bs_ue .* average_pathloss_LoSbs_ue + (1 - P_LoS_bs_ue) .* average_pathloss_NLoSbs_ue; % pathloss - matrix


% Pathloss UAV - UE
P_LoS_uav_ue = 1 ./ (1 + alpha * exp(-beta * (theta_uav_ue - alpha))); % matrix
FSPL_uav_ue = 20 * log10(uav_ue_distances) + 20 * log10(f0) + 20 * log10(4 * pi / c);  % matrix
average_pathloss_LoSuav_ue = FSPL_uav_ue + eta_LoS ; % matrix
average_pathloss_NLoSuav_ue = FSPL_uav_ue + eta_NLoS ;  % matrix
g_uav_ue = P_LoS_uav_ue .* average_pathloss_LoSuav_ue + (1 - P_LoS_uav_ue) .* average_pathloss_NLoSuav_ue; % pathloss - matrix


% Loop through each BS, UAV, and UE to calculate SINR and update connections
for i = 1:F
    for k = 1:M
        % Calculate SINR for BS i and UE k
        % Calculate the path loss for each pair 
        signal_power = pf * g_bs_ue(i,k);

        % Calculate interference BS UE (sum of other BSs and UAVs)
        interference = N0; % Start with noise power
        for j = [1:i-1, i+1:F]  % Other BSs
            interference = interference + pf * g_bs_ue(j,k);
        end
        
        % Calculate SINR and update b_F, zeta_f, xi_f if connection is valid
        SINR_BS_UE = signal_power / interference;

        if SINR_BS_UE >= SINR_threshold
            b_F(i, k) = 1;
            zeta_f(i) = zeta_f(i) + 1;
            xi_f(k) = xi_f(k) + 1;
            xi(k) = xi(k) + 1;
        end
    end
end

for j = 1:N
    for k = 1:M
        % Calculate SINR for UAV j and UE k
        signal_power = ph * g_uav_ue(j,k);

        % Calculate interference (sum of other UAVs and BSs)
        interference = N0; % Start with noise power
        for n = [1:j-1, j+1:N]  % UAVs
            interference = interference + ph * g_uav_ue(n, k);
        end
        
        % Calculate SINR and update b_U, zeta_u, xi_u if connection is valid
        SINR_UAV_UE = signal_power / interference;
        if SINR_UAV_UE >= SINR_threshold
            b_U(j, k) = 1;
            zeta_u(j) = zeta_u(j) + 1;
            xi_u(k) = xi_u(k) + 1;
            xi(k) = xi(k) + 1;
        end
    end
end

plot_UE_network_connections(uav_positions, bs_positions, ue_positions, b_U, b_F, area_size)





%% Algorithm 3 Delete Redundant Connections Between BSs/UAVs and UEs

% Parameters (from previous algorithms)
Mmax_F = 2; % Maximum number of UEs per BS
Mmax_H = 2;  % Maximum number of UEs per UAV

% Inputs from Algorithm 2 (for demonstration, assumed initialized)
% b_F, b_U, zeta_f, zeta_u, xi_f, xi_u, xi (association matrices and degrees)

% Loop to remove redundant connections while there are UEs connected to more than one node
while max(xi) > 1
    % Step 1: Handle Redundant Connections for BSs
    % cnt=1;
    while max(xi_f) > 1  % Check if any UE is connected to multiple BSs
        % cnt=cnt+1;
        % disp(cnt);
        % to delete i = find(zeta_f == max(zeta_f), 1);  % Find BS with the highest degree
        [~, i] = max(zeta_f);
    
        % Find UEs connected to this BS
        phi = find(b_F(i, :) == 1);  % Set of UEs connected to BS i
        psi = xi_f(phi);             % Degrees of these UEs to BSs
    
        % Remove extra connections if BS degree exceeds Mmax_F
        while length(phi) > Mmax_F
            % Find the UE with the highest degree among the connected UEs
            [~, k_idx] = max(psi);
            k = phi(k_idx);
    
            % UE-BS important
            b_F(i, k) = 0;  % Remove connection from BS i to UE k
            zeta_f(i) = zeta_f(i) - 1;  % Decrease BS degree


            xi_f(k) = xi_f(k) - 1;      % Decrease UE-BS degree
            xi(k) = xi(k) - 1;          % Decrease total degree of UE
            % Update variables after deletion
            phi(k_idx) = [];
            psi(k_idx) = [];
            %
    
        end
    
    
        % Remove all other connections to these UEs from different BSs
        b_F(i, :) = 0;
        for k = phi
            b_F(:, k) = 0;  % Clear connections to other BSs for UE k
            b_F(i, k) = 1;  % Retain only the connection to the current BS i
            b_U(:, k) = 0; % ok

        end
        xi_f = sum(b_F)'; % ok   
        xi_u = sum(b_U)'; % ok
        zeta_f = sum(b_F, 2);  
        zeta_u = sum(b_U, 2);  
        xi = xi_f + xi_u; % ok
    end
    disp('Step 1 finished.');
    
    % Step 2: Handle Redundant Connections for UAVs
    while max(xi_u) > 1  % Check if any UE is connected to multiple UAVs
    
        [~, j] = max(zeta_u);
    
        % Find UEs connected to this UAV
        phi_prime = find(b_U(j, :) == 1);  % Set of UEs connected to UAV j
        psi_prime = xi_u(phi_prime);       % Degrees of these UEs to UAVs
        
        % Remove extra connections if UAV degree exceeds Mmax_H
        while length(phi_prime) > Mmax_H
            % Find the UE with the highest degree among the connected UEs
            [~, l_idx] = max(psi_prime);
            l = phi_prime(l_idx);
    
            b_U(j, l) = 0;  % Remove connection from UAV j to UE l
            zeta_u(j) = zeta_u(j) - 1;  % Decrease UAV degree
            xi_u(l) = xi_u(l) - 1;      % Decrease UE-UAV degree
            xi(l) = xi(l) - 1;          % Decrease total degree of UE
    
            % Update variables after deletion
            phi_prime(l_idx) = [];
            psi_prime(l_idx) = [];
    
        end
        
        % Remove all other connections to these UEs from different UAVs
        b_U(j, :) = 0;
        for l = phi_prime
            b_U(:, l) = 0;  % Clear connections to other UAVs for UE l
            b_U(j, l) = 1;  % Retain only the connection to the current UAV j
        end
    
        xi_u = sum(b_U)'; % ok
        zeta_u = sum(b_U, 2);  
        xi = xi_f + xi_u; % ok
    
    end
    
    % Step 3: Final Check for UEs with Multiple Connections
    if max(xi) > 1  % There are still UEs connected to both BSs and UAVs
        phi_double = find(xi > 1);  % UEs with multiple connections
        % Remove UAV connections for these UEs
        for k = phi_double
            b_U(:, k) = 0;  % Set all UAV connections for UE k to 0
        end
    end
    
    % Update matrices and degrees after removal of redundant connections
    zeta_f = sum(b_F, 2);  % Recalculate BS degrees
    zeta_u = sum(b_U, 2);  % Recalculate UAV degrees
    xi_f = sum(b_F, 1)';   % Recalculate UE degrees for BS connections
    xi_u = sum(b_U, 1)';   % Recalculate UE degrees for UAV connections
    xi = xi_f + xi_u;      % Recalculate total degree of each UE
end


plot_UE_network_connections(uav_positions, bs_positions, ue_positions, b_U, b_F, area_size)
