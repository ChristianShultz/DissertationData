(* ::Package:: *)

BeginPackage["FitRegionPlotter`"]

ThreeRegionYErrorPlotter::usage = "[inp_,xscale_,yscale_,
						colorIn_,colorOut_,markerIn_,
						markerOut_,x1_,x2_,x3_,x4_]";

TwoRegionYErrorPlotter::usage = "[inp_,xscale_,yscale_,
						colorIn_,colorOut_,markerIn_,
						markerOut_,x1_,x2_,x3_]";

OneRegionYErrorPlotter::usage = "[inp_,xscale_,yscale_,
						colorIn_,markerIn_,
						x1_,x2_]";

OneRegionYErrorBandPlotter::usage = "[inp_,color_,opac_,x1_,x2_]"


ConstantPlot::usage = "[v_,verr_,color_,xl_,xh_]";
RightExponentialPlot::usage = "[A_,Aerr_,m_,merr_,color_,\[Delta]t_,tl_,th_]";
LeftExponentialPlot::usage = "[A_,Aerr_,m_,merr_,color_,tl_,th_]"
PrinCorrFitPlot::usage = "[A,Aerr,m,merr,mm,mmerr,color,t0,tl,th]";
WeightedPrinCorrFitPlot::usage = "[A,Aerr,m,merr,mm,mmerr,color,t0,tl,th,yl,yh,opacity]";

HackAxisData::usage = "Return the different regions of the ax plot in hack data format";
AxisInterpolatorPlot::usage = "[Data_,index1_,index2_,x1_,x2_,y1_,y2_,color_,opac_]"; 
AxisSmartInterpolatorPlot::usage = "[Data_,index1_,index2_,color_,opac_]"; 

FitRegionPlotMarkers::usage = "Plot markers [ marksize ]";

Needs["ErrorBarPlots`"]



Begin["Private`"]

markers= {"\[FilledCircle]","\[FilledSquare]","\[FilledDiamond]","\[FilledUpTriangle]","\[FilledDownTriangle]","\[EmptyCircle]","\[EmptySquare]","\[EmptyDiamond]","\[EmptyUpTriangle]","\[EmptyDownTriangle]"};
FitRegionPlotMarkers[marksz_] := Table[ {markers[[i]],marksz},{i,Length[markers]}];


(* data functions *)

YErrorData[inp_,xscale_,yscale_] := Table[{ {inp[[i]][[1]]*xscale,inp[[i]][[2]]*yscale},
						ErrorBar[inp[[i]][[3]]]*yscale},
					{i,Length[inp]}];
XYErrorData[inp_,xscale_,yscale_] := Table[{ {inp[[i]][[1]]*xscale,inp[[i]][[2]]*yscale},
						{ErrorBar[inp[[i]][[3]]]*xscale,ErrorBar[inp[[i]][[4]]]*yscale}},
					{i,Length[inp]}];

YErrorRegionPlotter[inp_,xscale_,yscale_,color_,marker_] := 
		Module[ {g,d},
			d = YErrorData[inp,xscale,yscale];
			g = ErrorListPlot[d,PlotStyle->color,PlotMarkers->marker];
			Return[g]];

XYErrorRegionPlotter[inp_,xscale_,yscale_,color_,marker_] := 
		Module[ {g,d},
			d = XYErrorData[inp,xscale,yscale];
			g = ErrorListPlot[d,PlotStyle->color,PlotMarkers->marker];
			Return[g]];

TestRegion[x_,low_,high_]:= If[ x >= low ,  
							If[ x <= high , True, False],
							False];

RegionBetwix[d_,low_,high_] := Module[ {g,b} ,
	g = {};
	b = {};
		For[ i = 1, i <= Length[d], ++i, 
		If[TestRegion[d[[i]][[1]],low,high],
			AppendTo[g,d[[i]]],
			Null]
		];
	Return[g];
]
			


