(* ::Package:: *)

BeginPackage["FormFactorPlotter`"]


Needs["ErrorBarPlots`"]

DataParser::usage="[input from formfactor]";
FormFactorPlotMarkers::usage="[marksz]";


Begin["Private`"]


markers= {"\[FilledCircle]","\[FilledSquare]","\[FilledDiamond]","\[FilledUpTriangle]","\[FilledDownTriangle]","\[EmptyCircle]","\[EmptySquare]","\[EmptyDiamond]","\[EmptyUpTriangle]","\[EmptyDownTriangle]"};
FormFactorPlotMarkers[marksz_] := Table[ {markers[[i]],marksz},{i,Length[markers]}];

DataParser[input_] := 
  Module[{outputd,outputl,o},

	outputd = Table[ {{input[[i]][[3]],input[[i]][[6]]}, ErrorBar[input[[i]][[4]],input[[i]][[7]]]}
						 , {i,Length[input]} 
					];
 
	outputl = Table[{ 
					{input[[i]][[9]],input[[i]][[10]],input[[i]][[11]],input[[i]][[12]]}, (*left*)
					{   input[[i]][[18]],                     (*photon*)
						input[[i]][[14]] - input[[i]][[10]],  (*pf - pi*)
						input[[i]][[15]] - input[[i]][[11]],
						input[[i]][[16]] - input[[i]][[12]]
					},
					{input[[i]][[13]],input[[i]][[14]],input[[i]][[15]],input[[i]][[16]]} (*right*)
					}
				 , {i,Length[input]}];


	o = {outputd,outputl};
	
	Return[o];
];
		


End[]
EndPackage[]









