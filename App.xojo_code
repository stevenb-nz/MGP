#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if mgpDB <> nil then
		    mgpDB.Close
		  end
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim tables As RecordSet
		  
		  mgpDB = new SQLiteDatabase
		  mgpDB.DatabaseFile = SpecialFolder.Desktop.Child("MGP.sqlite")
		  if mgpDB.CreateDatabaseFile then
		    tables = mgpDB.TableSchema
		    If tables <> Nil Then
		      if tables.eof then
		        addTables
		      end if
		      tables.close
		    End If
		  else
		    MsgBox "Something went wrong creating a new database file."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addtables()
		  mgpDB.SQLExecute("CREATE TABLE scores (id Integer, combo VarChar NOT NULL, frequency Integer, score Integer, PRIMARY KEY(id));")
		  
		  mgpDB.Commit()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub db_add_play(play as string, score as integer)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mgpDB As SQLiteDatabase
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="mgpDB"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
