(* ::Package:: *)

BeginPackage["SpinIdentSpec743`"];

SetDirectory[NotebookDirectory[]];
Get["jlabColors`"];

P0mp::usage = "[rounding radius, scatter, xpos, xw ] 0-+";
P1mm::usage = "[rounding radius, scatter, xpos, xw ] 1--";
P2mm::usage = "[rounding radius, scatter, xpos, xw ] 2--";
P2mp::usage = "[rounding radius, scatter, xpos, xw ] 2-+";
P3mm::usage = "[rounding radius, scatter, xpos, xw ] 3--";
P4mp::usage = "[rounding radius, scatter, xpos, xw ] 4-+";

P0pp::usage = "[rounding radius, scatter, xpos, xw ] 0++";
P1pp::usage = "[rounding radius, scatter, xpos, xw ] 1++";
P1pm::usage = "[rounding radius, scatter, xpos, xw ] 1+-";
P2pp::usage = "[rounding radius, scatter, xpos, xw ] 2++";
P3pp::usage = "[rounding radius, scatter, xpos, xw ] 3++";
P3pm::usage = "[rounding radius, scatter, xpos, xw ] 3+-";
P4pp::usage = "[rounding radius, scatter, xpos, xw ] 4++";

P0pm::usage = "[rounding radius, scatter, xpos, xw ] 0+-";
P1mp::usage = "[rounding radius, scatter, xpos, xw ] 1-+";
P2pm::usage = "[rounding radius, scatter, xpos, xw ] 2+-";

D4A2Mp100::usage = "[rounding radius, scatter, xpos, xw ] D4A2Mp100 (t0=9)";

scaleFactorMeV::usage = "scale to physical units";
scaleFactorGeV::usage = "scale to physical units";




Begin["Private`"];

(* move to MeV *)
scaleFactorMeV = 702/0.1484;
scaleFactorGeV = scaleFactorMeV/1000; 


(* move to boxplot input format  -- error is variance!! *) 
Scatter[ ele_, r_, s_, x_, xw_ ] := 
	Module[ {elem}, 
		elem = {x + Random[Real,{-s,s}], scaleFactorMeV*ele[[1]],xw,scaleFactorMeV*ele[[2]],ele[[3]],r};
		elem
		]
ScatterList[l_,r_,s_,x_,xw_] := Table[ Scatter[l[[i]],r,s,x,xw], {i,Length[l]}] ;

SwaveColor = jlabRed;
PwaveColor = jlabGreen;
DwaveColor = jlabPurple;
FwaveColor = jlabOrange;
HybridColor = jlabBlue;
UnidentColor = jlabDarkGray;
 

(* neg parity *) 

l0mp = {{0.148382, 0.000125406 , SwaveColor}, 
		{0.36834, 0.00141064,SwaveColor}, 
		{ 0.456327, 0.00254573,HybridColor}}; 

l1mm = {{0.216292, 0.000254028, SwaveColor},
		{0.396776 , 0.00210031, SwaveColor},
		{0.419859, 0.00145692, DwaveColor},
		{ 0.482094, 0.0049341, HybridColor}}; 

l2mm = {{0.421616, 0.00207122, DwaveColor}};

l3mm = {{0.431547, 0.00295589, DwaveColor}}; 

l2mp = {{0.425774, 0.00214831, DwaveColor},
		{0.506741, 0.00679956,HybridColor}};

l4mp = {{0.602235, 0.0045797 , UnidentColor}};


(* pos parity *) 

l0pp = {{0.296355, 0.00113177, PwaveColor},
		{0.458181, 0.00310027, PwaveColor}};

l1pp = {{0.322229, 0.0010675,PwaveColor},
		{0.473114, 0.0028066,PwaveColor}}; 

l2pp = {{0.33719, 0.000917831, PwaveColor},
		{0.483673, 0.0132492, PwaveColor},
		{0.501548, 0.00388706, FwaveColor}}; 

l3pp = {{0.510582, 0.00331776, FwaveColor}}; 

l4pp = {{0.506137, 0.00790141, FwaveColor}}; 

l1pm = {{0.327647, 0.000802555, PwaveColor},
		{0.475688, 0.00454798, PwaveColor}};

l3pm = {{0.505553, 0.00357155, FwaveColor}};
		


(*exotics*) 

l0pm = {{0.509798, 0.00454121, HybridColor}};

l1mp = {{0.460384, 0.00286779, HybridColor}};

l2pm = {{0.532781, 0.00566776, HybridColor}};

(*lattice irreps*) 

lD4A2Mp100 = {{0.18684,0.00013,UnidentColor}, 
  {0.342143,0.001183,UnidentColor},
  {0.37963,0.002443,UnidentColor},
  {0.43823,0.002788,UnidentColor},
  {0.462734,0.006157,UnidentColor},
  {0.476809,0.008403,UnidentColor}};



P0mp[r_,s_,x_,xw_] := ScatterList[l0mp,r,s,x,xw];
P1mm[r_,s_,x_,xw_] := ScatterList[l1mm,r,s,x,xw];
P2mm[r_,s_,x_,xw_] := ScatterList[l2mm,r,s,x,xw];
P2mp[r_,s_,x_,xw_] := ScatterList[l2mp,r,s,x,xw];
P3mm[r_,s_,x_,xw_] := ScatterList[l3mm,r,s,x,xw];
P4mp[r_,s_,x_,xw_] := ScatterList[l4mp,r,s,x,xw];


P0pp[r_,s_,x_,xw_] := ScatterList[l0pp,r,s,x,xw]
P1pp[r_,s_,x_,xw_] := ScatterList[l1pp,r,s,x,xw]
P1pm[r_,s_,x_,xw_] := ScatterList[l1pm,r,s,x,xw]
P2pp[r_,s_,x_,xw_] := ScatterList[l2pp,r,s,x,xw]
P3pp[r_,s_,x_,xw_] := ScatterList[l3pp,r,s,x,xw]
P3pm[r_,s_,x_,xw_] := ScatterList[l3pm,r,s,x,xw]
P4pp[r_,s_,x_,xw_] := ScatterList[l4pp,r,s,x,xw]


P0pm[r_,s_,x_,xw_] := ScatterList[l0pm,r,s,x,xw]
P1mp[r_,s_,x_,xw_] := ScatterList[l1mp,r,s,x,xw]
P2pm[r_,s_,x_,xw_] := ScatterList[l2pm,r,s,x,xw]

D4A2Mp100[r_,s_,x_,xw_] := ScatterList[lD4A2Mp100,r,s,x,xw]

End[]
EndPackage[]



