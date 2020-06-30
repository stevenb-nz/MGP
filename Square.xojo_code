#tag Class
Protected Class Square
	#tag Property, Flags = &h0
		anchor As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		face As String
	#tag EndProperty

	#tag Property, Flags = &h0
		lettermult As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		partials_h As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		partials_v As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		part_scores_h(51) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		part_scores_v(51) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		wordmult As Integer
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
		#tag ViewProperty
			Name="wordmult"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lettermult"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
