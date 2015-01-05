(* ::Package:: *)

BeginPackage["SpinIdentSpec743`"];

SetDirectory[NotebookDirectory[]];
Get["jlabColors`"];

P0mp::usage = "[rounding radius, scatter, xpos, xw ] 0-+";

(* negative parity *)
PA1mP::usage =  "[rounding radius, scatter, xpos, xw ] A1mP";

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

lA1mP = {{0.148382, 0.000125406 , SwaveColor}, 
		{0.36834, 0.00141064,SwaveColor}, 
		{ 0.456327, 0.00254573,HybridColor}}; 



PA1mP[r_,s_,x_,xw_] := ScatterList[lA1mP,r,s,x,xw];

End[]
EndPackage[]



