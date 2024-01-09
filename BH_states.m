function [state]=BH_states(constraints)

%% This function calculates the Bishop Hill stress states



R = [-1,-0.5,0,0.5,1];

c=0;
a=zeros(12,1);
%state=zeros(:,6);
% constraints=4;


                for i=1:1:5
                    A=R(i);

                    for j=1:1:5
                         B= R(j);

                         for k=1:1:5
                             C=R(k);

                             for l=1:1:5
                                 F=R(l);

                                 for m=1:1:5
                                     G=R(m);

                                     for n=1:1:5
                                         H=R(n);


                                        a(1)=abs(A+G-H);
                                        a(2)=abs(A-G+H); 
                                        a(3)=abs(A-G-H);
                                        a(4)=abs(A+G+H);

                                        a(5)=abs(B+F+H);
                                        a(6)=abs(B+F-H);
                                        a(7)=abs(B-F+H);
                                        a(8)=abs(B-F-H);

                                        a(9)=abs(C+F+G);
                                        a(10)=abs(C+F-G);
                                        a(11)=abs(C-F+G);
                                        a(12)=abs(C-F-G);

                                        ok = (a(1)<=1)&&(a(2)<=1)&&(a(3)<=1)&&(a(4)<=1)&&(a(5)<=1)&&(a(6)<=1)&&(a(7)<=1)&&(a(8)<=1)&&(a(9)<=1)&&(a(10)<=1)&&(a(11)<=1)&&(a(12)<=1);
                                        sum=0;
                                            for t=1:1:12
                                                if a(t)==1
                                                    sum=sum+1;
                                                end
                                            end
                                                
                                        
                                        if ((ok==1)&&(sum>=constraints))&&(A+B+C==0) 
                                            c=c+1;
                                            state(c,:)=[A,B,C,F,G,H];
                                        end
                                     end
                                 end
                             end
                         end
                    end
                end
end

