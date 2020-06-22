#tag Class
Protected Class Rack
	#tag Method, Flags = &h0
		Function export() As String
		  dim s as string
		  dim i,j as integer
		  
		  for i = 0 to tiles.Ubound
		    for j = 1 to tiles(i).quantity
		      s = s + tiles(i).face
		    next
		  next
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub import(rack as String)
		  dim i as integer
		  dim s1,s2 as string
		  dim t as Tile
		  redim tiles(-1)
		  
		  for i = 1 to len(rack)
		    s2 = mid(rack,i,1)
		    if s1 = s2 then
		      tiles(UBound(tiles)).quantity = tiles(UBound(tiles)).quantity + 1
		    else
		      t = new Tile
		      t.face = s2
		      t.quantity = 1
		      tiles.Append t
		      s1 = s2
		    end
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		tiles() As Tile
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
End Class
#tag EndClass
