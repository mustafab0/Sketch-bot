COM_CloseNXT all
sb=COM_OpenNXT();
COM_SetDefaultNXT(sb);
power=10;
armAcw= NXTMotor('A','Power',power); %only for arm A
armAccw= NXTMotor('A','Power',-power); %only for arm A
yOrn=struct('ans','y');
dataA=armAcw.ReadFromNXT();
fprintf('%d \n',dataA.Position);
while strcmpi(yOrn.ans,'y')
    theta1=input('Enter value of theta1: ');
    pos=dataA.Position;
    check= dataA.Position+theta1;
    if check<0 %whenever check is negative go clockwise; NOT same as power.
        armAcw.TachoLimit=-check;
        armAcw.SendToNXT();
        pause(2);
        dataA=armAcw.ReadFromNXT();
        fprintf('%d \n',dataA.Position);
    else
        armAccw.TachoLimit=check;
        armAccw.SendToNXT();
        pause(2);
        dataA=armAccw.ReadFromNXT();
        fprintf('%d \n',dataA.Position);
    end
    yOrn.ans = input('continue?:','s');
end