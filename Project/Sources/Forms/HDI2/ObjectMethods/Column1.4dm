

Case of 
	: (Form event code:C388=On Header Click:K2:40)
		
		If (sortByName=1)
			
			sortByName:=2
			Form:C1466.People:=Form:C1466.People.orderBy("name desc")
			
		Else 
			
			sortByName:=1
			Form:C1466.People:=Form:C1466.People.orderBy("name asc")
			
		End if 
		
End case 

