%   Copyright 2018-2020 The MathWorks, Inc.

function OpenCodegenReport

prj = currentProject;
open(fullfile(prj.RootFolder, 'CodeGeneration', 'codegen', 'mex', 'yolov2_detect', 'html', 'report.mldatx'));

end