(* data plotters *) 
ThreeRegionYErrorPlotter[inp_,xscale_,yscale_,
						colorIn_,colorOut_,markerIn_,
						markerOut_,x1_,x2_,x3_,x4_]:=
		Module[{r1,r2,r3,t1,t2,t3,g},
			t1 = RegionBetwix[inp,x1,x2]; 
			t2 = RegionBetwix[inp,x2+$MinMachineNumber,x3]; 
			t3 = RegionBetwix[inp,x3+$MinMachineNumber,x4]; 
			
			r1 = YErrorRegionPlotter[t1,xscale,yscale,colorOut,markerOut];
			r2 = YErrorRegionPlotter[t2,xscale,yscale,colorIn,markerIn];
			r3 = YErrorRegionPlotter[t3,xscale,yscale,colorOut,markerOut];

			g = Show[ r1, r2, r3, PlotRange->{ {x1,x4}, Automatic} ]; 
			g]; 


TwoRegionYErrorPlotter[inp_,xscale_,yscale_,
						colorIn_,colorOut_,markerIn_,
						markerOut_,x1_,x2_,x3_]:=
		Module[{r1,r2,t1,t2,g},
			t1 = RegionBetwix[inp,x1,x2]; 
			t2 = RegionBetwix[inp,x2+$MinMachineNumber,x3]; 
			
			r1 = YErrorRegionPlotter[t1,xscale,yscale,colorOut,markerOut];
			r2 = YErrorRegionPlotter[t2,xscale,yscale,colorIn,markerIn];

			g = Show[ r1, r2,  PlotRange->{ {x1,x3}, Automatic} ]; 
			g]; 


OneRegionYErrorPlotter[inp_,xscale_,yscale_,
						colorIn_,markerIn_,
						x1_,x2_]:=
		Module[{r1,t1,g},
			t1 = RegionBetwix[inp,x1,x2]; 
			
			r1 = YErrorRegionPlotter[t1,xscale,yscale,colorIn,markerIn];

			g = Show[ r1,   PlotRange->{ {x1,x2}, Automatic} ]; 
			g]; 

OneRegionYErrorBandPlotter[inp_,color_,opac_,x1_,x2_]:=
		Module[{r1,t1,g,I1,I2,Data1,Data2},
				
				Data1 = Table[ { inp[[i,1]], inp[[i,2]] + inp[[i,3]] } , {i,Length[inp]}];
				Data2 = Table[ { inp[[i,1]], inp[[i,2]] + inp[[i,3]] } , {i,Length[inp]}];

				I1 = Interpolation[ Table[ { inp[[i,1]], inp[[i,2]] + inp[[i,3]] } , {i,Length[inp]}]];
				I2 = Interpolation[ Table[ { inp[[i,1]], inp[[i,2]] - inp[[i,3]] } , {i,Length[inp]}]];
				g = Plot[ {I1[x], I2[x] }, {x,x1,x2},
						Filling->{1->{{2},Opacity[opac,Lighter[color]]}},
						PlotStyle->Opacity[0,color]];
				Return[g]
				]; 


(* functions *) 

ConstantFunction[x_,v_] := v
RightExponentialFunction[t_,A_,E_,\[Delta]t_]:= A*Exp[ -E * ( \[Delta]t - t ) ]
LeftExponentialFunction[t_,A_,E_]:= A*Exp[ -E * ( t ) ]
PrinCorrFunction[A_,m_,mm_,t0_,t_]:= (1 - A)*Exp[-m*(t-t0)] + A*Exp[-mm(t-t0)]
WeightedPrinCorrFunction[A_,m_,mm_,t0_,t_]:= Exp[m*(t-t0)]*PrinCorrFunction[A,m,mm,t0,t]



(* plotters *)
 
ConstantPlot[v_,verr_,color_,xl_,xh_]:= 
	Module[ {g}, 
		g = Plot[ {ConstantFunction[x,v+verr], ConstantFunction[x,v-verr],ConstantFunction[x,v]}, 
				{x,xl,xh},
				Filling->{1->{{2},color}},
				PlotStyle->Darker[color]];
		Return[g]
	]; 


			

RightExponentialPlot[A_,Aerr_,m_,merr_,color_,\[Delta]t_,tl_,th_]:= 
	Module[ {g}, 
		g = Plot[ {RightExponentialFunction[t,A+Aerr,m-merr,\[Delta]t],
					RightExponentialFunction[t,A-Aerr,m-merr,\[Delta]t],
					RightExponentialFunction[t,A,m,\[Delta]t]}, 
				{t,tl,th},
				Filling->{1->{{2},color}},
				PlotStyle->Darker[color]];
		Return[g]
	]; 

