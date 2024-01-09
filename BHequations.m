





SlipSystem = struct('n',zeros(1,3),'b',zeros(1,3));

SlipSystem(1).n=[1,1,1]; SlipSystem(1).b =[0,-1,1];%
SlipSystem(2).n=[1,1,1]; SlipSystem(2).b =[-1,0,1];%a2
SlipSystem(3).n=[1,1,1]; SlipSystem(3).b =[-1,1,0];
SlipSystem(4).n=[-1,1,1]; SlipSystem(4).b =[1,1,0];
SlipSystem(5).n=[-1,1,1];SlipSystem(5).b =[1,0,1];% c2
SlipSystem(6).n=[-1,1,1];SlipSystem(6).b =[0,-1,1];
SlipSystem(7).n=[1,-1,1]; SlipSystem(7).b =[1,1,0];%d3
SlipSystem(8).n=[1,-1,1]; SlipSystem(8).b =[-1,0,1];%d2
SlipSystem(9).n=[1,-1,1]; SlipSystem(9).b =[0,1,1];
SlipSystem(10).n=[1,1,-1];SlipSystem(10).b =[-1,1,0];
SlipSystem(11).n=[1,1,-1]; SlipSystem(11).b=[1,0,1];
SlipSystem(12).n=[1,1,-1]; SlipSystem(12).b =[0,1,1];%b1


SlipSystem(13).n=[1,1,1]; SlipSystem(13).b =[0,1,-1];%a1
SlipSystem(14).n=[1,1,1]; SlipSystem(14).b =[1,0,-1];
SlipSystem(15).n=[1,1,1]; SlipSystem(15).b =[1,-1,0];%a3
SlipSystem(16).n=[-1,1,1]; SlipSystem(16).b =[-1,-1,0];%c3
SlipSystem(17).n=[-1,1,1];SlipSystem(17).b =[-1,0,-1];
SlipSystem(18).n=[-1,1,1];SlipSystem(18).b =[0,1,-1];%c1
SlipSystem(19).n=[1,-1,1]; SlipSystem(19).b =[-1,-1,0];
SlipSystem(20).n=[1,-1,1]; SlipSystem(20).b =[1,0,-1];
SlipSystem(21).n=[1,-1,1]; SlipSystem(21).b =[0,-1,-1];%d1
SlipSystem(22).n=[1,1,-1];SlipSystem(22).b =[1,-1,0];%b3
SlipSystem(23).n=[1,1,-1]; SlipSystem(23).b=[-1,0,-1];%b2
SlipSystem(24).n=[1,1,-1]; SlipSystem(24).b =[0,-1,-1];

fid= fopen('BHEQs.txt','a+');
fprintf(fid,'\n s11 s22 s33 s23 s13 s12 \n');

for i=1:1:24
    x11 = (SlipSystem(i).n(1)*SlipSystem(i).b(1));
    x12 = (SlipSystem(i).n(1)*SlipSystem(i).b(2));
    x13 = (SlipSystem(i).n(1)*SlipSystem(i).b(3));
    x21 = (SlipSystem(i).n(2)*SlipSystem(i).b(1));
    x22 = (SlipSystem(i).n(2)*SlipSystem(i).b(2));
    x23 = (SlipSystem(i).n(2)*SlipSystem(i).b(3));
    x31 = (SlipSystem(i).n(3)*SlipSystem(i).b(1));
    x32 = (SlipSystem(i).n(3)*SlipSystem(i).b(2));
    x33 = (SlipSystem(i).n(3)*SlipSystem(i).b(3));
    
    x12_ = x12 + x21; x13_=x13+x31; x23_=x23+x32;
    

fprintf(fid,'  %d   %d   %d   %d   %d   %d \n',x11,x22,x33,x23_,x13_,x12_);

end
save('BHEQs')




