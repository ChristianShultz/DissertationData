(* ::Package:: *)

BeginPackage["ContaminationA1mM`"];

SetDirectory[NotebookDirectory[]];
Get["jlabColors`"];
Get["SpinIdentSpec743`"];

A1mMData::usage= "Table - []";


Begin["Private`"];



(* state, m, merr, mp, mperr *)
 A1mMData = { {0,0.1483,0.0001,0.724,0.033},
    {1,0.3683,0.0014,0.905,0.010},
    {2,0.4563,0.0025,1.013,0.015},
    {3,0.5292,0.0046,1.014,0.013},
    {4,0.5993,0.0062,1.192,0.046},
    {5,0.6022,0.0045,1.256,0.016},
    {6,0.6055,0.0087,5.262,2.504},
    {7,0.6772,0.0138,1.293,0.085},
    {8,0.7056,0.0089,1.347,0.038},
    {9,0.7134,0.0151,3.614,1.048},
    {10,reset,NULL,NULL,NULL},
    {11,failed,NULL,NULL,NULL}};
    
    
    



End[]
EndPackage[]



