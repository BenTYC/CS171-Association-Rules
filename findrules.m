% CS171   PS4
% Name: Tsung-Ying Chen 
% SID: 861310198 
% Date: 11/29/2017 
function findrules(D,smin,amin)

m = numexamples(D);
Li = getL1(D,smin);
level = 1;

asXY = {};
while length(Li) > 1
    level = level + 1;
    Ci = apriori_gen(Li,level);
    Li = [];
    for i = 1:size(Ci,1)
       sup = getcount(Ci(i,:),D)/m;
       if  sup >= smin
           Li = [Li;Ci(i,:)];
           [X,Y,a] = check_amin(Ci(i,:),amin,D);
           if ~isempty(X)
               asXY = [asXY;{a} {sup} {X} {Y}];
           end
       end
    end
end

asXY = sortrows(asXY,1);

for i = 1:size(asXY,1)
    c = asXY(i,:);
    fprintf(1,'%1.6f, %1.6f : ',c{1},c{2});
    disp(rule2str(c{3},c{4},D))
end

end

function [X,Y,a] = check_amin(R,amin,D)

X = [];
Y = [];
a = [];
for i = 1:length(R) - 1
    X_uncheck = nchoosek(R,i);
    for j = 1:size(X_uncheck,1)
        a_uncheck = getcount(R,D)/getcount(X_uncheck(j,:),D);
        if a_uncheck >= amin
            X = [X;X_uncheck(j,:)];
            Y = [Y;setdiff(R,X_uncheck(j,:))];
            a = [a;a_uncheck];
        end
    end
end

end

function Ci = apriori_gen(L,i)

if i == 2
    Ci = combnk(L,2);
   return; 
end

Ci = [];
for j = 1:length(L)
    for k = j+1:length(L)
        if isequal(L(j,1:i-2),L(k,1:i-2))
            Ci = [Ci; union(L(j,:),L(k,:))];
        else
            break;
        end
    end
end
end

function L = getL1(D,smin)

I = items(D);
m = numexamples(D);
L = [];

for i = 1:length(I)
    f = getcount(I(i),D)/m;
    if f > smin
        L = [L;I(i)];
    end
end
end

