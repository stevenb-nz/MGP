#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin PushButton gaddagButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Make bdag"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   497
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
      Top             =   360
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events gaddagButton
	#tag Event
		Sub Action()
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
		    g = SpecialFolder.Desktop.child("CSW19 working").child("gaddagfile")
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
		        for i = 1 to j
		          s = mid(s,i+1,1) + left(s,i) + right(s,j-i)
		          ss = if(i=j,left(s,j),s)
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
		        next
		      end if
		    wend
		    t.close
		    u.close
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
