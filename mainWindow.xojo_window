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
		  initboard
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
		Sub initboard()
		  dim i,j as integer
		  dim temp as square
		  
		  for i = 0 to 16
		    for j = 0 to 16
		      temp = new Square
		      if i = 0 or i = 16 or j = 0 or j = 16 then
		        temp.border = true
		      else
		        temp.border = false
		        temp.wordmult = 1
		        temp.lettermult = 1
		      end
		      board(i,j) = temp
		    next
		  next
		  board(1,1).wordmult = 3
		  board(1,8).wordmult = 3
		  board(1,15).wordmult = 3
		  board(8,1).wordmult = 3
		  board(8,15).wordmult = 3
		  board(15,1).wordmult = 3
		  board(15,8).wordmult = 3
		  board(15,15).wordmult = 3
		  board(2,2).wordmult = 2
		  board(2,14).wordmult = 2
		  board(3,3).wordmult = 2
		  board(3,13).wordmult = 2
		  board(4,4).wordmult = 2
		  board(4,12).wordmult = 2
		  board(5,5).wordmult = 2
		  board(5,11).wordmult = 2
		  board(8,8).wordmult = 2
		  board(11,5).wordmult = 2
		  board(11,11).wordmult = 2
		  board(12,4).wordmult = 2
		  board(12,12).wordmult = 2
		  board(13,3).wordmult = 2
		  board(13,13).wordmult = 2
		  board(14,2).wordmult = 2
		  board(14,14).wordmult = 2
		  board(1,4).lettermult = 2
		  board(4,1).lettermult = 2
		  board(1,12).lettermult = 2
		  board(12,1).lettermult = 2
		  board(4,15).lettermult = 2
		  board(15,4).lettermult = 2
		  board(12,15).lettermult = 2
		  board(15,12).lettermult = 2
		  board(3,7).lettermult = 2
		  board(3,9).lettermult = 2
		  board(13,7).lettermult = 2
		  board(13,9).lettermult = 2
		  board(7,3).lettermult = 2
		  board(9,3).lettermult = 2
		  board(7,13).lettermult = 2
		  board(9,13).lettermult = 2
		  board(4,8).lettermult = 2
		  board(8,4).lettermult = 2
		  board(8,12).lettermult = 2
		  board(12,8).lettermult = 2
		  board(7,7).lettermult = 2
		  board(7,9).lettermult = 2
		  board(9,7).lettermult = 2
		  board(9,9).lettermult = 2
		  board(2,6).lettermult = 3
		  board(2,10).lettermult = 3
		  board(6,2).lettermult = 3
		  board(6,6).lettermult = 3
		  board(6,10).lettermult = 3
		  board(6,14).lettermult = 3
		  board(10,2).lettermult = 3
		  board(10,6).lettermult = 3
		  board(10,10).lettermult = 3
		  board(10,14).lettermult = 3
		  board(14,6).lettermult = 3
		  board(14,10).lettermult = 3
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix(letters as string, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    process(word)
		  end
		  rack.import letters
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        nextnode = dagadag_nextnode(node,chr(j))
		        if nextnode <> 0 then
		          if rack.tiles(i).quantity > 1 then
		            rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		          else
		            rack.tiles.remove(i)
		          end
		          prefix(rack.export,chr(j)+word,nextnode,x,y,horizontal,offset-1,0,1)
		          rack.import letters
		        end
		      next
		    else
		      nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		      if nextnode <> 0 then
		        tile = rack.tiles(i).face
		        if rack.tiles(i).quantity > 1 then
		          rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		        else
		          rack.tiles.remove(i)
		        end
		        prefix(rack.export,tile+word,nextnode,x,y,horizontal,offset-1,0,1)
		        rack.import letters
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
		            if rack.tiles(i).quantity > 1 then
		              rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		            else
		              rack.tiles.remove(i)
		            end
		            suffix(rack.export,word+chr(j),nextnode,x,y,horizontal,1,0,1)
		            rack.import letters
		          end
		        next
		      else
		        nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		        if nextnode <> 0 then
		          tile = rack.tiles(i).face
		          if rack.tiles(i).quantity > 1 then
		            rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		          else
		            rack.tiles.remove(i)
		          end
		          suffix(rack.export,word+tile,nextnode,x,y,horizontal,1,0,1)
		          rack.import letters
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
		Sub startwords(letters as String, x as integer, y as integer, horizontal as boolean)
		  dim tile as string
		  dim rack as new Rack
		  dim i,j,node as integer
		  
		  rack.import letters
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        node = dagadag_nextnode(0,chr(j))
		        if node <> 0 then
		          if rack.tiles(i).quantity > 1 then
		            rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		          else
		            rack.tiles.remove(i)
		          end
		          prefix(rack.export,chr(j),node,x,y,horizontal,-1,0,1)
		          rack.import letters
		        end
		      next
		    else
		      node = dagadag_nextnode(0,rack.tiles(i).face)
		      if node <> 0 then
		        tile = rack.tiles(i).face
		        if rack.tiles(i).quantity > 1 then
		          rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		        else
		          rack.tiles.remove(i)
		        end
		        prefix(rack.export,tile,node,x,y,horizontal,-1,0,1)
		        rack.import letters
		      end
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub suffix(letters as string, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    process(word)
		  end
		  rack.import letters
		  for i = 0 to UBound(rack.tiles)
		    if rack.tiles(i).face = "?" then
		      for j = 97 to 122
		        nextnode = dagadag_nextnode(node,chr(j))
		        if nextnode <> 0 then
		          if rack.tiles(i).quantity > 1 then
		            rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		          else
		            rack.tiles.remove(i)
		          end
		          suffix(rack.export,word+chr(j),nextnode,x,y,horizontal,offset+1,0,1)
		          rack.import letters
		        end
		      next
		    else
		      nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		      if nextnode <> 0 then
		        tile = rack.tiles(i).face
		        if rack.tiles(i).quantity > 1 then
		          rack.tiles(i).quantity = rack.tiles(i).quantity - 1
		        else
		          rack.tiles.remove(i)
		        end
		        suffix(rack.export,word+tile,nextnode,x,y,horizontal,offset+1,0,1)
		        rack.import letters
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
		board(16,16) As Square
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
		  startwords(letters,8,8,true)
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
