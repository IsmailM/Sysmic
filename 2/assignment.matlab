addpath('./functions')

% Define a cell made of vectors containing the indexes of the
% 'ones' in each row. A row made entirely of zeros will be an
% empty vector at that position. 
idxs = { [2,7],[3],[4 5 7 8],[1 2 3 7],[2 7],[],[2 5 8],[6] }

% Create the custom matrix
m = createMatrix(idxs);

% Draw the m graph using BioGraph
g = biograph(m)
g.LayoutType = 'equilibrium';
dolayout(g);
vg = view(g);


%%%%%%
% Exercise 2.1.6
%%%%%%

nodes = {'Plant Residues' 
         'Bacteria'
         'Fungi'
         'Myycorrhizae'
         'Bacteria-feeding Protozoa'
         'Fungal Geeding Protozoa'
         'Bacteria-feeding Nematodes'
         'Fungal-feeding Nematodes'
         'Microarthropods (Collembola, Mites)'
         'Enchytraeids'
         'Macroarthropods'
         'Earthworms'}

% The idxs are very easy to create, go through the nodes
% from 1 to the end systematically, and create a vector
% of all the nodes that node connects to. e.g. first node
% (Plant Residue) connects to nodes 2,3,4 and so on...
biota_idxs = { [2,3,4],[5,7],[8,9],[6],[],[8],[9],[9],[10,11,12],[],[],[] }
biota = createMatrix(biota_idxs, 12)

% Draw graph 
g=biograph(biota,nodes');
view (g);