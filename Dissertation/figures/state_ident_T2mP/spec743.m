(* ::Package:: *)

BeginPackage["SpinIdentSpec743`"];

SetDirectory[NotebookDirectory[]];
Get["jlabColors`"];

P0mp::usage = "[rounding radius, scatter, xpos, xw ] 0-+";

(* negative parity *)
PA1mP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PA2mP::usage =  "[rounding radius, scatter, xpos, xw ]";
PEmP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT1mP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT2mP::usage =  "[rounding radius, scatter, xpos, xw ] ";

PA1mM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PA2mM::usage =  "[rounding radius, scatter, xpos, xw ]";
PEmM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT1mM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT2mM::usage =  "[rounding radius, scatter, xpos, xw ] ";

(* pos parity *)
PA1pP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PA2pP::usage =  "[rounding radius, scatter, xpos, xw ]";
PEpP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT1pP::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT2pP::usage =  "[rounding radius, scatter, xpos, xw ] ";

PA1pM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PA2pM::usage =  "[rounding radius, scatter, xpos, xw ]";
PEpM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT1pM::usage =  "[rounding radius, scatter, xpos, xw ] ";
PT2pM::usage =  "[rounding radius, scatter, xpos, xw ] ";

scaleFactorMeV::usage = "scale to physical units";
scaleFactorGeV::usage = "scale to physical units";




Begin["Private`"];

(* move to MeV *)
scaleFactorMeV = 702/0.1484;
scaleFactorGeV = scaleFactorMeV/1000; 


J0 = jlabDarkGray;
J1 = jlabRed;
J2 = jlabGreen;
J3 = jlabBlue;
J4 = jlabOrange;
JQ= jlabPurple;
JE = Black; 

(* move to boxplot input format  -- error is variance!! *) 
Scatter[ ele_, r_, s_, x_, xw_ ] := 
	Module[ {elem}, 
		elem = {x + Random[Real,{-s,s}],
				 scaleFactorMeV*ele[[1]],
				xw,
				scaleFactorMeV*ele[[2]],
				If[Length[ele] == 2, JE, ele[[3]]],
				r};
		elem
		]
ScatterList[l_,r_,s_,x_,xw_] := Table[ Scatter[l[[i]],r,s,x,xw], {i,Length[l]}] ;
 



(* a blind extractoion with t0 = 6 *)
(* neg parity *) 
	(*neg g-parity *)


lA1mM = {{0.1484, 0.0001,J0},
{0.3677,0.0011,J0}, 
{0.4454,0.0067,J0},
{0.5324,0.0067,J0},
{0.5973,0.0065,J0}, 
{0.6028,0.0107,J4}}; 

lT1mM = {{0.4566,0.0050,J1},
{0.5439,0.0228,J1}, 
{0.5723,0.0100,J1},
{0.5903,0.0053,J4},
{0.6414,0.0080,J3}};

lT2mM = {{0.4256,0.0014,J2},
{0.5052,0.0053,J2},
{0.5489,0.0090,J2},
{0.5964,0.0098,J4},
{0.6244,0.0148,JQ}};

lEmM = {{0.4259,0.0019,J2}, 
{0.5072,0.0056,J2},
{0.5772,0.0053,J2},
{0.5974,0.0100,J4},
{0.6284,0.0090,J2}};

lA2mM = {{0.6648,0.0100,J3}};



	(* pos g-parity *)
lA1mP = {{0.5491,0.0143,J0},
{0.5848,0.0059,J4},
{0.6838,0.0108,J0}};


lA2mP = {{0.4268,0.0036,J3},
{0.5794,0.0080,J3},
{0.6503,0.0200,J3}};

lEmP = {{0.4245,0.0051,J2},
{0.5630,0.0080,J4},
{0.5568,0.0065,J2},
{0.6393,0.0078,J2}};


lT1mP = {{0.2160,0.0003,J1},
{0.3978,0.0030,J1},
{0.4191,0.0016,J1},
{0.4283,0.0050,J3},
{0.4810,0.0044,J1},
{0.5393,0.0041,J1},
{0.5420,0.0041,J1},
{0.5751,0.0048,J3},
{0.5975,0.0088,J4}};




lT2mP = {{0.4230,0.0012,J2},
{0.4253,0.0027,J3},
{0.5743,0.0080,J2},
{0.5711,0.0080,J4},
{0.5725,0.0050,J3},
{0.6296,0.0053,J2},
{0.6563,0.0093,J3}}; 




