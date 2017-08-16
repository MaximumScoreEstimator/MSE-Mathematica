(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
Echo["Loaded dataArray.m"];


(* ::Input::Initialization:: *)
ClearAll[CdataArray];
CdataArray::usage="CdataArray[payoffMatrix,xlist,printflag] creates the dataArray. It works either using the \"Speed\" model or the \"Memory\" model. It uses ineqmembers and Cinequalities internally and for the memory model it erases ineqmembers after use.";
CdataArray[payoffMatrix_,xlist_,printflag_:False]:=Module[{dataarray,head},
dataarray=Cinequalities[payoffMatrix[[##]]&,ineqmembers];If[printflag,Print[1,"  ",{ByteCount@dataarray,MemoryInUse[],MaxMemoryUsed[]}]];

Switch[MSEresources,
"Memory",head=Uncompress;ClearAll[ineqmembers],
"Speed",head=Identity;
];

groupIDs=
Developer`ToPackedArray[
Flatten[MapIndexed[Table[#2,{#1}]&,Length[head@#]&/@dataarray],1]
];
If[printflag,Print[2,"  ",{ByteCount@groupIDs,MemoryInUse[],MaxMemoryUsed[]}]];

dataarray=(head/@dataarray);If[printflag,Print[3,"  ",{ByteCount@dataarray,MemoryInUse[],MaxMemoryUsed[]}]];

dataarray=Flatten@dataarray;If[printflag,Print[4,"  ",{ByteCount@dataarray,MemoryInUse[],MaxMemoryUsed[]}]];
dataarray=Flatten@Normal@CoefficientArrays[#,xlist]&/@dataarray;If[printflag,Print[5,"  ",{ByteCount@dataarray,MemoryInUse[],MaxMemoryUsed[]}]];

Scan[If[Length[dataarray[[#]]]==1,dataarray[[#]]=PadRight[dataarray[[#]],Length[xlist]+1,0]]&,Range@Length@dataarray];If[printflag,Print[6,"  ",{ByteCount@dataarray,MemoryInUse[],MaxMemoryUsed[]}]];

dataArray=Developer`ToPackedArray[dataarray,Real]
];
Information[CdataArray,LongForm->False]
