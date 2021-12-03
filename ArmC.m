COM_CloseNXT all
sb=COM_OpenNXT();
COM_SetDefaultNXT(sb);
powerC=10;
armCup= NXTMotor('C','Power',-powerC); %only for arm C
armCdown= NXTMotor('C','Power',powerC); %only for arm C
ud=input('Up or down: \n');
if ud==1
    armCup.TachoLimit= 90;
    armCup.SendToNXT();
elseif ud==0
    armCdown.Tacholimit=90;
    armCdown.SendToNXT();
end
