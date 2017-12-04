%rng('default') % For reproducibility
A = [1 1;1 2;2 3;2 4;4 3;5 3];
tree = linkage(A,'single');

figure()
dendrogram(tree)