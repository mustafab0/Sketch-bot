%Setting up the NXTBlock
COM_CloseNXT all       %Closing all existing connection
sb=COM_OpenNXT();      %Opening a new connection
COM_SetDefaultNXT(sb); %Setting NXTBlock to default

%% Defining motors and other parameters
powerA=15;
powerB=10;
powerC=10;
%MotorA
armAcw= NXTMotor('A','Power',powerA); %only for arm A
armAccw= NXTMotor('A','Power',-powerA); %only for arm A
%MotorB
armBcw= NXTMotor('B','Power',-powerB); %only for arm B
armBccw= NXTMotor('B','Power',powerB); %only for arm B
%MotorC
armCup= NXTMotor('C','Power',-powerC); %only for arm C
armCdown= NXTMotor('C','Power',powerC); %only for arm C

%% Commencing while loop
yOrn=struct('ans','+');
dataA=armAcw.ReadFromNXT(); %reading initial condition of motors
dataB=armBcw.ReadFromNXT(); %reading initial condition of motors

while strcmpi(yOrn.ans,'+')
    
    theta1=input('Enter value of theta1: ');   %ask for Theta1
    theta2=-input('Enter value of theta2: ');  %ask for Theta2
    
    posA=dataA.Position;        %Determining position of ArmA
    posB=dataB.Position;        %Determining position of ArmB
    
    checkA= posA+theta1;
    if checkA<0 %whenever check is negative go clockwise; NOT same as power.
        armAcw.TachoLimit=-checkA;
        armAcw.SendToNXT();
        
    elseif checkA==0
        armAcw.Stop();
    else
        armAccw.TachoLimit=checkA;
        armAccw.SendToNXT(); 
    end 
    
    checkB= posB+theta2;
    if checkB>0             %Whenever check is positive go clockwise; NOT same as power.
        armBcw.TachoLimit=checkB;
        armBcw.SendToNXT();
      
    elseif checkB==0        %When no rotation is required
        armBcw.Stop();
        
    else                     %else go counter clockwise
        armBccw.TachoLimit=-checkB;
        armBccw.SendToNXT();       
    end
    
    armAcw.WaitFor();
    armBcw.WaitFor();
    dataA=armAcw.ReadFromNXT();
    fprintf('%d \n',dataA.Position);
    dataB=armBcw.ReadFromNXT();
    fprintf('%d \n',dataB.Position);
    yOrn.ans = input('continue?:','s');
end