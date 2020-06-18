#tag Module
Protected Module Gaddagmodule
	#tag Method, Flags = &h0
		Function gaddag_endword(node as uint32) As boolean
		  gaddag.Position = node*109+108
		  if gaddag.read(1) = "0" then
		    return false
		  else
		    return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function gaddag_nextnode(node as uint32, letter as string) As UInt32
		  gaddag.Position = node*109+(asc(lowercase(letter))-96)*4
		  return gaddag.ReadUInt32
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initgaddag()
		  gaddag = SpecialFolder.Preferences.child("gaddagfile").openasbinaryFile(false)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		gaddag As BinaryStream
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
