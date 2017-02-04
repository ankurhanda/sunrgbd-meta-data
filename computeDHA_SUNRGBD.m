depthfileNamesFile = fopen('sunrgbd_train_depth_fileNames.txt','w');
res_file = fopen('sunrgbd_train_res_fileNames.txt','w');
K_file = fopen('sunrgbd_train_K_fileNames.txt','w');
T_file = fopen('sunrgbd_train_T_fileNames.txt','w');

for i = 1:5285

    i
    
    k = i+5050;
    
    fName = mat2str(cell2mat(alltrain(i)));
    fName = strcat('/scratch/SUNRGBD_13',fName(18:end-1),'/depth_bfx/');

    X = dir(fName);

    depth = X(3).name;
    depth = strcat(fName,depth);
    
    fprintf(depthfileNamesFile,'%s\n',depth);

    Id = double(imread(depth))/10000.0;
%     I = SUNRGBD2Dseg(k).seglabel;

    K = SUNRGBDMeta(k).K;
    Rtilt = SUNRGBDMeta(k).Rtilt;
    
%     size(Rtilt)
    
%     X = [1 0 0; 
%          0 0 1;
%          0 -1 0];
     
% %      Rtilt = X * Rtilt * X';
    
%     Rtilt = X*Rtilt*X';

    
    fprintf(res_file,'%d %d\n',size(Id,2), size(Id,1));
    
    fprintf(K_file,'%f %f %f\n',K(1,1),K(1,2),K(1,3));
    fprintf(K_file,'%f %f %f\n',K(2,1),K(2,2),K(2,3));
    fprintf(K_file,'%f %f %f\n\n',K(3,1),K(3,2),K(3,3));

    val_zero = 0.0;
    
    fprintf(T_file,'%f %f %f %f\n',Rtilt(1,1),Rtilt(1,2),Rtilt(1,3),val_zero);
    fprintf(T_file,'%f %f %f %f\n',Rtilt(2,1),Rtilt(2,2),Rtilt(2,3),val_zero);
    fprintf(T_file,'%f %f %f %f\n\n',Rtilt(3,1),Rtilt(3,2),Rtilt(3,3),val_zero);

    
%     normals = compute_normals(Id,size(Id,2),size(Id,1),K(1,1), K(2,2), K(1,3), K(2,3), 1);
%     
%     [U, V] = meshgrid(1:size(Id,2),1:size(Id,1));
%     
%     X = Id.*(U - K(1,3))/K(1,1);
%     Y = Id.*(V - K(2,3))/K(2,2);
%     Z = Id;
%     
%     XDash = Rtilt(1,1)*X + Rtilt(1,2)*Y + Rtilt(1,3)*Z;
%     YDash = Rtilt(2,1)*X + Rtilt(2,2)*Y + Rtilt(2,3)*Z;
%     ZDash = Rtilt(3,1)*X + Rtilt(3,2)*Y + Rtilt(3,3)*Z;
%     
%     YDash = (YDash - min(min(YDash)));
%     
%     normal_x= normals(:,:,1);
%     normal_y= normals(:,:,2);
%     normal_z= normals(:,:,3);
%     
%     new_normals_x = Rtilt(1,1)*normal_x + Rtilt(1,2)*normal_y + Rtilt(1,3)*normal_z;
%     new_normals_y = Rtilt(2,1)*normal_x + Rtilt(2,2)*normal_y + Rtilt(2,3)*normal_z;
%     new_normals_z = Rtilt(3,1)*normal_x + Rtilt(3,2)*normal_y + Rtilt(3,3)*normal_z;
%     
%     new_normals(:,:,1) = new_normals_x;
%     new_normals(:,:,2) = new_normals_y;
%     new_normals(:,:,3) = new_normals_z;
%     
%     angle = acosd(new_normals(:,:,2))/180.0;
%     
%     size(normals);
%     
%     file1 = fopen(sprintf('train-dha-%04d.bin',i),'wb');
%     
%     Id    = imresize(Id,   [224 224],'bilinear');
%     YDash = imresize(YDash,[224 224],'bilinear');
%     angle = imresize(angle,[224 224],'bilinear');
%     
%     YDash(isnan(YDash))=0;
%     angle(isnan(angle))=0;
%     
%     for i = 1:224
%         for j = 1:224
%             fwrite(file1,single(Id(i,j)),'float');
%             fwrite(file1,single(YDash(i,j)),'float');
%             fwrite(file1,single(angle(i,j)),'float');
%         end
%     end
%     
%             
%     fclose(file1);
    
%   [sum(isnan(I(:))), sum(isnan(YDash(:))), sum(isnan(angle(:)))]

end

%     fclose(depthfileNamesFile);
%     fclose(res_file);
%     fclose(T_file);
%     fclose(K_file);
