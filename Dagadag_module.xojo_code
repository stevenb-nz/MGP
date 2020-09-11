#tag Module
Protected Module Dagadag_module
	#tag Method, Flags = &h0
		Sub create_dagadag()
		  dim f,g as folderitem
		  dim t as textinputStream
		  dim u as binaryStream
		  dim c,s,ss as string
		  dim i,j,k as integer
		  dim currentnode,maxnode,nextnode as integer
		  dim check as boolean
		  
		  f=getopenfolderitem("text;text/plain;text/richtext")
		  if f <> nil then
		    t = f.openastextFile
		    g = SpecialFolder.Desktop.child("CSW19 working").child("dagadagfile")
		    u = g.createbinaryFile("text/richtext")
		    for i=1 to 27
		      u.WriteUInt32 0
		    next
		    u.write "0"
		    maxnode = 0
		    while not t.eof
		      s = t.readline.Lowercase
		      check = true
		      for i = 1 to len(s)
		        if asc(mid(s,i,1)) < asc("a") or asc(mid(s,i,1)) > asc("z") then
		          check = false
		        end if
		      next
		      if check then
		        j = len(s)
		        s = chr(96) + s
		        for i = 1 to j+1
		          ss = if(i=j+1,left(s,j),s)
		          currentnode = 0
		          while ss <> ""
		            c = left(ss,1)
		            ss = right(ss,len(ss)-1)
		            u.position = currentnode*109+(asc(c)-96)*4
		            nextnode = u.ReadUInt32
		            if nextnode = 0 then
		              maxnode = maxnode + 1
		              u.position = currentnode*109+(asc(c)-96)*4
		              u.WriteUInt32 maxnode
		              currentnode = maxnode
		              u.position = currentnode*109
		              for k=1 to 27
		                u.WriteUInt32 0
		              next
		              u.write "0"
		            else
		              currentnode = nextnode
		            end if
		          wend
		          u.position = currentnode*109+108
		          u.write "1"
		          s = mid(s,i+1,1) + left(s,i) + right(s,j-i)
		        next
		      end if
		    wend
		    t.close
		    u.close
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dagadag_endword(node as uint32) As boolean
		  if dagadag.StringValue(node*109+108,1) = "0" then
		    return false
		  else
		    return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dagadag_nextnode(node as uint32, letter as string) As UInt32
		  return dagadag.UInt32Value(node*109+(asc(lowercase(letter))-96)*4)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub init_dagadag()
		  dim dagadagbs as BinaryStream = SpecialFolder.Preferences.child("dagadagfile").openasbinaryFile(false)
		  dagadag = dagadagbs.Read(dagadagbs.Length)
		  dagadag.LittleEndian = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isWord(word as String) As Boolean
		  dim i as integer
		  dim node as UInt32
		  
		  i = len(word)
		  node = dagadag_nextnode(0,chr(96))
		  
		  while i > 0
		    i = i -1
		    node = dagadag_nextnode(node,mid(word,len(word)-i,1))
		    if node = 0 then
		      i = 0
		    end
		  wend
		  if node > 0 then
		    return dagadag_endword(node)
		  else
		    return false
		  end
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		dagadag As MemoryBlock
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
