(* ::Package:: *)

BeginPackage["D2PSpec743`"];

SetDirectory[NotebookDirectory[]];
Get["jlabColors`"];
Get["SpinIdentSpec743`"];
 
D2A1PBoxes::usage = "[rounding radius, scatter, xpos, xw ] ";
D2A2PBoxes::usage = "[rounding radius, scatter, xpos, xw ] ";
D2B1PBoxes::usage = "[rounding radius, scatter, xpos, xw ] ";
D2B2PBoxes::usage = "[rounding radius, scatter, xpos, xw ] ";



Begin["Private`"];


(* move to boxplot input format  -- error is variance!! *) 
Scatter[ ele_, r_, s_, x_, xw_ ] := 
	Module[ {elem}, 
		elem = {x + Random[Real,{-s,s}], scaleFactorMeV*ele[[1]],xw,scaleFactorMeV*ele[[2]],ele[[3]],r};
		elem
		]
ScatterList[l_,r_,s_,x_,xw_] := Table[ Scatter[l[[i]],r,s,x,xw], {i,Length[l]}] ;

A1Color = jlabPurple;
B1Color = jlabRed;
B2Color = jlabGreen;
A2Color = jlabBlue;
C2 = jlabOrange;
U1= jlabDarkGray;
 

D2A1PL = {{0.267284, 0.000342214, A1Color}, 
		{0.4292,0.0031,A1Color},
		{0.4575,0.0043,A1Color}, 
		{0.4459,0.0039,A1Color}, 
		{0.4542,0.0017,A1Color},
		{0.4543,0.0059,A1Color},
		{0.4575,0.0043,A1Color}}; 

D2A2PL = {{0.3652,0.0012,A2Color},
		{0.4498,0.0031,A2Color}}; 

D2B1PL = {{0.268492, 0.000316493, B1Color},
		{0.3664,0.0014,B1Color},
		{0.4293,0.002,B1Color}}; 


D2B2PL = {{0.268888, 0.000318727, B2Color}, 
		{0.3648,0.0013,B2Color}, 
		{0.4298, 0.017, B2Color}}; 



D2A1PBoxes[r_,s_,x_,xw_] := ScatterList[D2A1PL,r,s,x,xw]
D2A2PBoxes[r_,s_,x_,xw_] := ScatterList[D2A2PL,r,s,x,xw]
D2B1PBoxes[r_,s_,x_,xw_] := ScatterList[D2B1PL,r,s,x,xw]
D2B2PBoxes[r_,s_,x_,xw_] := ScatterList[D2B2PL,r,s,x,xw]



End[]
EndPackage[]



