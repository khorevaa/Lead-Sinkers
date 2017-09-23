﻿
Procedure Init(BSLParser) Export
	
EndProcedure // Init() 

Function Interface() Export
	Var Interface;
	Interface = New Array;
	Interface.Add("VisitStringExpr");
	Return Interface;
EndFunction // Interface() 

Procedure VisitStringExpr(Decl) Export
	For Each Expr In Decl.List Do 
		If Find(Expr.Value, "http") Then 
			Message(StrTemplate("В коде не должно быть ссылок, строка - %1" "", Expr.Place.Line));
		EndIf;
	EndDo;
EndProcedure // VisitStringExpr()