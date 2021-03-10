clc;
clear all;
close all;

conduct = 0.00125;

Dx = 0.05;
Dy = 0.05;
dx = Dx;
dy = Dy;

vertices = zeros(40,2);
k = 0;
for i=1:40
    if i<=28
        if mod(i-1,7) == 0
            k = k + 1;
        end 
        vertices(i,:) = [Dx*mod(i-1,7), Dy*(k-1)];
    else
        if mod(i-1,4) == 0
            k = k + 1;
        end 
        vertices(i,:) = [Dx*3+Dx*mod(i-1,4), Dy*(k-1)];
    end     
end

faces = zeros(66,2);
maxX = max(vertices(:,1));
maxY = max(vertices(:,2));
count = 0;
k = 0; 
for i=1:40
    if i<=21
        if mod(i-1,7) == 0
            k = k + 1;
        end 
        if vertices(i,1) < maxX
            count = count + 1;
            faces(count,:) = [i, i+1];
        end
        if vertices(i,2) < maxY
            count = count + 1;
            faces(count,:) = [i, i+7];
        end
    else
        if i<25
            count = count + 1;
            faces(count,:) = [i, i+1];
        else
            if vertices(i,1) < maxX
                count = count + 1;
                faces(count,:) = [i, i+1];
            end
            if vertices(i,2) < maxY
                count = count + 1;
                faces(count,:) = [i, i+4];
            end
        end
    end
end

cellCenters = zeros(25, 2);
k = 0;
count = 0;
for i=1:27
    if i<=18
        if mod(i-1,6) == 0
            k = k + 1;
        end
        x = dx/2 + dx*mod(i-1,6);
        y = dy/2 + (k-1)*dy;
        if (round(x,3) ~= round(3*dx/2,3)) || (round(y,3) ~= round(3*dy/2,3))
            count = count + 1;
            cellCenters(count,:) = [x,y];
        end
    else
        if mod(i-1,3) == 0
            k = k + 1;
        end
        x = 7*dx/2 + dx*mod(i-1,3);
        y = dy/2 + (k-1)*dy;
        if (round(x,3) ~= round(9*dx/2,3)) || (round(y,3) ~= round(9*dy/2,3))
            count = count + 1;
            cellCenters(count,:) = [x,y];
        end
    end
end

cellFaces = zeros(25,4);
cellFaces(1,:) = [1, 2, 4, 14];
for i=2:5
    cellFaces(i,:) = cellFaces(i-1,:) + 2;
end
cellFaces(6,:) = cellFaces(5,:) + [2, 2, 1, 2];
cellFaces(7,:) = cellFaces(6,:) + [3, 3, 4, 3];
cellFaces(8,:) = cellFaces(7,:) + [4, 4, 4, 4];
cellFaces(9,:) = cellFaces(8,:) + [2, 2, 2, 2];
cellFaces(10,:) = cellFaces(9,:) + [2, 2, 2, 2];
cellFaces(11,:) = cellFaces(10,:) + [2, 2, 1, 2];
cellFaces(12,:) = cellFaces(11,:) + [3, 3, 4, 3];
cellFaces(13,:) = cellFaces(12,:) + [2, 2, 2, 1];
cellFaces(14,:) = cellFaces(13,:) + [2, 2, 2, 1];
cellFaces(15,:) = cellFaces(14,:) + [2, 2, 2, 1];
cellFaces(16,:) = cellFaces(15,:) + [2, 2, 2, 2];
cellFaces(17,:) = cellFaces(16,:) + [2, 2, 1, 2];
cellFaces(18,:) = cellFaces(17,:) + [6, 6, 7, 3];
cellFaces(19,:) = cellFaces(18,:) + [2, 2, 2, 2];
cellFaces(20,:) = cellFaces(19,:) + [2, 2, 1, 2];
cellFaces(21,:) = cellFaces(20,:) + [3, 3, 4, 3];
cellFaces(22,:) = cellFaces(21,:) + [4, 4, 3, 4];
cellFaces(23,:) = cellFaces(22,:) + [3, 3, 4, 3];
cellFaces(24,:) = cellFaces(23,:) + [2, 2, 2, 1];
cellFaces(25,:) = cellFaces(24,:) + [2, 2, 1, 1];

