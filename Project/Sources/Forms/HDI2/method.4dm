Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.Lessons:=ds:C1482.Lessons.all()
		Form:C1466.People:=ds:C1482.People.all()
		
		
		Form:C1466.tabs:=New object:C1471
		Form:C1466.tabs.values:=New collection:C1472("info"; "Lessons"; "People")
		Form:C1466.tabs.index:=0
		
		Form:C1466.trace:=False:C215
		
		LISTBOX SELECT ROW:C912(*; "LB_People"; 1; lk replace selection:K53:1)
		
End case 