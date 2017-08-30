function v = createMatrix(cell)
  % Run the 'CreateRow' function on each vector in the cell
  % `out` is a cell, where each cell element consists of the 
  % updated matrix row
  out = cellfun(@(c) createRow(c), cell, 'UniformOutput',false);
  % Simply convert the cell back into a matrix
  v = cell2mat(out');

function k = createRow(vector)
  row = zeros(1,8);
  row(vector) = 1;
  k = row;