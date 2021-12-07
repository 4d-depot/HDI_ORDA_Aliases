$menu:=Create menu:C408


APPEND MENU ITEM:C411($menu; "Find people who learn Spanish")
SET MENU ITEM PARAMETER:C1004($menu; -1; "1")

APPEND MENU ITEM:C411($menu; "Find people who teach Esperanto")
SET MENU ITEM PARAMETER:C1004($menu; -1; "2")

APPEND MENU ITEM:C411($menu; "Find people who teach to Sylvie")
SET MENU ITEM PARAMETER:C1004($menu; -1; "3")

APPEND MENU ITEM:C411($menu; "Find people who follow Zaven's lessons")
SET MENU ITEM PARAMETER:C1004($menu; -1; "4")

APPEND MENU ITEM:C411($menu; "Find people who learn German and Arabic")
SET MENU ITEM PARAMETER:C1004($menu; -1; "5")

APPEND MENU ITEM:C411($menu; "-")
APPEND MENU ITEM:C411($menu; "Reset")
SET MENU ITEM PARAMETER:C1004($menu; -1; "99")


$choice:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)

If (Form:C1466.trace)
	TRACE:C157
End if 

Case of 
		
	: ($choice="1")
		Form:C1466.People:=ds:C1482.People.query("followedLessons.name = :1 "; "Spanish")
		
	: ($choice="2")
		Form:C1466.People:=ds:C1482.People.query("givenLessons.name = :1"; "Esperanto")
		
	: ($choice="3")
		Form:C1466.People:=ds:C1482.People.query("students.name = :1"; "Sylvie")
		
	: ($choice="4")
		Form:C1466.People:=ds:C1482.People.query("professors.name = :1"; "Zaven")
		
	: ($choice="5")
		Form:C1466.People:=ds:C1482.People.query("followedLessons.name = :1"; "German").and(ds:C1482.People.query("followedLessons.name = :1"; "Arabic"))
		
		
	: ($choice="99")
		Form:C1466.People:=ds:C1482.People.all()
		
End case 

LISTBOX SELECT ROW:C912(*; "LB_People"; 1; lk replace selection:K53:1)