(* pos parity *) 
	(*neg g-parity *)

lA1pM = {{0.2964,0.0011,J0},
{0.4587,0.0029,J0},
{0.5007,0.0082,J4}};
(* more poorly resolved junk up higher *)

lA2pM = {{0.5099,0.0031,J3},
{0.6966,0.0100,J3}};


lEpM = {{0.3381,0.0012,J2},
{0.4878,0.0039,J2},
{0.4993,0.0100,J2},
{0.4909,0.0080,J4},
{0.5769,0.0090,J2},
{0.6196,0.0134,J2}};



lT1pM = {{0.3218,0.0009,J1},
{0.4782,0.0030,J1},
{0.5113,0.0040,J3},
{0.4828,0.0090,J4},
{0.5271,0.0090,J1},
{0.5448,0.0108,J1},
{0.5776,0.0157,J1}};
(* more poorly resolved junk up higher *)

lT2pM = {{0.3372,0.0009,J2},
{0.4807,0.0080,J2},
{0.4995,0.0040,J2},
{0.5071,0.0040,J4},
{0.5052,0.0080,J3},
{0.5541,0.0090,J2}};
(* more poorly resolved junk up higher *)



	(* pos g-parity *)
lA1pP = {{0.5123,0.0037,J0},
{0.6806,0.0053,J0}};

lA2pP = {{0.5052,0.0035,J3},
{0.5857,0.0070,J3}};


lEpP = {{0.5392,0.0053,J2},
{0.5548,0.0088,J2},
{0.6099,0.0167,J2}};
(* more poorly resolved junk up higher *)


lT1pP = {{0.3276,0.0008,J1},
{0.4720,0.0055,J1},
{0.4894,0.0090,J3},
{0.5068,0.0032,J1},
{0.5487,0.0150,J1},
{0.5439,0.0090,J1},
{0.5336,0.0126,J3}};
(* more poorly resolved junk up higher *)

lT2pP = {{0.4970,0.0080,J3},
{0.5180,0.0075,J2},
{0.5634,0.0120,J2},
{0.5769,0.0057,J3}};
(* more poorly resolved junk up higher *)





PA1mM[r_,s_,x_,xw_] := ScatterList[lA1mM,r,s,x,xw];
PA2mM[r_,s_,x_,xw_] := ScatterList[lA2mM,r,s,x,xw];
PEmM[r_,s_,x_,xw_] := ScatterList[lEmM,r,s,x,xw];
PT1mM[r_,s_,x_,xw_] := ScatterList[lT1mM,r,s,x,xw];
PT2mM[r_,s_,x_,xw_] := ScatterList[lT2mM,r,s,x,xw];

PA1mP[r_,s_,x_,xw_] := ScatterList[lA1mP,r,s,x,xw];
PA2mP[r_,s_,x_,xw_] := ScatterList[lA2mP,r,s,x,xw];
PEmP[r_,s_,x_,xw_] := ScatterList[lEmP,r,s,x,xw];
PT1mP[r_,s_,x_,xw_] := ScatterList[lT1mP,r,s,x,xw];
PT2mP[r_,s_,x_,xw_] := ScatterList[lT2mP,r,s,x,xw];

PA1pM[r_,s_,x_,xw_] := ScatterList[lA1pM,r,s,x,xw];
PA2pM[r_,s_,x_,xw_] := ScatterList[lA2pM,r,s,x,xw];
PEpM[r_,s_,x_,xw_] := ScatterList[lEpM,r,s,x,xw];
PT1pM[r_,s_,x_,xw_] := ScatterList[lT1pM,r,s,x,xw];
PT2pM[r_,s_,x_,xw_] := ScatterList[lT2pM,r,s,x,xw];

PA1pP[r_,s_,x_,xw_] := ScatterList[lA1pP,r,s,x,xw];
PA2pP[r_,s_,x_,xw_] := ScatterList[lA2pP,r,s,x,xw];
PEpP[r_,s_,x_,xw_] := ScatterList[lEpP,r,s,x,xw];
PT1pP[r_,s_,x_,xw_] := ScatterList[lT1pP,r,s,x,xw];
PT2pP[r_,s_,x_,xw_] := ScatterList[lT2pP,r,s,x,xw];


End[]
EndPackage[]



