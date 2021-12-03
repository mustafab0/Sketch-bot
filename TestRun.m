COM_CloseNXT all
sb=COM_OpenNXT();
COM_SetDefaultNXT(sb);
powerA=20;
powerB=10;
powerC=10;
armAcw= NXTMotor('A','Power',powerA); %only for arm A
armAccw= NXTMotor('A','Power',-powerA); %only for arm A
armBcw= NXTMotor('B','Power',-powerB); %only for arm B
armBccw= NXTMotor('B','Power',powerB); %only for arm B
armCup= NXTMotor('C','Power',-powerC); %only for arm C
armCdown= NXTMotor('C','Power',powerC); %only for arm C
yOrn=struct('ans','y');
dataA=armAcw.ReadFromNXT();
fprintf('%d \n',dataA.Position);
dataB=armBcw.ReadFromNXT();
fprintf('%d \n',dataB.Position);
while strcmpi(yOrn.ans,'y')
    %Code for controlling ArmA
    theta1=input('Enter value of theta1: ');
    posA=dataA.Position;
    check= dataA.Position+theta1;
    if check<0 %whenever check is negative go clockwise; NOT same as power.
        armAcw.TachoLimit=-check;
        armAcw.SendToNXT();
        pause(2);
        dataA=armAcw.ReadFromNXT();
        fprintf('%d \n',dataA.Position);
    elseif check==0
        armAcw.Stop();
    else
        armAccw.TachoLimit=check;
        armAccw.SendToNXT();
        pause(2);
        dataA=armAccw.ReadFromNXT();
        fprintf('%d \n',dataA.Position);
    end
    %Code for controlling Arm
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
ud=struct('ans','anything');    
ud.ans=input('Up or down: \n','s');
if strcmpi(ud.ans,'u')
    armCup.TachoLimit= 90;
    armCup.SendToNXT();
elseif strcmpi(ud.ans,'d')
    armCdown.TachoLimit=90;
    armCdown.SendToNXT();
end

    yOrn.ans = input('continue?:','s');
end