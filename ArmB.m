COM_CloseNXT all
sb=COM_OpenNXT();
COM_SetDefaultNXT(sb);
power=25;
armBcw= NXTMotor('B','Power',-power); %only for arm B
armBccw= NXTMotor('B','Power',power); %only for arm B
yOrn=struct('ans','y');
dataB=armBcw.ReadFromNXT();
fprintf('%d \n',dataB.Position);
while strcmpi(yOrn.ans,'y')
    theta2=-input('Enter value of theta2: ');
    pos=dataB.Position;
    check= dataB.Position+theta2;
    if check>0 %whenever check is positive go clockwise; NOT same as power.
        armBcw.TachoLimit=check;
        armBcw.SendToNXT();
        pause(2);
        dataB=armBcw.ReadFromNXT();
        fprintf('%d \n',dataB.Position);
    elseif check==0
        armBcw.Stop();
    else   %else go counter clockwise
        armBccw.TachoLimit=-check;
        armBccw.SendToNXT();
        pause(2);
        dataB=armBccw.ReadFromNXT();
        fprintf('%d \n',dataB.Position);
    end
    yOrn.ans = input('continue?:','s');
end