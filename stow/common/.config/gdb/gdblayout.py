import gdb

""" GDB extension to add a watch window and a locals window to gdb using TUI """

localwin = None
watchwin = None
watches=[]


class localWinClass():
  """ Locals window displays the current locals"""
  def __init__(self, parent):
    global localwin
    localwin = self
    self.outwin = parent
    self.outwin.title = "Locals"
    self.hpos=0
    self.vpos=0
    gdb.events.cont.connect(self.listener)

  def render(self):
    locals = gdb.execute("info locals", to_string=True)
    localslist = locals.split('\n')
    self.outwin.erase()

    index=0
    vcount = min(len(localslist)-self.vpos,self.outwin.height)
    for a in localslist[self.vpos:self.vpos+vcount]:
      hcount = min(len(a)-self.hpos,self.outwin.width)
      self.outwin.write("{}\n\n".format(a[self.hpos: self.hpos+hcount]))
      index+=1


    self.outwin.write(locals)

  def listener(self, event):
    self.render()

  def close(self):
    global localwin
    localwin=None
    gdb.events.cont.disconnect(self.listener)

  def hscroll(self,offset):
    self.hpos = max(0,self.hpos+offset)
    self.render()

  def vscroll(self,offset):
    self.vpos = max(0,self.vpos+offset)
    self.render()


class addWatch(gdb.Command):
  """ add an expression to watch"""
  def __init__(self):
    super(addWatch, self).__init__("addwatch",gdb.COMMAND_USER)

  def invoke (self, expression,from_tty):
    global watches
    watches.append(expression)
    watchwin.render()





class removeWatch(gdb.Command):
  """ remove a watched expression takes an index number to the list"""
  def __init__ (self):
    super (removeWatch, self).__init__ ("removewatch",gdb.COMMAND_USER)

  def invoke (self, variable,from_tty):
    if int(variable) < len(watches):
      watches.pop(int(variable))
      watchwin.render()
    else:
      print ("Index {} doesnt exist".format(variable))


class watchWinClass():
  """ Window to watch expressions """
  def __init__(self,parent):
    global watchwin 
    watchwin = self
    self.outwin=parent
    self.outwin.title= "Watches"
    gdb.events.cont.connect(self.listener)
    addWatch()
    removeWatch()
    self.hpos=0
    self.vpos=0

  def render(self):
    global watches
    self.outwin.erase()
    index=0
    # rendering with width/height clipping
    # we should render from offset self.vpos to the smallest of vpos + length or vpos + height
    vcount = min(len(watches)-self.vpos,self.outwin.height)
    for a in watches[self.vpos:self.vpos+vcount]:
      try :
        val = str(gdb.parse_and_eval(a))
      except:
        val="??"
      outstring = "{} : {}  = {}".format(index+self.vpos,a,val)
      hcount = min(len(outstring)-self.hpos,self.outwin.width)
      self.outwin.write("{}\n\n".format(outstring[self.hpos: self.hpos+hcount]))
      index+=1

  def listener(self,event):
    self.render()

  def close(self):
    global watchwin
    watchwin=None
    gdb.events.cont.disconnect(self.listener)

  def hscroll(self,offset):
    self.hpos = max(0,self.hpos+offset)
    self.render()

  def vscroll(self,offset):
    self.vpos = max(0,self.vpos+offset)
    self.render()

gdb.register_window_type("locals",localWinClass)
gdb.register_window_type("watches",watchWinClass)
gdb.execute("tui new-layout watchvars {-horizontal src 3 {locals 3 watches 1} 2} 40 status 0 cmd 1")
gdb.execute("layout watchvars")
gdb.execute("fs cmd")

