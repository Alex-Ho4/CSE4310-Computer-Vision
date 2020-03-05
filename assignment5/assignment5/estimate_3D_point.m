function result = estimate_3D_point(c1, c2, u1, v1, u2, v2)

% Calculate point on line L1 

AL1 = [(c1(1,2) - c1(3,2)*u1) , (c1(1,3) - c1(3,3)*u1) ; ...
       (c1(2,2) - c1(3,2)*v1) , (c1(2,3) - c1(3,3)*v1) ];
 
xL1_1 = 1;
xL1_2 = 10;

BL1_1 = [c1(3,1)*xL1_1*u1 + u1 - c1(1,1)*xL1_1 - c1(1,4) ; ...
         c1(3,1)*xL1_1*v1 + v1 - c1(2,1)*xL1_1 - c1(2,4) ];
 
BL1_2 = [c1(3,1)*xL1_2*u1 + u1 - c1(1,1)*xL1_2 - c1(1,4) ; ...
         c1(3,1)*xL1_2*v1 + v1 - c1(2,1)*xL1_2 - c1(2,4) ];
 
WL1_2 = AL1 \ BL1_2;
WL1_1 = AL1 \ BL1_1;

c1_p1 = [xL1_1; WL1_1];
c1_p2 = [xL1_2; WL1_2];

% Calculate point on line L2

AL2 = [(c2(1,2) - c2(3,2)*u2) , (c2(1,3) - c2(3,3)*u2) ; ...
       (c2(2,2) - c2(3,2)*v2) , (c2(2,3) - c2(3,3)*v2) ];
 
xL2_1 = 1;
xL2_2 = 10;

BL2_1 = [c2(3,1)*xL2_1*u2 + u2 - c2(1,1)*xL2_1 - c2(1,4) ; ...
         c2(3,1)*xL2_1*v2 + v2 - c2(2,1)*xL2_1 - c2(2,4) ];
 
BL2_2 = [c2(3,1)*xL2_2*u2 + u2 - c2(1,1)*xL2_2 - c2(1,4) ; ...
         c2(3,1)*xL2_2*v2 + v2 - c2(2,1)*xL2_2 - c2(2,4) ];

WL2_1 = AL2 \ BL2_1;
WL2_2 = AL2 \ BL2_2;

c2_p1 = [xL2_1; WL2_1];
c2_p2 = [xL2_2; WL2_2];

% Get P1 and P2

P1 = c1_p1;
uL1 = (c1_p2 - c1_p1);

P2 = c2_p2;
uL2 = (c2_p2 - c2_p1);

% Calculate a1 and a2

A = [uL1'*uL1 , -uL2'*uL1 ; uL1'*uL2, -uL2'*uL2];
B = [P2'*uL1 - P1'*uL1 ; P2'*uL2 - P1'*uL2];

W = A \ B;

% Get intersection

result = ( (P1 + W(1)*uL1) + (P2 + W(2)*uL2) ) / 2;