LeftExponentialPlot[A_,Aerr_,m_,merr_,color_,tl_,th_]:= 
	Module[ {g}, 
		g = Plot[ {LeftExponentialFunction[t,A+Aerr,m-merr],
					LeftExponentialFunction[t,A-Aerr,m-merr],
					LeftExponentialFunction[t,A,m]}, 
				{t,tl,th},
				Filling->{1->{{2},color}},
				PlotStyle->Darker[color]];
		Return[g]
	]; 


PrinCorrFitPlot[A_,Aerr_,m_,merr_,mm_,mmerr_,color_,t0_,tl_,th_]:=
 	Module[ {g}, 
		g = Plot[ {PrinCorrFunction[A+Aerr,m+merr,mm+mmerr,t0,t],
					PrinCorrFunction[A-Aerr,m-merr,mm-mmerr,t0,t],
					PrinCorrFunction[A,m,mm,t0,t]},
				{t,tl,th},
				Filling->{1->{{2},Opacity[0.2,Lighter[color]]}},
				PlotStyle->color];
		Return[g]
	]; 
WeightedPrinCorrFitPlot[A_,Aerr_,m_,merr_,mm_,mmerr_,color_,t0_,tl_,th_,yl_,yh_,opac_]:=
 	Module[ {g}, 
		g = Plot[ {WeightedPrinCorrFunction[A+Aerr,m+merr,mm+mmerr,t0,t],
					WeightedPrinCorrFunction[A-Aerr,m-merr,mm-mmerr,t0,t],
					WeightedPrinCorrFunction[A,m,mm,t0,t]},
				{t,tl,th},
				Filling->{1->{{2},Opacity[opac,Lighter[color]]}},
				PlotStyle->Opacity[0,color],
				PlotRange->{{tl,th},{yl,yh}}];
		Return[g]
	]; 




(* axis data hacker -- yikes! *) 

FitData[RawData_] := 
	Module [{HackData,FitData},
		FitData =  DeleteCases[RawData,{_String?(StringMatchQ[#,"#*"]&),___}];
		HackData = FitData/.{}->2000;
		Return[HackData]
	];

(* the dirty *)
HackTheData[input_] := 
	Module[{little,big},
		big = {};
		little={};
		For[i = 1, i <Length[input],i++,
			If[Depth[input[[i]]] == 2,
				AppendTo[little,input[[i]] ],
				AppendTo[big,little];
				little = {};
				]
			];
		Return[big];
	];

(* returns indexed data like in gnuplot ie: plot index i syle *)
HackAxisData[RawData_] := 
	Module[ {FitHack,HackHack} , 
		FitHack = FitData[RawData];
		HackHack = HackTheData[FitHack] //. {}->Sequence[]; 
		Return[HackHack]
	];  


AxisInterpolatorPlot[Data_,index1_,index2_,x1_,x2_,y1_,y2_,color_,opac_] :=
	Module[ {I1,I2,g},
		I1 = Interpolation[Data[[index1]]];
		I2 = Interpolation[Data[[index2]]];
		g = Plot[ {I1[x], I2[x] }, {x,x1,x2},
				Filling->{1->{{2},Opacity[opac,Lighter[color]]}},
				PlotStyle->Opacity[0,color],
				PlotRange->{{x1,x2},{y1,y2}}];
		Return[g]
	];



AxisSmartInterpolatorPlot[Data_,index1_,index2_,color_,opac_] :=
	Module[ {I1,I2,g,x1,x2,y1,y2,Y1,Y2},
    x1 = Data[[index1]][[1]][[1]]; 
    x2 = Data[[index1]][[ Length[Data[[index1]]] ]][[1]]; 

    Y1 = Table[ Data[[index1]][[i]][[2]] , {i,Length[Data[[index1]]]}];
    Y2 = Table[ Data[[index2]][[i]][[2]] , {i,Length[Data[[index2]]]}];

    y1 = Min[ Join[ Y1 , Y2 ] ];
    y2 = Max[ Join[ Y1 , Y2 ] ];

		I1 = Interpolation[Data[[index1]]];
		I2 = Interpolation[Data[[index2]]];
		g = Plot[ {I1[x], I2[x] }, {x,x1,x2},
				Filling->{1->{{2},Opacity[opac,Lighter[color]]}},
				PlotStyle->Opacity[0,color],
				PlotRange->{{x1,x2},{y1,y2}}];
		Return[g]
	];
			

End[]
EndPackage[]






