(* ::Package:: *)

BeginPackage["boxPlot`"]
singleBox::usage ="[x,y,xw,yw,c,r] x,y are center, c is color, r is rounding radius, xw and yw are x and y widths";
boxStack::usage = "pass an array of single box inputs";


Begin["Private`"]

singleBox[x_,y_,xw_,yw_,c_,r_] := 
Module[ {g}, 
	g =  Graphics[{
			EdgeForm[Directive[Thin,c]],
			Lighter[c],
			Rectangle[{x-xw/2.,y-yw/2.},{x+xw/2.,y+yw/2.},RoundingRadius->r]}];
	g
]

sBox[l_] := singleBox[l[[1]],l[[2]],l[[3]],l[[4]],l[[5]],l[[6]]]

boxStack[l_ ] := 
Module[ {g,gx},
	g = Table[ sBox[l[[i]]],{i,Length[l]}];
	gx = Show[g];
	gx
]

End[]
EndPackage[]









