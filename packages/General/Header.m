function [header,myline1,myline2] = Header
% Set stuff
myline1 = [repmat('=',1,78),'\n'];
myline2 = [repmat('-',1,78),'\n'];
header  = [' iter|   Obj   | RelAccry |  PFeasi  |  DFeasi  |   Gap    | SemiFeasi | alpha | time (s) \n'];
