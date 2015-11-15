(* ::Package:: *)

BeginPackage["jlabColors`"]
jlabColorTable::usage = "color table"
jlabRed::usage      ="color - #C0272D";
jlabOrange::usage   ="color - #F96600";
jlabBlue::usage     ="color - #2F7A79";
jlabGreen::usage    ="color - #417D0A";
jlabLightGray::usage="color - #E5E5E5";
jlabPurple::usage   ="color - #800080";
jlabDarkGray::usage ="color - #7D8288"; 


Begin["Private`"]

hexToRGB=RGBColor@@(IntegerDigits[
			ToExpression@StringReplace[#,"#"->"16^^"]
			,256
			,3]/255.)&;

jlabRed       =hexToRGB["#C0272D"];
jlabOrange    =hexToRGB["#F96600"];
jlabBlue      =hexToRGB["#2F7A79"];
jlabGreen     =hexToRGB["#417D0A"];
jlabLightGray =hexToRGB["#E5E5E5"];
jlabPurple    =hexToRGB["#800080"];
jlabDarkGray  =hexToRGB["#7D8288"];

jlabColorTable = {jlabRed,
				jlabOrange,
				jlabBlue,
				jlabGreen,
				jlabLightGray,
				jlabPurple,
				jlabDarkGray};

End[]
EndPackage[]



