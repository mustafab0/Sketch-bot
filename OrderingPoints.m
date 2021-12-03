for block=1:blkobjs %To sort all the objects
    
    for line=1:maxr             %To start from first line of each block
        
        for i=(line+1):maxr     %To skip a line if points are not continous
            
             dist=pdist([points(line,:,block);points(i,:,block)],'euclidean'); %Calculating Distance between consecutive points
             nrow=zeros(1);
             if dist<=sqrt(2)   %Condition to check whether next point is adjacent 
                 temp=points(line+1,:,block);               %swapping points
                 points(line+1,:,block)=points(i,:,block);
                 points(i,:,block)=temp;
                 break
             elseif points(i,:,block)==[0 0]    %Condition for when elements become zero
                 break  
             elseif i==maxr         %if last co ordinates are not continous
                 break
             else           %Condition to find the closest element when no object is adjacent
                 points(i,:,1);
                 %calculating minimum distance from all the points
                 mindist=bsxfun(@hypot,points(i+1:maxr,1,block)-points(line,1,block),points(i+1:maxr,2,block)-points(line,2,block));
                 findr=mindist==min(mindist);   %finding the closest
                 [nrow]=find(findr==1);         %determining row of the closest element               
                 nrow=nrow(1);
                 temp=points(line+1,:,block);               %swapping points
                 points(line+1,:,block)=points(i+nrow,:,block);
                 points(i+nrow,:,block)=temp;
                 break
                 
             end
        end
    end
end
    