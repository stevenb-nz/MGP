#tag Window
Begin Window mainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   800
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   407328767
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Multi-game Player"
   Visible         =   True
   Width           =   600
   Begin PushButton dagadagButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Make dagadag"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   760
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Button"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   188
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   760
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dagadag_module.init_dagadag
		  initbag
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub initbag()
		  dim s as string
		  dim i as integer
		  redim bag(-1)
		  
		  s = "AAAAAAAAABBCCDDDDEEEEEEEEEEEEFFGGGHHIIIIIIIIIJKLLLLMMNNNNNNOOOOOOOOPPQRRRRRRSSSSTTTTTTUUUUVVWWXYYZ??"
		  for i = 1 to 100
		    bag.Append mid(s,i,1)
		  next
		  bag.Shuffle
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix(letters as string, index as integer, word as string, node as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  rack.import letters
		  tile = rack.tiles(index).face
		  if dagadag_endword(node) then
		    process(word)
		  end
		  if rack.tiles(index).quantity > 1 then
		    rack.tiles(index).quantity = rack.tiles(index).quantity - 1
		  else
		    rack.tiles.remove(index)
		  end
		  letters = rack.export
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        nextnode = dagadag_nextnode(node,chr(j))
		        if nextnode <> 0 then
		          prefix(letters,i,chr(j)+word,nextnode)
		        end
		      next
		    else
		      nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		      if nextnode <> 0 then
		        prefix(letters,i,rack.tiles(i).face+word,nextnode)
		      end
		    end
		  next
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    for i = 0 to UBound(rack.tiles)
		      if rack.tiles(i).face = "?" then
		        for j = 97 to 122
		          nextnode = dagadag_nextnode(node,chr(j))
		          if nextnode <> 0 then
		            suffix(letters,i,word+chr(j),nextnode)
		          end
		        next
		      else
		        nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		        if nextnode <> 0 then
		          suffix(letters,i,word+rack.tiles(i).face,nextnode)
		        end
		      end
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub process(word as String)
		  Listbox1.AddRow word
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startwords(letters as String)
		  dim rack as new Rack
		  dim i,j,node as integer
		  
		  rack.import letters
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        node = dagadag_nextnode(0,chr(j))
		        if node <> 0 then
		          prefix(letters,i,chr(j),node)
		        end
		      next
		    else
		      node = dagadag_nextnode(0,rack.tiles(i).face)
		      if node <> 0 then
		        prefix(letters,i,rack.tiles(i).face,node)
		      end
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub suffix(letters as string, index as integer, word as string, node as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  rack.import letters
		  tile = rack.tiles(index).face
		  if dagadag_endword(node) then
		    process(word)
		  end
		  if rack.tiles(index).quantity > 1 then
		    rack.tiles(index).quantity = rack.tiles(index).quantity - 1
		  else
		    rack.tiles.remove(index)
		  end
		  letters = rack.export
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        nextnode = dagadag_nextnode(node,chr(j))
		        if nextnode <> 0 then
		          suffix(letters,i,word+chr(j),nextnode)
		        end
		      next
		    else
		      nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		      if nextnode <> 0 then
		        suffix(letters,i,word+rack.tiles(i).face,nextnode)
		      end
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tile_value(tile as String) As integer
		  dim asc_value,return_value as integer
		  
		  asc_value = asc(tile)
		  
		  select case asc_value
		  case 65, 69, 73, 76, 78, 79, 82, 83, 84, 85
		    return_value = 1
		  case 68, 71
		    return_value = 2
		  case 66, 67, 77, 80
		    return_value = 3
		  case 70, 72, 86, 87, 89
		    return_value = 4
		  case 75
		    return_value = 5
		  case 74, 88
		    return_value = 8
		  case 81, 90
		    return_value = 10
		  else
		    return_value = 0
		  end
		  
		  return return_value
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bag() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		board(14,14) As Square
	#tag EndProperty


#tag EndWindowCode

#tag Events dagadagButton
	#tag Event
		Sub Action()
		  Dagadag_module.create_dagadag
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim letters as string
		  dim temp() as string
		  dim bagcount,i as integer
		  
		  listbox1.DeleteAllRows
		  bagcount = UBound(bag)+1
		  if bagcount > 0 then
		    if bagcount > 7 then
		      bagcount = 7
		    end
		  else
		    initbag
		    bagcount = 7
		  end
		  for i = 1 to bagcount
		    letters = letters + bag.Pop
		  next
		  temp = split(letters,"")
		  temp.Sort
		  letters = join(temp,"")
		  startwords(letters)
		  Listbox1.SortedColumn = 0
		  Listbox1.Sort
		  listbox1.Heading(0) = str(ListBox1.ListCount)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
