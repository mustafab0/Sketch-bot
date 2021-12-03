COM_CloseNXT all
sb=COM_OpenNXT();
COM_SetDefaultNXT(sb);
mC=NXTMotor('C','TachoLimit',0,'ActionAtTachoLimit','Holdbrake');
mC.SendToNXT();
mC.WaitFor();
mA=NXTMotor('A','Power',40,'TachoLimit',20);
mA.SendToNXT();
mB=NXTMotor('B','Power',30,'TachoLimit',45,'SmoothStart',true);
mB.SendToNXT();
pause(2);
data1=mA.ReadFromNXT;
data2=mB.ReadFromNXT;
disp(sprintf('%f',data1.Position)); 
disp(sprintf('%f',data2.Position)); 