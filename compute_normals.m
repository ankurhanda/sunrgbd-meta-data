function normals = compute_normals_Viorica(depth,width_downsample,height_downsample,Fx, Fy, U0, V0, scale)

% width = 320;
% height = 240;
% 
% scale = 2;

[U V] = meshgrid(1:width_downsample,1:height_downsample);

fx = Fx/scale;
fy = Fy/scale;

u0 = U0/scale;
v0 = V0/scale;

x = ((U-u0)/fx).*depth;
y = ((V-v0)/fy).*depth;
z = depth;

x = add_pad(x); y = add_pad(y); z = add_pad(z);
b_x_u_d = x(3:end,2:end-1)-x(2:end-1,2:end-1);
b_y_u_d = y(3:end,2:end-1)-y(2:end-1,2:end-1);
b_z_u_d = z(3:end,2:end-1)-z(2:end-1,2:end-1); 
    
b_x_u_u = x(1:end-2,2:end-1)-x(2:end-1,2:end-1);
b_y_u_u = y(1:end-2,2:end-1)-y(2:end-1,2:end-1);
b_z_u_u = z(1:end-2,2:end-1)-z(2:end-1,2:end-1); 
    
a_x_r_r = x(2:end-1,3:end)-x(2:end-1,2:end-1);
a_y_r_r = y(2:end-1,3:end)-y(2:end-1,2:end-1);
a_z_r_r = z(2:end-1,3:end)-z(2:end-1,2:end-1);
    
a_x_r_l = x(2:end-1,1:end-2)-x(2:end-1,2:end-1);
a_y_r_l = y(2:end-1,1:end-2)-y(2:end-1,2:end-1);
a_z_r_l = z(2:end-1,1:end-2)-z(2:end-1,2:end-1);
    
%% RD
normals_rd(:,:,1) = a_y_r_r.*b_z_u_d - a_z_r_r.*b_y_u_d;
normals_rd(:,:,2) = a_z_r_r.*b_x_u_d - a_x_r_r.*b_z_u_d;
normals_rd(:,:,3) = a_x_r_r.*b_y_u_d - a_y_r_r.*b_x_u_d;
    
norm_normals_rd = sqrt(normals_rd(:,:,1).*normals_rd(:,:,1) + normals_rd(:,:,2).*normals_rd(:,:,2) + normals_rd(:,:,3).*normals_rd(:,:,3));
   
normals_rd(:,:,1) = normals_rd(:,:,1)./(norm_normals_rd+1e-6);
normals_rd(:,:,2) = normals_rd(:,:,2)./(norm_normals_rd+1e-6);
normals_rd(:,:,3) = normals_rd(:,:,3)./(norm_normals_rd+1e-6);
    
%% DL
normals_dl(:,:,1) = b_z_u_d.*a_y_r_l - b_y_u_d.*a_z_r_l;
normals_dl(:,:,2) = b_x_u_d.*a_z_r_l - b_z_u_d.*a_x_r_l;
normals_dl(:,:,3) = b_y_u_d.*a_x_r_l - b_x_u_d.*a_y_r_l;
    
norm_normals_dl = sqrt(normals_dl(:,:,1).*normals_dl(:,:,1) + normals_dl(:,:,2).*normals_dl(:,:,2) + normals_dl(:,:,3).*normals_dl(:,:,3));
   
normals_dl(:,:,1) = normals_dl(:,:,1)./(norm_normals_dl+1e-6);
normals_dl(:,:,2) = normals_dl(:,:,2)./(norm_normals_dl+1e-6);
normals_dl(:,:,3) = normals_dl(:,:,3)./(norm_normals_dl+1e-6);
    
%% LU
normals_lu(:,:,1) = a_y_r_l.*b_z_u_u - a_z_r_l.*b_y_u_u;
normals_lu(:,:,2) = a_z_r_l.*b_x_u_u - a_x_r_l.*b_z_u_u;
normals_lu(:,:,3) = a_x_r_l.*b_y_u_u - a_y_r_l.*b_x_u_u;
    
norm_normals_lu = sqrt(normals_lu(:,:,1).*normals_lu(:,:,1) + normals_lu(:,:,2).*normals_lu(:,:,2) + normals_lu(:,:,3).*normals_lu(:,:,3));
    
normals_lu(:,:,1) = normals_lu(:,:,1)./(norm_normals_lu+1e-6);
normals_lu(:,:,2) = normals_lu(:,:,2)./(norm_normals_lu+1e-6);
normals_lu(:,:,3) = normals_lu(:,:,3)./(norm_normals_lu+1e-6);
    
%% UR
normals_ur(:,:,1) = b_z_u_u.*a_y_r_r - b_y_u_u.*a_z_r_r;
normals_ur(:,:,2) = b_x_u_u.*a_z_r_r - b_z_u_u.*a_x_r_r;
normals_ur(:,:,3) = b_y_u_u.*a_x_r_r - b_x_u_u.*a_y_r_r;
    
norm_normals_ur = sqrt(normals_ur(:,:,1).*normals_ur(:,:,1) + normals_ur(:,:,2).*normals_ur(:,:,2) + normals_ur(:,:,3).*normals_ur(:,:,3));
    
normals_ur(:,:,1) = normals_ur(:,:,1)./(norm_normals_ur+1e-6);
normals_ur(:,:,2) = normals_ur(:,:,2)./(norm_normals_ur+1e-6);
normals_ur(:,:,3) = normals_ur(:,:,3)./(norm_normals_ur+1e-6);
    
normals = (normals_rd-normals_dl + normals_lu - normals_ur)/4.0;%+normals_lu+normals_ur)/4.0;
end
    
function x = add_pad(x)
x = [zeros(size(x,1),1) x zeros(size(x,1),1)];
x = [zeros(1,size(x,2)); x; zeros(1,size(x,2))];
end

