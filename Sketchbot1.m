%%Take image
a=imgetfile()
a=imread(a);
%resizing image
as=imresize(a,500/size(a,1));
%as=a;

%% Converting to Black and White
level=0.5;
ablack=im2bw(as,level);
%% determining number of rows and columns
row=size(ablack,1);
col=size(ablack,2);
numrow=0;
for ii=1:row
    for jj=1:col
        if ablack(ii,jj)==0
            numrow=numrow+1;
        end
    end
end
%% Labeling different objects
invablack=~ablack;
cc=bwconncomp(invablack);
labeled=labelmatrix(cc);
blkobjs=cc.NumObjects;

%% Forming an array of location in cartesian co-ordinates of black pixels
[nrows, ~] = cellfun(@size,cc.PixelIdxList);
maxr=max(nrows);
clear nrows
points=zeros(maxr,2,blkobjs);
x=zeros(maxr,1,blkobjs);
y=zeros(maxr,1,blkobjs);
for numobj=1:blkobjs
    n=1;
    for ii=1:row
        for jj=1:col
            if labeled(ii,jj)==numobj
                points(n,:,numobj)=[ii jj];
                x(n,numobj)=ii;
                y(n,numobj)=jj;
                n=n+1;
            end
        end
    end
end

%% Forming an array of location in polar co-ordinates of black pixels
polpoints=zeros(maxr,2,blkobjs);
rad=zeros(maxr,1,blkobjs);
theta=zeros(maxr,1,blkobjs);
for numobj=1:blkobjs
    n=1;
    for ii=1:maxr
        polpoints(n,:,numobj)= [sqrt(x(ii,numobj)^2+y(ii,numobj)^2) atan(y(ii,numobj)/x(ii,numobj))];
        rad(n,numobj)=sqrt(x(ii,numobj)^2+y(ii,numobj)^2);
        theta(n,numobj)=atan(y(ii,numobj)/x(ii,numobj));
        n=n+1;
        
    end
end