cellNeighbors = zeros(25, 4);
cellNeighbors(1,:) = [0,0,2,7];
cellNeighbors(2,:) = [0,1,3,0];
cellNeighbors(3,:) = [0,2,4,8];
cellNeighbors(4,:) = [0,3,5,9];
cellNeighbors(5,:) = [0,4,6,10];
cellNeighbors(6,:) = [0,5,0,11];
cellNeighbors(7,:) = [1,0,0,12];
cellNeighbors(8,:) = [3,0,9,14];
cellNeighbors(9,:) = [4,8,10,15];
cellNeighbors(10,:) = [5,9,11,16];
cellNeighbors(11,:) = [6,10,0,17];
cellNeighbors(12,:) = [7,0,13,0];
cellNeighbors(13,:) = [0,12,14,0];
cellNeighbors(14,:) = [8,13,15,0];
cellNeighbors(15,:) = [9,14,16,18];
cellNeighbors(16,:) = [10,15,17,19];
cellNeighbors(17,:) = [11,16,0,20];
cellNeighbors(18,:) = [15,0,19,21];
cellNeighbors(19,:) = [16,18,20,0];
cellNeighbors(20,:) = [17,19,0,22];
cellNeighbors(21,:) = [18,0,0,23];
cellNeighbors(22,:) = [20,0,0,25];
cellNeighbors(23,:) = [21,0,24,0];
cellNeighbors(24,:) = [0,23,25,0];
cellNeighbors(25,:) = [22,24,0,0];

patch1 = [1, 3, 5, 7, 9, 11, 13, 26, 39, 49, 56, 63, 66, 65, 64, 58, 51, 44, 42, 41, 40, 28, 15, 2];
patch2 = [16, 17, 19, 29];
patch3 = [52, 53, 55, 59];

type = 2;
T1 = 25;
T2 = 15;
T3 = 70;

T = 25 * ones(25,1);

plots(vertices, faces, cellCenters, patch1, patch2, patch3, Dx, Dy, dx, dy, T, T2, T3)


deltat = 100;
time = 0; 

g = figure;
set(g, 'Name', 'Расчет модели');
hold on;
for i=1:66
    plot([vertices(faces(i,1),1),vertices(faces(i,2),1)], [vertices(faces(i,1),2),vertices(faces(i,2),2)], 'k-');   
end
for i=1:length(patch1)
    face = patch1(i);
    plot([vertices(faces(face,1),1),vertices(faces(face,2),1)], [vertices(faces(face,1),2),vertices(faces(face,2),2)], 'r-', 'LineWidth', 1);
end
for i=1:length(patch2)
    face = patch2(i);
    plot([vertices(faces(face,1),1),vertices(faces(face,2),1)], [vertices(faces(face,1),2),vertices(faces(face,2),2)], 'r-', 'LineWidth', 1);
end
for i=1:length(patch3)
    face = patch3(i);
    plot([vertices(faces(face,1),1),vertices(faces(face,2),1)], [vertices(faces(face,1),2),vertices(faces(face,2),2)], 'r-', 'LineWidth', 1);
end
pointsize = 500;
scatter(cellCenters(:,1),cellCenters(:,2), pointsize, T, 'filled', 'Marker', 'o');
colormap('jet')
colorbar;
set(gca, 'YDir','reverse');
xlim([min(vertices(:,1))-Dx, max(vertices(:,1))+Dx]);
ylim([min(vertices(:,2))-Dy, max(vertices(:,2))+Dy]);

title({time, " секунд"});
pause(2);

while time <= 10000
    A = zeros(25, 25);
    b = zeros(25, 1); 
    for i=1:25
        for j=1:length(cellFaces(i,:))
            if (j == 2) || (j == 3)
                D = Dy;
                d = dx;
            else
                D = Dx;
                d = dy;
            end
            if any(patch1 == cellFaces(i,j))
                if(type == 1)
                    flux = (-conduct * D)/ (d/2);
                else
                    flux = 0;
                end
                b(i) = b(i) - flux*T1;
                A(i,i) = A(i,i) - flux;
            elseif any(patch2 == cellFaces(i,j))
                flux = (-conduct * D)/ (d/2);
                b(i) = b(i) - flux*T2;
                A(i,i) = A(i,i) - flux;
            elseif any(patch3 == cellFaces(i,j))
                flux = (-conduct * D)/ (d/2);
                b(i) = b(i) - flux*T3;
                A(i,i) = A(i,i) - flux;
            else
                flux = (-conduct * D)/d;
                A(i, cellNeighbors(i,j)) = flux;
                A(i,i) = A(i,i) - flux;
            end
        end 
        b(i) = b(i) + T(i)/deltat;
        A(i,i) = A(i,i) + 1/deltat;
    end 
    
    T = A\b;
    
    scatter(cellCenters(:,1),cellCenters(:,2), pointsize, T, 'filled', 'Marker', 'o');
    colormap('jet')
    colorbar;
    title({time, " секунд"});
    pause(0.1);
    
    time = time + deltat;
end 
hold off;
