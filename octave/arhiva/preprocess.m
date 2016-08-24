function [x t] = preprocess(path,string1,count_bins)

  %continutul directorului path
  dirinfo = dir(path);

  %stergerea fisierelor
  dirinfo(~[dirinfo.isdir]) = [];

  %stergerea directoarelor . si ..
  tf = ismember({dirinfo.name}, {'.','..'});
  dirinfo(tf) = [];
  
  % gasirea fisierelor in cele doua directoare si punerea in vectorii files1 si files 2
  files1 = dir(fullfile(path,dirinfo(1).name,'*.jpg'));
  files2 = dir(fullfile(path,dirinfo(2).name,'*.jpg'));

  % lungimile celor 2 vectori (nr de imagini din fiecare director)
  length1 = length(files1);
  length2 = length(files2);

  %initializare matrice x si vector t cu "0-uri"
  x = zeros (length1 + length2,3*count_bins);
  t = zeros (length1 + length2,1);

  %cazul string = RGB
  if strcmp(string1, "RGB") == 1

    %cazul primul director este cats
    if strcmp(dirinfo(1).name,"cats") == 1
      for i = 1 : length1
        t(i) = 1;  % 1 pt ca este in directorul cats

        % linia i din x = rgbHistogram pentru imaginea cu indicele i din director
        x(i,:) = rgbHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
      endfor
      for i = 1 : length2
        t(length1+i) = -1;  % -1 pt ca este in directorul not_cats

        % linia length + 1 din x = rgbHistogram pentru imaginea cu indicele i din director
        x(length1+i,:) = rgbHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
      endfor
  endif 

  %cazul primul director este not_cats
    if strcmp(dirinfo(1).name,"cats") == 0
      for i = 1 : length1
        t(i) = -1;   % -1 pt ca se afla in directorul not_cats

        % linia i din x = rgbHistogram pt imaginea cu indicele i din director
        x(i,:) = rgbHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
      endfor
      for i = 1 : length2
        t(length1+i) = 1;   % 1 pt ca se afla in directorul cats

        % linia length + 1 din x = rgbHistogram pt imaginea cu indicele i din director 
        x(length1+i,:) = rgbHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
      endfor
    endif
  endif    % pt string = RGB

  %cazul string == HSV
  if strcmp(string1, "HSV") == 1

    % cazul primul director este cats
    if strcmp(dirinfo(1).name,"cats") == 1
      for i = 1 : length1
        t(i) = 1;   % 1 pt cats

        % linia i din  = hsvHistogram pt imaginea i din director
        x(i,:) = hsvHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
      endfor
      for i = 1 : length2
        t(length1+i) = -1;  % -1 pt not_cats

        % linia  length + 1 din x = hsvHistogram pt imaginea i din dir
        x(length1+i,:) = hsvHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
      endfor
    endif

    % cazul primul director este not_cats
    if strcmp(dirinfo(1).name,"cats") == 0
      for i = 1 : length1
        t(i) = -1;  % -1 pt not_cats

        % linia i din x = hsvHistogram pt imaginea i din director
        x(i,:) = hsvHistogram(fullfile(path,dirinfo(1).name,files1(i).name),count_bins);
      endfor
      for i = 1 : length2
        t(length1+i) = 1; % 1 pt cats

        % linia length + 1 din x = hsvHistogram pt imaginea i din director
        x(length1+i,:) = hsvHistogram(fullfile(path,dirinfo(2).name,files2(i).name),count_bins);
      endfor
    endif
  endif     % pt string = HSV
endfunction


