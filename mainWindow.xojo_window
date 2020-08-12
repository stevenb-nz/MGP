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
   Height          =   734
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
   Width           =   1102
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
      Top             =   20
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
      Left            =   640
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
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   "35%,15%,15%,35%"
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
      Height          =   694
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   732
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
      Width           =   350
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox Listbox2
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   662
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   700
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  init_dagadag
		  initboard
		  initbag
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub do_move(letters as string)
		  dim i,j as integer
		  
		  if board(8,8).face = "" then
		    startwords(letters,8,8,true)
		  else
		    for i = 1 to 15
		      for j = 1 to 15
		        if board(i,j).face = "" then
		          if board(i+1,j).face = "" and board(i-1,j).face = "" and board(i,j+1).face = "" and board(i,j-1).face = "" then
		            board(i,j).anchor = false
		          else
		            board(i,j).anchor = true
		          end
		        else
		          board(i,j).anchor = false
		        end
		      next
		    next
		    precomp(letters,i,j)
		    for i = 1 to 15
		      for j = 1 to 15
		        if board(i,j).anchor then
		          startwords(letters,i,j,true)
		          startwords(letters,i,j,false)
		        end
		      next
		    next
		  end
		  'choose and play move
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function h_rc(x as integer, y as integer) As String
		  return str(y)+chr(x+64)
		  
		End Function
	#tag EndMethod

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
		Sub old_prefix(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim i,j,nextnode,leftmost as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    if unique_play(letters_played,x,y,horizontal) then
		      process(if(horizontal,h_rc(x+offset+1,y)+"-"+h_rc(x,y),v_cr(x,y+offset+1)+"-"+v_cr(x,y)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		    end
		  end
		  rack.import letters
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face) ="" then
		    if not if(horizontal,board(x+offset,y).anchor,board(x,y+offset).anchor) then
		      if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		        for i = 0 to UBound(rack.tiles)
		          if rack.tiles(i).face = "?" then
		            for j = 97 to 122
		              nextnode = dagadag_nextnode(node,chr(j))
		              if nextnode <> 0 then
		                if horizontal then
		                  if board(x+offset,y).partials_v then
		                    if board(x+offset,y).part_scores_v(j-71) > -1 then
		                      psum = psum + board(x+offset,y).part_scores_v(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  if board(x,y+offset).partials_h then
		                    if board(x,y+offset).part_scores_h(j-71) > -1 then
		                      psum = psum + board(x,y+offset).part_scores_h(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                end
		              end
		            next
		          else
		            nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		            if nextnode <> 0 then
		              tile = rack.tiles(i).face
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          end
		        next
		      end
		    end
		  else
		    do
		      tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		      nextnode = dagadag_nextnode(node,tile)
		      if nextnode <> 0 then
		        node = nextnode
		        word = "("+tile+")" + word
		        pvalue = pvalue + tile_value(tile)
		        offset = offset - 1
		      end
		    loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		  end
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    leftmost = offset
		    offset = 1
		    if if(horizontal,board(x+offset,y).face,board(x,y+offset).face)="" then
		      if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		        for i = 0 to UBound(rack.tiles)
		          if rack.tiles(i).face = "?" then
		            for j = 97 to 122
		              nextnode = dagadag_nextnode(node,chr(j))
		              if nextnode <> 0 then
		                if horizontal then
		                  if board(x+offset,y).partials_v then
		                    if board(x+offset,y).part_scores_v(j-71) > -1 then
		                      psum = psum + board(x+offset,y).part_scores_v(j-71)
		                      'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  if board(x,y+offset).partials_h then
		                    if board(x,y+offset).part_scores_h(j-71) > -1 then
		                      psum = psum + board(x,y+offset).part_scores_h(j-71)
		                      'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  else
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                end
		              end
		            next
		          else
		            nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		            if nextnode <> 0 then
		              tile = rack.tiles(i).face
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                    'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                    'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          end
		        next
		      end
		    else
		      do
		        tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		        nextnode = dagadag_nextnode(node,tile)
		        if nextnode <> 0 then
		          node = nextnode
		          word = word + "("+tile+")"
		          pvalue = pvalue + tile_value(tile)
		          offset = offset + 1
		        end
		      loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		      if nextnode <> 0 then
		        if dagadag_endword(node) then
		          if unique_play(letters_played,x,y,horizontal) then
		            process(if(horizontal,h_rc(x+leftmost+1,y)+"-"+h_rc(x,y),v_cr(x,y+leftmost+1)+"-"+v_cr(x,y)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		          end
		        end
		        if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		          for i = 0 to UBound(rack.tiles)
		            if rack.tiles(i).face = "?" then
		              for j = 97 to 122
		                nextnode = dagadag_nextnode(node,chr(j))
		                if nextnode <> 0 then
		                  if horizontal then
		                    if board(x+offset,y).partials_v then
		                      if board(x+offset,y).part_scores_v(j-71) > -1 then
		                        psum = psum + board(x+offset,y).part_scores_v(j-71)
		                        'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                      end
		                    else
		                      'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    if board(x,y+offset).partials_h then
		                      if board(x,y+offset).part_scores_h(j-71) > -1 then
		                        psum = psum + board(x,y+offset).part_scores_h(j-71)
		                        'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                      end
		                    else
		                      'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  end
		                end
		              next
		            else
		              nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		              if nextnode <> 0 then
		                tile = rack.tiles(i).face
		                if horizontal then
		                  if board(x+offset,y).partials_v then
		                    if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                      psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                      'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  if board(x,y+offset).partials_h then
		                    if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                      psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                      'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  else
		                    'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                end
		              end
		            end
		          next
		        end
		      end
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub old_suffix(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, leftmost as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    if unique_play(letters_played,x,y,horizontal) then
		      process(if(horizontal,h_rc(x+leftmost+1,y)+"-"+h_rc(x,y),v_cr(x,y+leftmost+1)+"-"+v_cr(x,y)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		    end
		  end
		  rack.import letters
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face)="" then
		    if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		      for i = 0 to UBound(rack.tiles)
		        if rack.tiles(i).face = "?" then
		          for j = 97 to 122
		            nextnode = dagadag_nextnode(node,chr(j))
		            if nextnode <> 0 then
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(j-71) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(j-71) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          next
		        else
		          nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		          if nextnode <> 0 then
		            tile = rack.tiles(i).face
		            if horizontal then
		              if board(x+offset,y).partials_v then
		                if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		              end
		            else
		              if board(x,y+offset).partials_h then
		                if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		              end
		            end
		          end
		        end
		      next
		    end
		  else
		    do
		      tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		      nextnode = dagadag_nextnode(node,tile)
		      if nextnode <> 0 then
		        node = nextnode
		        word = "("+tile+")" + word
		        pvalue = pvalue + tile_value(tile)
		        offset = offset + 1
		      end
		    loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		    if dagadag_endword(node) then
		      if unique_play(letters_played,x,y,horizontal) then
		        process(if(horizontal,h_rc(x+leftmost+1,y)+"-"+h_rc(x,y),v_cr(x,y)+"-"+v_cr(x,y+leftmost+1)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		      end
		    end
		    if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		      for i = 0 to UBound(rack.tiles)
		        if rack.tiles(i).face = "?" then
		          for j = 97 to 122
		            nextnode = dagadag_nextnode(node,chr(j))
		            if nextnode <> 0 then
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(j-71) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(j-71) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          next
		        else
		          nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		          if nextnode <> 0 then
		            tile = rack.tiles(i).face
		            if horizontal then
		              if board(x+offset,y).partials_v then
		                if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		              end
		            else
		              if board(x,y+offset).partials_h then
		                if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		              end
		            end
		          end
		        end
		      next
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub precomp(letters as string, x as integer, y as integer)
		  dim rack as new Rack
		  dim i,j,k,l,offset,ptot,tot,wmult as integer
		  dim word,newrow as string
		  
		  rack.import letters
		  for i = 1 to 15
		    for j = 1 to 15
		      if board(i,j).anchor then
		        if board(i-1,j).face <> "" or board(i+1,j).face <> "" then
		          newrow = h_rc(i,j)
		          board(i,j).partials_h = true
		          redim board(i,j).part_scores_h(51)
		          for k = 0 to 51
		            board(i,j).part_scores_h(k) = -1
		          next
		          wmult = board(i,j).wordmult
		          word = "?"
		          ptot = 0
		          offset = -1
		          while board(i+offset,j).face <> ""
		            word = board(i+offset,j).face + word
		            ptot = ptot + tile_value(board(i+offset,j).face)
		            offset = offset - 1
		          wend
		          offset = 1
		          while board(i+offset,j).face <> ""
		            word = word + board(i+offset,j).face
		            ptot = ptot + tile_value(board(i+offset,j).face)
		            offset = offset + 1
		          wend
		          for k = 0 to ubound(rack.tiles)
		            if rack.tiles(k).face = "?" then
		              tot = ptot * wmult
		              for l = 97 to 122
		                if isWord(word.Replace("?",chr(l))) then
		                  board(i,j).part_scores_h(l-71) = tot
		                end
		              next
		            else
		              if isWord(word.Replace("?",rack.tiles(k).face)) then
		                board(i,j).part_scores_h(asc(rack.tiles(k).face)-65) = (ptot+tile_value(rack.tiles(k).face)*board(i,j).lettermult)*wmult
		              end
		            end
		          next
		          for k = 0 to 25
		            if board(i,j).part_scores_h(k) > -1 then
		              newrow = newrow + ", " + chr(k+65) + ", " + str(board(i,j).part_scores_h(k))
		            end
		            if board(i,j).part_scores_h(k+26) > -1 then
		              newrow = newrow + ", " + chr(k+97) + ", " + str(board(i,j).part_scores_h(k+26))
		            end
		          next
		          listbox2.AddRow newrow
		        end
		        if board(i,j-1).face <> "" or board(i,j+1).face <> "" then
		          newrow = v_cr(i,j)
		          board(i,j).partials_v = true
		          redim board(i,j).part_scores_v(51)
		          for k = 0 to 51
		            board(i,j).part_scores_v(k) = -1
		          next
		          wmult = board(i,j).wordmult
		          word = "?"
		          ptot = 0
		          offset = -1
		          while board(i,j+offset).face <> ""
		            word = board(i,j+offset).face + word
		            ptot = ptot + tile_value(board(i,j+offset).face)
		            offset = offset - 1
		          wend
		          offset = 1
		          while board(i,j+offset).face <> ""
		            word = word + board(i,j+offset).face
		            ptot = ptot + tile_value(board(i,j+offset).face)
		            offset = offset + 1
		          wend
		          for k = 0 to ubound(rack.tiles)
		            if rack.tiles(k).face = "?" then
		              tot = ptot * wmult
		              for l = 97 to 122
		                if isWord(word.Replace("?",chr(l))) then
		                  board(i,j).part_scores_v(l-71) = tot
		                end
		              next
		            else
		              if isWord(word.Replace("?",rack.tiles(k).face)) then
		                board(i,j).part_scores_v(asc(rack.tiles(k).face)-65) = (ptot+tile_value(rack.tiles(k).face)*board(i,j).lettermult)*wmult
		              end
		            end
		          next
		          for k = 0 to 25
		            if board(i,j).part_scores_v(k) > -1 then
		              newrow = newrow + ", " + chr(k+65) + ", " + str(board(i,j).part_scores_v(k))
		            end
		            if board(i,j).part_scores_v(k+26) > -1 then
		              newrow = newrow + ", " + chr(k+97) + ", " + str(board(i,j).part_scores_v(k+26))
		            end
		          next
		          listbox2.AddRow newrow
		        end
		      end
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face) ="" then
		    if if(horizontal,board(x-offset,y).face,board(x,y-offset).face) ="" then
		      prefix_ff(letters,letters_played,word,node,x,y,horizontal,offset,pvalue,pmult,psum)
		    else
		      prefix_ft(letters,letters_played,word,node,x,y,horizontal,offset,pvalue,pmult,psum)
		    end
		  else
		    if if(horizontal,board(x-offset,y).face,board(x,y-offset).face) ="" then
		      prefix_tf(letters,letters_played,word,node,x,y,horizontal,offset,pvalue,pmult,psum)
		    else
		      prefix_tt(letters,letters_played,word,node,x,y,horizontal,offset,pvalue,pmult,psum)
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix_ff(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim i,j,leftmost,nextnode as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    if unique_play(letters_played,x,y,horizontal) then
		      process(if(horizontal,h_rc(x+offset+1,y)+"-"+h_rc(x,y),v_cr(x,y+offset+1)+"-"+v_cr(x,y)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		    end
		  end
		  rack.import letters
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face) ="" then
		    if not if(horizontal,board(x+offset,y).anchor,board(x,y+offset).anchor) then
		      if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		        for i = 0 to UBound(rack.tiles)
		          if rack.tiles(i).face = "?" then
		            for j = 97 to 122
		              nextnode = dagadag_nextnode(node,chr(j))
		              if nextnode <> 0 then
		                if horizontal then
		                  if board(x+offset,y).partials_v then
		                    if board(x+offset,y).part_scores_v(j-71) > -1 then
		                      psum = psum + board(x+offset,y).part_scores_v(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  if board(x,y+offset).partials_h then
		                    if board(x,y+offset).part_scores_h(j-71) > -1 then
		                      psum = psum + board(x,y+offset).part_scores_h(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                end
		              end
		            next
		          else
		            nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		            if nextnode <> 0 then
		              tile = rack.tiles(i).face
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          end
		        next
		      end
		    end
		  end
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    leftmost = offset
		    offset = 1
		    'call suffix_f
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix_ft(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim i,j,leftmost,nextnode as integer
		  dim rack as new Rack
		  
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face) ="" then
		    if not if(horizontal,board(x+offset,y).anchor,board(x,y+offset).anchor) then
		      if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		        for i = 0 to UBound(rack.tiles)
		          if rack.tiles(i).face = "?" then
		            for j = 97 to 122
		              nextnode = dagadag_nextnode(node,chr(j))
		              if nextnode <> 0 then
		                if horizontal then
		                  if board(x+offset,y).partials_v then
		                    if board(x+offset,y).part_scores_v(j-71) > -1 then
		                      psum = psum + board(x+offset,y).part_scores_v(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  if board(x,y+offset).partials_h then
		                    if board(x,y+offset).part_scores_h(j-71) > -1 then
		                      psum = psum + board(x,y+offset).part_scores_h(j-71)
		                      prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                    end
		                  else
		                    prefix(letters.Replace(rack.tiles(i).face,""),letters_played+1,chr(j)+word,nextnode,x,y,horizontal,offset-1,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                end
		              end
		            next
		          else
		            nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		            if nextnode <> 0 then
		              tile = rack.tiles(i).face
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                    prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  prefix(letters.Replace(tile,""),letters_played+1,tile+word,nextnode,x,y,horizontal,offset-1,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          end
		        next
		      end
		    end
		  end
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    leftmost = offset
		    offset = 1
		    'call suffix_t
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix_tf(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim leftmost,nextnode as integer
		  
		  do
		    tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		    nextnode = dagadag_nextnode(node,tile)
		    if nextnode <> 0 then
		      node = nextnode
		      word = "("+tile+")" + word
		      pvalue = pvalue + tile_value(tile)
		      offset = offset - 1
		    end
		  loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    leftmost = offset
		    offset = 1
		    'call suffix_f
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub prefix_tt(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim leftmost,nextnode as integer
		  
		  do
		    tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		    nextnode = dagadag_nextnode(node,tile)
		    if nextnode <> 0 then
		      node = nextnode
		      word = "("+tile+")" + word
		      pvalue = pvalue + tile_value(tile)
		      offset = offset - 1
		    end
		  loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		  node = dagadag_nextnode(node,chr(96))
		  if node <> 0 then
		    leftmost = offset
		    offset = 1
		    'call suffix_t
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub preset_square(x as integer, y as integer)
		  board(x,y).face = bag.pop
		  if board(x,y).face = "?" then
		    board(x,y).face = chr(floor(rnd*26)+97)
		  end
		  listbox2.addrow h_rc(x,y)+" - " + board(x,y).face
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub process(location as string, word as String, score as integer, leave as String)
		  Listbox1.AddRow word
		  listbox1.Cell(Listbox1.LastIndex,1) = location
		  listbox1.Cell(Listbox1.LastIndex,2) = str(score)
		  listbox1.Cell(Listbox1.LastIndex,3) = leave
		  
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
		          if horizontal then
		            if board(x,y).partials_v then
		              if board(x,y).part_scores_v(j-71) > -1 then
		                prefix(letters.Replace(rack.tiles(i).face,""),1,"•"+chr(j)+"•",node,x,y,horizontal,-1,0,board(x,y).wordmult,board(x,y).part_scores_v(j-71))
		              end
		            else
		              prefix(letters.Replace(rack.tiles(i).face,""),1,"•"+chr(j)+"•",node,x,y,horizontal,-1,0,board(x,y).wordmult,0)
		            end
		          else
		            if board(x,y).partials_h then
		              if board(x,y).part_scores_h(j-71) > -1 then
		                prefix(letters.Replace(rack.tiles(i).face,""),1,"•"+chr(j)+"•",node,x,y,horizontal,-1,0,board(x,y).wordmult,board(x,y).part_scores_h(j-71))
		              end
		            else
		              prefix(letters.Replace(rack.tiles(i).face,""),1,"•"+chr(j)+"•",node,x,y,horizontal,-1,0,board(x,y).wordmult,0)
		            end
		          end
		        end
		      next
		    else
		      node = dagadag_nextnode(0,rack.tiles(i).face)
		      if node <> 0 then
		        tile = rack.tiles(i).face
		        if horizontal then
		          if board(x,y).partials_v then
		            if board(x,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		              prefix(letters.Replace(tile,""),1,"•"+tile+"•",node,x,y,horizontal,-1,tile_value(tile)*board(x,y).lettermult,board(x,y).wordmult,board(x,y).part_scores_v(asc(rack.tiles(i).face)-65))
		            end
		          else
		            prefix(letters.Replace(tile,""),1,"•"+tile+"•",node,x,y,horizontal,-1,tile_value(tile)*board(x,y).lettermult,board(x,y).wordmult,0)
		          end
		        else
		          if board(x,y).partials_h then
		            if board(x,y).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		              prefix(letters.Replace(tile,""),1,"•"+tile+"•",node,x,y,horizontal,-1,tile_value(tile)*board(x,y).lettermult,board(x,y).wordmult,board(x,y).part_scores_h(asc(rack.tiles(i).face)-65))
		            end
		          else
		            prefix(letters.Replace(tile,""),1,"•"+tile+"•",node,x,y,horizontal,-1,tile_value(tile)*board(x,y).lettermult,board(x,y).wordmult,0)
		          end
		        end
		      end
		    end
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub suffix_f(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, leftmost as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim i,j,nextnode as integer
		  dim rack as new Rack
		  
		  if dagadag_endword(node) then
		    if unique_play(letters_played,x,y,horizontal) then
		      process(if(horizontal,h_rc(x+offset+1,y)+"-"+h_rc(x,y),v_cr(x,y+offset+1)+"-"+v_cr(x,y)),word,psum+pvalue*pmult+if(letters_played=7,50,0),letters)
		    end
		  end
		  rack.import letters
		  if if(horizontal,board(x+offset,y).face,board(x,y+offset).face)="" then
		    if not if(horizontal,board(x+offset,y).border,board(x,y+offset).border) then
		      for i = 0 to UBound(rack.tiles)
		        if rack.tiles(i).face = "?" then
		          for j = 97 to 122
		            nextnode = dagadag_nextnode(node,chr(j))
		            if nextnode <> 0 then
		              if horizontal then
		                if board(x+offset,y).partials_v then
		                  if board(x+offset,y).part_scores_v(j-71) > -1 then
		                    psum = psum + board(x+offset,y).part_scores_v(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                if board(x,y+offset).partials_h then
		                  if board(x,y+offset).part_scores_h(j-71) > -1 then
		                    psum = psum + board(x,y+offset).part_scores_h(j-71)
		                    'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                  end
		                else
		                  'suffix(letters.Replace(rack.tiles(i).face,""),letters_played+1,word+chr(j),nextnode,x,y,horizontal,offset+1,leftmost,pvalue,pmult*board(x,y+offset).wordmult,psum)
		                end
		              end
		            end
		          next
		        else
		          nextnode = dagadag_nextnode(node,rack.tiles(i).face)
		          if nextnode <> 0 then
		            tile = rack.tiles(i).face
		            if horizontal then
		              if board(x+offset,y).partials_v then
		                if board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x+offset,y).part_scores_v(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x+offset,y).lettermult,pmult*board(x+offset,y).wordmult,psum)
		              end
		            else
		              if board(x,y+offset).partials_h then
		                if board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65) > -1 then
		                  psum = psum + board(x,y+offset).part_scores_h(asc(rack.tiles(i).face)-65)
		                  'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		                end
		              else
		                'suffix(letters.Replace(tile,""),letters_played+1,word+tile,nextnode,x,y,horizontal,offset+1,leftmost,pvalue+tile_value(tile)*board(x,y+offset).lettermult,pmult*board(x,y+offset).wordmult,psum)
		              end
		            end
		          end
		        end
		      next
		    end
		  end
		  'if not border, call suffix_t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub suffix_t(letters as string, letters_played as integer, word as string, node as integer, x as integer, y as integer, horizontal as boolean, offset as integer, leftmost as integer, pvalue as integer, pmult as integer, psum as integer)
		  dim tile as string
		  dim nextnode as integer
		  
		  do
		    tile =  if(horizontal,board(x+offset,y).face,board(x,y+offset).face)
		    nextnode = dagadag_nextnode(node,tile)
		    if nextnode <> 0 then
		      node = nextnode
		      word = "("+tile+")" + word
		      pvalue = pvalue + tile_value(tile)
		      offset = offset + 1
		    end
		  loop until nextnode = 0 or if(horizontal,board(x+offset,y).face,board(x,y+offset).face) = ""
		  if nextnode <> 0 then
		    'call suffix_f
		  end
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

	#tag Method, Flags = &h0
		Function unique_play(letters_played as integer, x as integer, y as integer, horizontal as Boolean) As boolean
		  if letters_played > 1 then
		    return true
		  end
		  if letters_played = 1 then
		    if horizontal then
		      return true
		    else
		      if not board(x,y).partials_h then
		        return true
		      end
		    end
		  end
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function v_cr(x as integer, y as integer) As String
		  return chr(x+64)+str(y)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		bag() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		board(16,16) As Square
	#tag EndProperty

	#tag Property, Flags = &h0
		racksize As Integer = 7
	#tag EndProperty


#tag EndWindowCode

#tag Events dagadagButton
	#tag Event
		Sub Action()
		  create_dagadag
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim letters as string
		  dim temp() as string
		  dim i as integer
		  
		  listbox1.DeleteAllRows
		  listbox2.DeleteAllRows
		  initbag
		  preset_square(6,7)
		  preset_square(7,7)
		  preset_square(8,7)
		  preset_square(6,8)
		  preset_square(8,8)
		  preset_square(6,9)
		  preset_square(7,9)
		  preset_square(8,9)
		  for i = 1 to racksize
		    letters = letters + bag.Pop
		  next
		  temp = split(letters,"")
		  temp.Sort
		  letters = join(temp,"")
		  listbox2.AddRow "Rack: " + letters
		  do_move(letters)
		  Listbox1.SortedColumn = 1
		  Listbox1.Sort
		  listbox1.Heading(0) = str(ListBox1.ListCount)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Select Case column
		  Case 0
		    Return False
		    
		  Case 1
		    Return False
		    
		  Case 2
		    result = Sign(Val(Me.Cell(row1, column)) - Val(Me.Cell( row2, column)))
		    Return True
		    
		  Case 3
		    Return False
		    
		  Else
		    Return False
		  End Select
		End Function
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
	#tag ViewProperty
		Name="racksize"
		Group="Behavior"
		InitialValue="7"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
