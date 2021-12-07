//%attributes = {}


$es:=ds:C1482.Lessons.all().drop()


$_languages:=ds:C1482.Language.all()

For each ($language; $_languages)
	
	// find  one, two or three professors
	$endloop:=(Random:C100%4)+1  // 1…4
	//$n:=1
	For ($loop; 1; $endloop)
		
		//$_professors:=ds.People.query("teaching is NULL")
		$_professors:=ds:C1482.People.query("teaching IS null OR teaching.language.name # :1"; $language.name)
		
		$n:=$_professors.length
		$professor:=$_professors[Random:C100%$n]
		
		// find possible students
		$_students:=ds:C1482.People.query("ID # :1"; $professor.ID)
		
		// create 15 lessons/students for each professor
		For ($i; 1; 10)
			
			$lesson:=ds:C1482.Lessons.new()
			
			$lesson.language:=$language
			$lesson.professor:=$professor
			
			$n:=$_students.length
			$student:=$_students[Random:C100%$n]
			
			$lesson.student:=$student
			
			$_students:=$_students.minus($student)
			
			$lesson.save()
			
		End for 
		
	End for 
	
End for each 


