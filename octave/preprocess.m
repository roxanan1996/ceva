function [x t] = preprocess(path,string1,count_bins)
dirinfo = dir(path);
dirinfo(~[dirinfo.isdir]) = [];
tf = ismember({dirinfo.name}, {'.','..'});
dirinfo(tf) = [];
files1 = dir(fullfile(path,dirinfo(1).name,'*.jpg'));
files2 = dir(fullfile(path,dirinfo(2).name,'*.jpg'));
length1 = length(files1);
length2 = length(files2);
x = zeros (length1 + length2,3*count_bins);
t = zeros (length1 + length2,1);
if strcmp(string1, "RGB") == 1
if strcmp(dirinfo(1).name,"cats") == 1
  for i = 1 : length1
    t(i) = 1;
    x(i,:) = rgbHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
  endfor
 for i = 1 : length2
    t(length1+i) = -1;
    x(length1+i,:) = rgbHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
  endfor
endif
if strcmp(dirinfo(1).name,"cats") == 0
  for i = 1 : length1
    t(i) = -1;
    x(i,:) = rgbHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
  endfor
 for i = 1 : length2
    t(length1+i) = 1;
    x(length1+i,:) = rgbHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
  endfor
endif
endif
if strcmp(string1, "HSV") == 1
if strcmp(dirinfo(1).name,"cats") == 1
  for i = 1 : length1
    t(i) = 1;
    x(i,:) = hsvHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
  endfor
 for i = 1 : length2
    t(length1+i) = -1;
    x(length1+i,:) = hsvHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
  endfor
endif
if strcmp(dirinfo(1).name,"cats") == 0
  for i = 1 : length1
    t(i) = -1;
    x(i,:) = hsvHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
  endfor
 for i = 1 : length2
    t(length1+i) = 1;
    x(length1+i,:) = hsvHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
  endfor
endif
endif
endfunction


