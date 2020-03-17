%   Copyright 2018-2020 The MathWorks, Inc.

% Copy vehicle data into the local folder
disp("Checking for dataset files...")

if ~isfolder("vehicleImages")
    answer = questdlg("Do you want to copy the dataset now?","Dataset not found","Yes","No","Yes");
    switch answer
        case "Yes"
            disp("Copying dataset files...")
            unzip("vehicleDatasetImages.zip")
            disp("Dataset copied.")
        case "No"
            disp("Dataset not copied. You will need to copy the dataset to run the example. Please run CopyDataset.")
    end
else
    disp("Dataset found.")
end



