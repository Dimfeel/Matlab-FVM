function plots(vertices, faces, cellCenters, patch1, patch2, patch3, Dx, Dy, dx, dy, T, T2, T3)

g = figure;
set(g, 'Name', 'Расчетная сетка', 'Units', 'Normalized', 'OuterPosition', [0.2, 0.1, 0.6, 0.8]);


subplot(2,2,1);
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
title({"Нумерация вершин", "конечных объемов"});
plot(vertices(:,1),vertices(:,2), 'b.', 'MarkerSize', 15);
set(gca, 'YDir','reverse');
text(vertices(:,1),vertices(:,2),num2cell(1:1:40),'VerticalAlignment','bottom','HorizontalAlignment','right');
hold off;
xlim([min(vertices(:,1))-Dx, max(vertices(:,1))+Dx]);
ylim([min(vertices(:,2))-Dy, max(vertices(:,2))+Dy]);

subplot(2,2,2);
hold on;
for i=1:66
    plot([vertices(faces(i,1),1),vertices(faces(i,2),1)], [vertices(faces(i,1),2),vertices(faces(i,2),2)], 'k-');
    if vertices(faces(i,1),1) == vertices(faces(i,2),1)
        text(vertices(faces(i,1),1), (vertices(faces(i,1),2)+vertices(faces(i,2),2))/2, num2cell(i),'VerticalAlignment','middle','HorizontalAlignment','right');
    else
        text((vertices(faces(i,1),1)+vertices(faces(i,2),1))/2, vertices(faces(i,1),2), num2cell(i),'VerticalAlignment','bottom','HorizontalAlignment','center');
    end        
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

plot(vertices(:,1),vertices(:,2), 'b.', 'MarkerSize', 15);
title({"Нумерация граней", "конечных объемов"});
set(gca, 'YDir','reverse');
hold off;
xlim([min(vertices(:,1))-Dx, max(vertices(:,1))+Dx]);
ylim([min(vertices(:,2))-Dy, max(vertices(:,2))+Dy]);

subplot(2,2,3);
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
plot(vertices(:,1),vertices(:,2), 'b.', 'MarkerSize', 15);
text(cellCenters(:,1),cellCenters(:,2),num2cell(1:1:25),'VerticalAlignment','middle','HorizontalAlignment','center');
title({"Нумерация", "конечных объемов"});
set(gca, 'YDir','reverse');
hold off;
xlim([min(vertices(:,1))-Dx, max(vertices(:,1))+Dx]);
ylim([min(vertices(:,2))-Dy, max(vertices(:,2))+Dy]);

subplot(2,2,4);
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
plot(vertices(:,1),vertices(:,2), 'b.', 'MarkerSize', 15);
text(cellCenters(:,1),cellCenters(:,2),num2cell(T),'VerticalAlignment','middle','HorizontalAlignment','center');

text(3*dx/2, 3*dy/2, sprintf('Dirichlet\n %d ', T2), 'VerticalAlignment','middle','HorizontalAlignment','center');
text(9*dx/2, 9*dy/2, sprintf('Dirichlet\n %d ', T3), 'VerticalAlignment','middle','HorizontalAlignment','center');
title({"Начальные и граничные", "условия"});
set(gca, 'YDir','reverse');
hold off;
xlim([min(vertices(:,1))-Dx, max(vertices(:,1))+Dx]);
ylim([min(vertices(:,2))-Dy, max(vertices(:,2))+Dy]);


end