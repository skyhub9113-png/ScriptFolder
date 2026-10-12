-- Rayfield Gen2 v1.1.0
-- loadstring(game:HttpGet("https://sirius.menu/gen2"))()
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,b,c,d,e,f,g,h,i,j={function()local b,c,d=a(1)local e return(function(...)
local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.types)export
type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type NotifyProps=j.NotifyProps export type
ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.PopupOption export type PopupProps=j.
PopupProps export type Moveable=j.Moveable export type Window=j.Window export type Tab=j.Tab export type Group=j.Group
export type Button=j.Button export type Toggle=j.Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown
export type Input=j.Input export type Keybind=j.Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat
export type Section=j.Section export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type
WindowModule={new:(j.WindowProps)->j.Window}local k={}::Rayfield local function l()local m=Instance.new'ScreenGui'm.Name
=f.httpService:GenerateGUID(false)m.ClipToDeviceSafeArea=false m.DisplayOrder=i.displayOrder.banner m.IgnoreGuiInset=
true m.ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=Enum.SafeAreaCompatibility.None m.ScreenInsets=Enum.
ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.Sibling m.Parent=f.guiContainer local n=Instance.new
'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.
Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.Parent=m return m end function k.CreateWindow(m,n:j.
WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.secureMode then g.preload(function(r)if r<=0 then return
end local function s()if not p or p.unloaded then return end p:Notify{title=h.resolve'Secure mode',content=if r==1 then
h.resolve"An asset couldn't be cached and won't appear."else h.resolve"Some assets couldn't be cached and won't appear."
}end if p then s()else q=s end end)end local r,s=pcall(function()return(d(c.components.window)::WindowModule).new(n)end)
if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t if q then task.spawn(q)q=nil end if f.secureMode then
task.spawn(function()local u,v=f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.
fontAsset,Enum.FontWeight.SemiBold)if not t.unloaded and u and v and u~=f.fallbackFont and v~=f.fallbackFont then t:
ChangeTheme{Font=u,TitleFont=v}end end)end task.spawn(function()task.wait(0.5)o:Destroy()task.wait(0.5)if not t.unloaded
then t:Show()end end)return t end return k end)()end,[3]=function()local b,c,d=a(3)local e return(function(...)local f={
}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),d(g.HapticEngine)
function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)'),name=l.name or l.Name or'Action',icon=assert(l.icon or l.Icon,
'Missing argument (Icon expected)'),callback=assert(l.callback or l.Callback,'Missing argument (Function expected)'),
linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create('Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.
order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=m.window.actionContainer})m.iconLabel=m.window:
Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=m.action},{ImageColor3=
'ActionColor'})m.interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action}
)local function n()if not m.window:_settled()then return end if m.linkedTab and m.window.selectedTab==m.linkedTab then
return end if m.isLit and m:isLit()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end m.window:Connect(m.interact.MouseButton1Click,
function()j.click()task.spawn(function()local o,p=pcall(m.callback)if not o then i.warn(`Rayfield encountered an error, with the callback for a {
m.__type} component named '{m.name}':`)i.print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not
m.window:_interactive()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)return m end return f
end)()end,[4]=function()local b,c,d=a(4)local e return(function(...)local f={}f.__index=f f.__type='Button'local g=c.
Parent.Parent.utility local h,i,j,k,l=d(g.variables),d(g.functions),d(g.moveable),d(g.locale),d(g.HapticEngine)function
f.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({tab=assert(m,'Missing argument #1 (Tab expected)'),
window=m.window,name=n.name or n.Name or'Button',icon=n.icon or n.Icon,description=n.description or n.Description,
compact=m.compact or false,callback=n.callback or n.Callback or function()end},f)if o.compact then o:_buildCompact()else
o:_buildFull()end if o.description and not o.compact then o.descriptor=d(c.Parent.descriptor).new(o.tab,{description=o.
description})end return o end function f._runCallback(m)m.window:_runGuarded(m,m.callback)end function f._buildFull(m)m.
main=m.window:Create('Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=m.name,BackgroundColor3=Color3.fromRGB(
255,255,255),BackgroundTransparency=1,Parent=m.tab.tabPage},{BackgroundTransparency='ElementTransparency'})m.stroke=m.
window:StyleElementBody(m.main)m.hoverOverlay=m.window:CreateHoverOverlay(m.main)m.container=m.window:Create('Frame',{
BorderSizePixel=0,Parent=m.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5)
,BackgroundTransparency=1})m.containerLayout=m.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,Parent=m.container})if m.icon then m.iconLabel=m.window:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=m.container},{ImageColor3='ContentColor'})end
m.title=m.window:Create('TextLabel',{Text=k.t(m.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=m.container},{TextColor3='ContentColor',FontFace='Font'})m.
interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=
UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.main})m.window:_wireElementHover(m
)m.window:ConnectFor(m,m.interact.MouseButton1Click,function()l.click()h.tweenService:Create(m.stroke,TweenInfo.new(0.25
,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(m.main,TweenInfo.new(0.6
,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()m:_runCallback()task.wait(
0.11)h.tweenService:Create(m.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,43)}):Play()h.tweenService:Create(m.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{Transparency=m.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(m)local n=m.window
m.main,m.stroke,m.interact=n:_buildCompactRow(m.tab,m.name)m.hoverOverlay=m.interact n:Create('UIPadding',{PaddingLeft=
UDim.new(0,16),PaddingRight=UDim.new(0,16),Parent=m.interact})n:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=
UDim.new(0,6),Parent=m.interact})if m.icon then m.iconLabel=n:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(16
,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=m.interact},{ImageColor3=
'ContentColor'})end m.title=n:Create('TextLabel',{Text=k.t(m.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=m.interact},{TextColor3='ContentColor',
FontFace='Font'})n:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=m.title})m.window:_wireElementHover(m)m.
window:ConnectFor(m,m.interact.MouseButton1Click,function()l.click()h.tweenService:Create(m.stroke,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()m:_runCallback()task.wait(0.11)h.tweenService:
Create(m.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=m.window.theme.
ElementStrokeTransparency}):Play()end)end function f._setShown(m,n,o)if n then m.window:_revealCommon(m,o)else m.window:
_hideCommon(m,o)end end function f._minWidth(m)local n=32 if m.icon then n+=22 end n+=i.textWidth(m.window.theme.Font,16
,m.name)return n end j(f)return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)local f=c.Parent.
Parent.utility local g,h,i,j,k,l=d(f.variables),d(f.filesystem),d(f.constants),d(f.locale),d(f.HapticEngine),{}function
l.buildCollapsedFace(m)m.collapsedIcon=m:Create('ImageLabel',{Name='CollapsedIcon',AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image=m.showIcon,ZIndex=i.zIndex.
restoreContent,ImageTransparency=1,Parent=m.main},{ImageColor3='TitlingColor'})m:Create('UICorner',{Parent=m.
collapsedIcon},{CornerRadius='PillCornerRadius'})local n=m:Create('Frame',{Name='CollapsedText',AnchorPoint=Vector2.new(
0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),BackgroundTransparency=1,ZIndex=i.zIndex.restoreContent
,Parent=m.main})m:Create('UIListLayout',{Padding=UDim.new(0,1),VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder
=Enum.SortOrder.LayoutOrder,Parent=n})m.collapsedTitle=m:Create('TextLabel',{Name='Title',Text=m.showName,Size=UDim2.
new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.Medium),RichText=true,TextSize=16,
TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=i.zIndex.restoreContent,TextTransparency=1
,Parent=n},{TextColor3='TitlingColor'})m.collapsedSubtitle=m:Create('TextLabel',{Name='Subtitle',Text=j.t'Tap to show',
Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.Medium),TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=i.zIndex.restoreContent,TextTransparency=1,Parent=n},{
TextColor3='TitlingColor'})m.collapsedInteract=m:Create('TextButton',{Name='CollapsedInteract',BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=i.zIndex.restoreInteract,Parent=m.main})m:
Connect(m.collapsedInteract.MouseButton1Click,function()k.click()m:ToggleHide()end)end function l.isNewUser()local m=g.
localPlayer if not m then return false end if typeof(h.isfile)~='function'or typeof(h.writefile)~='function'then return
true end local n,o,p=g.fileSystemManager:getPath'lastuser.txt',tostring(m.UserId),true pcall(function()if h.isfile(n)
then p=h.readfile(n)~=o end end)pcall(function()h.writefile(n,o)end)return p end function l.setCollapsedShown(m,n,o)
local p={[m.collapsedIcon]={ImageTransparency=if n then 0 else 1},[m.collapsedTitle]={TextTransparency=if n then 0 else
1},[m.collapsedSubtitle]={TextTransparency=if n then 0.5 else 1}}for q,r in p do if o then g.tweenService:Create(q,o,r):
Play()else for s,t in r do q[s]=t end end end end return l end)()end,[6]=function()local b,c,d=a(6)local e return(
function(...)local f={}f.__index=f f.__type='ColorPicker'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t
,u,v,w,x,y=d(g.variables),d(g.functions),d(g.moveable),d(g.constants),d(g.locale),d(g.HapticEngine),ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),
ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),
ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,0,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))},41,52,Vector2.new(150,120),184,10,214,10,240,62,8,400 local z,A,B,
C,D,E,F,G={wide={height=190,previewPos=UDim2.new(1,-20,0,p+39),previewSize=UDim2.new(1,-(v+20),0,78),hexPos=UDim2.new(0,
v,0,p+90),hexSize=UDim2.new(1,-(v+20+w+x),0,30),alphaFieldPos=UDim2.new(1,-(20+w),0,p+90),alphaFieldSize=UDim2.new(0,w,0
,30)},narrow={height=296,previewPos=UDim2.new(1,-20,0,p+q.Y+40),previewSize=UDim2.new(1,-40,0,56),hexPos=UDim2.new(0,20,
0,p+q.Y+78),hexSize=UDim2.new(1,-(40+w+x),0,30),alphaFieldPos=UDim2.new(1,-(20+w),0,p+q.Y+78),alphaFieldSize=UDim2.new(0
,w,0,30)}},UDim2.new(1,-16,0,o/2),UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function H(I)return math.clamp(I,0,1)end
local function I(J)return math.clamp(math.round(J),0,255)end local J={black=Color3.fromRGB(0,0,0),white=Color3.fromRGB(
255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0),blue=Color3.fromRGB(0,0,255),yellow=Color3.
fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(255,0,255),orange=Color3.fromRGB(255,165,0),
purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=Color3.fromRGB(139,69,19),gray=Color3.fromRGB(
128,128,128),grey=Color3.fromRGB(128,128,128)}local function K(L,M,N)if M<=0 then return Color3.new(N,N,N)end
local function O(P,Q,R)R=R%1 if R<0.16666666666666666 then return P+(Q-P)*6*R elseif R<0.5 then return Q elseif R<
0.6666666666666666 then return P+(Q-P)*(0.6666666666666666-R)*6 end return P end local P=if N<0.5 then N*(1+M)else N+M-N
*M local Q=2*N-P return Color3.new(O(Q,P,L+0.3333333333333333),O(Q,P,L),O(Q,P,L-0.3333333333333333))end local function L
(M)local N={}for O in M:gmatch'[%d%.]+'do table.insert(N,tonumber(O))end return N end local function M(N)if typeof(N)~=
'string'then return nil end local O=(N:lower():match'^%s*(.-)%s*$')or''if O==''then return nil end if J[O]then return J[
O]end local P,Q=O:match'^(%a+)',L(O)if(P=='hsv'or P=='hsb')and#Q>=3 then local R,S,T=(Q[1]%360)/360,if Q[2]>1 then Q[2]/
100 else Q[2],if Q[3]>1 then Q[3]/100 else Q[3]return Color3.fromHSV(R,H(S),H(T))end if P=='hsl'and#Q>=3 then local R,S,
T=(Q[1]%360)/360,if Q[2]>1 then Q[2]/100 else Q[2],if Q[3]>1 then Q[3]/100 else Q[3]return K(R,H(S),H(T))end if(P=='rgb'
or P=='rgba')and#Q>=3 then return Color3.fromRGB(I(Q[1]),I(Q[2]),I(Q[3]))end local R=O:match'^#?(%x%x%x%x%x%x)$'or O:
match'^#?(%x%x%x)$'or O:match'^0x(%x%x%x%x%x%x)$'if R then local S,T=pcall(Color3.fromHex,R)if S then return T end end
if#Q>=3 and not P then if Q[1]<=1 and Q[2]<=1 and Q[3]<=1 then return Color3.new(H(Q[1]),H(Q[2]),H(Q[3]))end return
Color3.fromRGB(I(Q[1]),I(Q[2]),I(Q[3]))end return nil end local function N(O,P)if typeof(O)=='Color3'then return O end
if typeof(O)=='string'then return M(O)or P end return P end function f.new(O,P)P=if typeof(P)=='table'then P else{}local
Q=setmetatable({tab=assert(O,'Missing argument #1 (Tab expected)'),window=O.window,name=P.name or P.Name or
'Color Picker',icon=P.icon or P.Icon,description=P.description or P.Description,forgetState=P.forgetState or P.
ForgetState or O.forgetState,callback=P.callback or P.Callback or function()end,_isOpen=false},f)Q.value=N(P.color or P.
Color or P.value or P.Value or P.default,Color3.fromRGB(255,255,255))Q.hue,Q.sat,Q.val=Q.value:ToHSV()local R=P.alpha or
P.Alpha Q.alpha=if type(R)=='number'then H(R)else 1 Q.flag=P.flag or P.Flag or(not Q.forgetState and i.
deriveFlagFromName(Q.name)or nil)Q.window:_registerControl(Q)Q.main=Q.window:Create('Frame',{Size=UDim2.new(1,-20,0,o),
BorderSizePixel=0,Name=Q.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=Q.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})Q.stroke=Q.window:StyleElementBody(Q.main)Q.hoverOverlay=Q.window:
CreateHoverOverlay(Q.main)Q:_buildHeader()Q:_buildPicker()Q.window:ConnectFor(Q,Q.interact.MouseButton1Click,function()m
.click()if Q._isOpen then Q:_close()else Q:_open()end end)Q.window:ConnectFor(Q,Q.main.MouseEnter,function()if Q._isOpen
or not Q.window:_interactive()then return end local S=Q.window.theme h.tweenService:Create(Q.stroke,D,{Transparency=S.
ElementStrokeHoverTransparency,Color=S.ElementStrokeHover}):Play()h.tweenService:Create(Q.title,D,{TextColor3=S.
ElementTextHoverColor}):Play()h.tweenService:Create(Q.hoverOverlay,D,{BackgroundTransparency=0.97}):Play()end)Q.window:
ConnectFor(Q,Q.main.MouseLeave,function()local S=Q.window.theme h.tweenService:Create(Q.stroke,D,{Transparency=S.
ElementStrokeTransparency,Color=S.ElementStroke}):Play()h.tweenService:Create(Q.title,D,{TextColor3=S.ContentColor}):
Play()h.tweenService:Create(Q.hoverOverlay,D,{BackgroundTransparency=1}):Play()end)if Q.description then Q.descriptor=d(
c.Parent.descriptor).new(Q.tab,{description=Q.description})end Q:_applyPickerVisibility(false,false)Q:
_setControlsVisible(false)Q.window:ConnectFor(Q,Q.main:GetPropertyChangedSignal'AbsoluteSize',function()if Q.window.
animating or(Q.window.hidden and Q.window.hasShownOnce)then return end Q:_applyLayout()end)Q:_applyLayout()Q:_render
'instant'return Q end function f._buildHeader(O)O.container=O.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position
=UDim2.new(0,20,0,o/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=O.main}
)O.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=O.container})if O.icon then O.iconLabel=O.
window:Create('ImageLabel',{Image=O.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=
5,ImageTransparency=1,Parent=O.container},{ImageColor3='ContentColor'})end O.title=O.window:Create('TextLabel',{Text=l.
t(O.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=O.container},{
TextColor3='ContentColor',FontFace='Font'})O.preview=O.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=A,
Size=B,BackgroundColor3=O.value,BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=O.main})O.window:Create(
'UICorner',{CornerRadius=UDim.new(0,8),Parent=O.preview})O.previewShadow=O.window:CreateGlow(O.preview,O.value,20,1)O.
invisibleGroup=O.window:Create('Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=O.preview})O.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=O.invisibleGroup})O.
invisibleIcon=O.window:Create('ImageLabel',{Image=k.icons.colorpicker,Size=UDim2.fromOffset(16,16),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,Parent=O.invisibleGroup},{ImageColor3=
'ContentColor'})O.invisibleText=O.window:Create('TextLabel',{Text=l.t'Invisible',Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=O.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})O.interact=O.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,o),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',
TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=O.main})end function f._buildMap(O)O.map=O.window:Create(
'Frame',{Position=UDim2.fromOffset(20,p),Size=UDim2.fromOffset(q.X,q.Y),BackgroundColor3=Color3.fromHSV(O.hue,1,1),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=O.main})O.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=O.map})O.mapStroke=O.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=O.map})O
.satOverlay=O.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=O.map})O.window:Create('UICorner',{CornerRadius=UDim.new(0,8)
,Parent=O.satOverlay})O.window:Create('UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=O.satOverlay})O.valOverlay=O.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=O.map})O.window:
Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=O.valOverlay})O.window:Create('UIGradient',{Rotation=90,
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)},Parent=O.valOverlay})
end function f._buildPicker(O)O:_buildMap()O.satCursor=O.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=
UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1
,Parent=O.map})O.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=O.satCursor})O.satCursorStroke=O.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=O.satCursor})O.mapInteract=O.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=7,Parent=O.map})O.hueBar=O.window:Create('Frame',{Position=UDim2.fromOffset(r,p),Size=UDim2
.fromOffset(s,q.Y),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=O.main})O.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=O.hueBar})O.window:Create('UIGradient',{
Color=n,Rotation=90,Parent=O.hueBar})O.hueHandle=O.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(s+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=
4,BackgroundTransparency=1,Parent=O.hueBar})O.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=O.hueHandle})O
.hueHandleStroke=O.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=O.
hueHandle})O.hueInteract=O.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=O.
hueBar})O.alphaBar=O.window:Create('Frame',{Position=UDim2.fromOffset(t,p),Size=UDim2.fromOffset(u,q.Y),BackgroundColor3
=O.value,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=O.main})O.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=O.alphaBar})O.alphaGradient=O.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=O.alphaBar})O.alphaHandle=O.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(u+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=O.alphaBar})O.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=O.alphaHandle})O.alphaHandleStroke=O.window:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=O.alphaHandle})O.alphaInteract=O.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=O.alphaBar})O.hexBox=O.window:Create(
'Frame',{Position=UDim2.new(0,v,0,p+90),Size=UDim2.new(1,-(v+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=O.main})O.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=O.hexBox})O.hexBoxStroke=O.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=O.
hexBox})O.hexInput=O.window:Create('TextBox',{Text='#'..O.value:ToHex():upper(),PlaceholderText=l.t'Smart Input',Size=
UDim2.new(1,-14,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=O.hexBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})O.alphaBox=O.window
:Create('Frame',{Position=UDim2.new(0,v,0,p+90),Size=UDim2.fromOffset(w,30),BackgroundColor3=Color3.fromRGB(255,255,255)
,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=O.main})O.window:Create('UICorner',{CornerRadius=UDim.new(0,
8),Parent=O.alphaBox})O.alphaBoxStroke=O.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,
Parent=O.alphaBox})O.alphaInput=O.window:Create('TextBox',{Text=tostring(math.round(O.alpha*100))..'%',PlaceholderText=
'100%',Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,
ZIndex=3,TextTransparency=1,Parent=O.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})O.window:ConnectFor(O,O.mapInteract.InputBegan,function(P)if P.UserInputType==Enum.UserInputType.
MouseButton1 or P.UserInputType==Enum.UserInputType.Touch then O:_beginDrag('sat',P.UserInputType==Enum.UserInputType.
MouseButton1)end end)O.window:ConnectFor(O,O.hueInteract.InputBegan,function(P)if P.UserInputType==Enum.UserInputType.
MouseButton1 or P.UserInputType==Enum.UserInputType.Touch then O:_beginDrag('hue',P.UserInputType==Enum.UserInputType.
MouseButton1)end end)O.window:ConnectFor(O,O.alphaInteract.InputBegan,function(P)if P.UserInputType==Enum.UserInputType.
MouseButton1 or P.UserInputType==Enum.UserInputType.Touch then O:_beginDrag('alpha',P.UserInputType==Enum.UserInputType.
MouseButton1)end end)O.window:ConnectFor(O,h.userInputService.InputEnded,function(P)if(P.UserInputType==Enum.
UserInputType.MouseButton1 or P.UserInputType==Enum.UserInputType.Touch)and O._drag then O:_endDrag()end end)O.window:
ConnectFor(O,O.hexInput.FocusLost,function()local P=M(O.hexInput.Text)if P then O:Set(P)else O.hexInput.Text='#'..O.
value:ToHex():upper()end end)O.window:ConnectFor(O,O.alphaInput.FocusLost,function()local P=tonumber((O.alphaInput.Text:
gsub('[^%d%.]','')))if P then O:SetAlpha(H(P/100))else O.alphaInput.Text=tostring(math.round(O.alpha*100))..'%'end end)
end function f._beginDrag(O,P,Q)if not O._isOpen then return end O._drag=P O._dragIsMouse=Q O:_setHeld(P)O:_pump()if O.
_dragConnection then O._dragConnection:Disconnect()O._dragConnection=nil end O._dragConnection=h.runService.
RenderStepped:Connect(function()local R=O._dragIsMouse and not h.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if O.window.unloaded or not O._drag or R then if R then O:_endDrag()return end if O.
_dragConnection then O._dragConnection:Disconnect()O._dragConnection=nil end return end O:_pump()end)end function f.
_endDrag(O)O._drag=nil O:_setHeld(nil)if O._dragConnection then O._dragConnection:Disconnect()O._dragConnection=nil end
O.window:_persist(O)end function f._setHeld(O,P)local Q,R,S=if P=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if P=='hue'then UDim2.fromOffset(s+12,10)else UDim2.fromOffset(s+8,8),if P=='alpha'then UDim2.
fromOffset(u+12,10)else UDim2.fromOffset(u+8,8)h.tweenService:Create(O.satCursor,G,{Size=Q}):Play()h.tweenService:
Create(O.hueHandle,G,{Size=R}):Play()h.tweenService:Create(O.alphaHandle,G,{Size=S}):Play()end function f._mouseLocation
(O)local P,Q=h.userInputService:GetMouseLocation(),O.window.screenGui if Q and Q.IgnoreGuiInset then return P-h.
guiService:GetGuiInset()end return P end function f._pump(O)local P,Q,R,S=O.hue,O.sat,O.val,O.alpha if O._drag=='sat'
then local T=O.map.AbsoluteSize if T.X<=0 or T.Y<=0 then return end local U=O:_mouseLocation()O.sat=H((U.X-O.map.
AbsolutePosition.X)/T.X)O.val=1-H((U.Y-O.map.AbsolutePosition.Y)/T.Y)elseif O._drag=='hue'then local T=O.hueBar.
AbsoluteSize.Y if T<=0 then return end local U=O:_mouseLocation()O.hue=H((U.Y-O.hueBar.AbsolutePosition.Y)/T)elseif O.
_drag=='alpha'then local T=O.alphaBar.AbsoluteSize.Y if T<=0 then return end local U=O:_mouseLocation()O.alpha=1-H((U.Y-
O.alphaBar.AbsolutePosition.Y)/T)else return end if O.hue==P and O.sat==Q and O.val==R and O.alpha==S then return end O.
value=Color3.fromHSV(O.hue,O.sat,O.val)O:_render'drag'O:_fireCallback()end function f._render(O,P)local Q,R,S,T,U,V=
Color3.fromHSV(O.hue,1,1),UDim2.new(O.sat,0,1-O.val,0),UDim2.new(0.5,0,O.hue,0),UDim2.new(0.5,0,1-O.alpha,0),1-O.alpha,1
-0.4*O.alpha if P=='instant'then O.map.BackgroundColor3=Q O.satCursor.Position,O.satCursor.BackgroundColor3=R,O.value O.
hueHandle.Position,O.hueHandle.BackgroundColor3=S,Q O.alphaBar.BackgroundColor3=O.value O.alphaHandle.Position,O.
alphaHandle.BackgroundColor3=T,O.value O.preview.BackgroundColor3=O.value O.previewShadow.Color=O.value if not O.window.
hidden then O.preview.BackgroundTransparency=U O.previewShadow.Transparency=V end else local W=if P=='drag'then F else E
h.tweenService:Create(O.map,W,{BackgroundColor3=Q}):Play()h.tweenService:Create(O.satCursor,W,{Position=R,
BackgroundColor3=O.value}):Play()h.tweenService:Create(O.hueHandle,W,{Position=S,BackgroundColor3=Q}):Play()h.
tweenService:Create(O.alphaHandle,W,{Position=T,BackgroundColor3=O.value}):Play()h.tweenService:Create(O.alphaBar,E,{
BackgroundColor3=O.value}):Play()local X,Y={BackgroundColor3=O.value},{Color=O.value}if not O.window.hidden then X.
BackgroundTransparency=U Y.Transparency=V end h.tweenService:Create(O.preview,E,X):Play()h.tweenService:Create(O.
previewShadow,E,Y):Play()end if not O.hexInput:IsFocused()then O.hexInput.Text='#'..O.value:ToHex():upper()end if not O.
alphaInput:IsFocused()then O.alphaInput.Text=tostring(math.round(O.alpha*100))..'%'end O:_renderInvisible(P~='instant')
end function f._renderInvisible(O,P)local Q=0 if O._isOpen and not O.window.hidden then Q=H((0.12-O.alpha)/0.12)end
local R=1-Q if P then h.tweenService:Create(O.invisibleIcon,D,{ImageTransparency=R}):Play()h.tweenService:Create(O.
invisibleText,D,{TextTransparency=R}):Play()else O.invisibleIcon.ImageTransparency=R O.invisibleText.TextTransparency=R
end end function f._fireCallback(O)O.window:_runGuarded(O,O.callback,O.value,O.alpha)end function f._open(O)if O._isOpen
then return end O._isOpen=true O:_setControlsVisible(true)if O._outsideClickConn then O.window:Disconnect(O.
_outsideClickConn)end O._outsideClickConn=O.window:Connect(h.userInputService.InputBegan,function(P)if P.UserInputType~=
Enum.UserInputType.MouseButton1 and P.UserInputType~=Enum.UserInputType.Touch then return end local Q,R,S=P.Position,O.
main.AbsolutePosition,O.main.AbsoluteSize if Q.X<R.X or Q.X>R.X+S.X or Q.Y<R.Y or Q.Y>R.Y+S.Y then O:_close()end end)h.
tweenService:Create(O.main,C,{Size=UDim2.new(1,-20,0,O._openHeight)}):Play()h.tweenService:Create(O.preview,C,{Position=
O._previewOpenPos,Size=O._previewOpenSize}):Play()O:_applyPickerVisibility(true,true)O:_renderInvisible(true)end
function f._close(O)if not O._isOpen then return end O._isOpen=false if O._outsideClickConn then O.window:Disconnect(O.
_outsideClickConn)O._outsideClickConn=nil end if O._drag then O:_endDrag()end if O.hexInput:IsFocused()then O.hexInput:
ReleaseFocus()end O:_applyPickerVisibility(false,true)O:_renderInvisible(true)h.tweenService:Create(O.preview,C,{
Position=A,Size=B}):Play()h.tweenService:Create(O.main,C,{Size=UDim2.new(1,-20,0,o)}):Play()task.delay(D.Time,function()
if not O._isOpen then O:_setControlsVisible(false)end end)end function f._applyPickerVisibility(O,P,Q)local R={[O.map]={
BackgroundTransparency=if P then 0 else 1},[O.satOverlay]={BackgroundTransparency=if P then 0 else 1},[O.valOverlay]={
BackgroundTransparency=if P then 0 else 1},[O.mapStroke]={Transparency=if P then 0.9 else 1},[O.satCursor]={
BackgroundTransparency=if P then 0 else 1},[O.satCursorStroke]={Transparency=if P then 0 else 1},[O.hueBar]={
BackgroundTransparency=if P then 0 else 1},[O.hueHandle]={BackgroundTransparency=if P then 0 else 1},[O.hueHandleStroke]
={Transparency=if P then 0 else 1},[O.alphaBar]={BackgroundTransparency=if P then 0 else 1},[O.alphaHandle]={
BackgroundTransparency=if P then 0 else 1},[O.alphaHandleStroke]={Transparency=if P then 0 else 1},[O.hexBox]={
BackgroundTransparency=if P then 0.9 else 1},[O.hexBoxStroke]={Transparency=if P then 0.85 else 1},[O.hexInput]={
TextTransparency=if P then 0.4 else 1},[O.alphaBox]={BackgroundTransparency=if P then 0.9 else 1},[O.alphaBoxStroke]={
Transparency=if P then 0.85 else 1},[O.alphaInput]={TextTransparency=if P then 0.4 else 1}}for S,T in R do if Q then h.
tweenService:Create(S,D,T):Play()else for U,V in T do S[U]=V end end end end function f._setControlsVisible(O,P)for Q,R
in{O.map,O.hueBar,O.alphaBar,O.hexBox,O.alphaBox}do R.Visible=P end end function f._applyLayout(O)local P=O.main.
AbsoluteSize.X local Q=if P>0 and P<y then'narrow'else'wide'if Q==O._layoutMode then return end O._layoutMode=Q local R=
z[Q]O._openHeight=R.height O._previewOpenPos=R.previewPos O._previewOpenSize=R.previewSize O.hexBox.Position=R.hexPos O.
hexBox.Size=R.hexSize O.alphaBox.Position=R.alphaFieldPos O.alphaBox.Size=R.alphaFieldSize if O._isOpen then h.
tweenService:Create(O.main,C,{Size=UDim2.new(1,-20,0,O._openHeight)}):Play()h.tweenService:Create(O.preview,C,{Position=
O._previewOpenPos,Size=O._previewOpenSize}):Play()end end function f.Set(O,P,Q)O.value=N(P,O.value)O.hue,O.sat,O.val=O.
value:ToHSV()O:_render(if O._isOpen then'animate'else'instant')if not Q then O:_fireCallback()O.window:_persist(O)end
end function f.SetAlpha(O,P,Q)O.alpha=H(if type(P)=='number'then P else O.alpha)O:_render(if O._isOpen then'animate'else
'instant')if not Q then O:_fireCallback()O.window:_persist(O)end end function f._serialize(O)return O.value:ToHex()..
string.format('%02x',math.clamp(math.round((O.alpha or 1)*255),0,255))end function f._deserialize(O,P)local Q=tostring(P
)if#Q>=8 then O:SetAlpha((tonumber(Q:sub(7,8),16)or 255)/255,true)Q=Q:sub(1,6)end O:Set(Color3.fromHex(Q))end function f
._setShown(O,P,Q)local R=O.window if P then R:_revealCommon(O,Q)R:_reveal(O.preview,{BackgroundTransparency=1-O.alpha},Q
)R:_reveal(O.previewShadow,{Transparency=1-0.4*O.alpha},Q)else R:_hideCommon(O,Q)R:_reveal(O.preview,{
BackgroundTransparency=1},Q)R:_reveal(O.previewShadow,{Transparency=1},Q)if O._isOpen then O:_close()end end end j(f)
return f end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)local f={}f.__index=f f.__type='Descriptor'
local g=d(c.Parent.Parent.utility.locale)function f.new(h,i)i=if typeof(i)=='table'then i else{}local j=setmetatable({
tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.window,description=i.description or i.Description or''},f)j.
main=j.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),
Parent=j.tab.tabPage})j.window:Create('UIListLayout',{SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.main})j.titleLabel=j
.window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-
90,0,0),Text=g.t(j.description),TextSize=12,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,
Parent=j.main},{TextColor3='ContentColor',FontFace='Font'})j.window:Create('Frame',{BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=j.main})return j end return f end)()end,[8]=function(
)local b,c,d=a(8)local e return(function(...)local f={}f.__index=f f.__type='Drag'local g=c.Parent.Parent.utility local
h,i=d(g.variables),d(g.constants)function f.new(j,k)k=if typeof(k)=='table'then k else{}local l=setmetatable({window=
assert(j,'Missing argument #1 (Window expected)')},f)l.drag=l.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2
.fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,l.window.size.Y.Offset/2+15),ZIndex=i.
zIndex.drag,Visible=false,Parent=l.window.screenGui})l.dragCosmetic=l.window:Create('Frame',{BackgroundColor3=Color3.
fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=i.zIndex.drag,
BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=l.drag})l.window:Create('UICorner',{CornerRadius=UDim.new(0,
20),Parent=l.dragCosmetic})l.window:CreateGlow(l.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)l.dragInteract=l.window
:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=i.zIndex.drag,Parent=
l.drag})local m,n,o,p=false,Vector2.zero,(l.window.screenGui)if o and o.IgnoreGuiInset then n=h.guiService:GetGuiInset()
end local function q()local r,s,t=h.userInputService and h.userInputService:GetMouseLocation()or Vector2.new(0,0),p or
Vector2.new(0,0),n or Vector2.new(0,0)return r+s+t end local function r()local s=q()local t,u=s.X,s.Y if l.window.
settings and l.window.settings.keepOnScreen then local v,w,x=l.window.main.AbsoluteSize,l.window.screenGui.AbsoluteSize,
8 local y,z=v.X/2,v.Y/2 t=math.clamp(t,y+x,math.max(y+x,w.X-y-x))u=math.clamp(u,z+x,math.max(z+x,w.Y-z-x))end local v,w=
UDim2.fromOffset(t,u),UDim2.fromOffset(t,u+(l.window.main.Size.Y.Offset/2+15))return v,w end l.window:Connect(l.drag.
MouseEnter,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.25,Enum.
EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)l.
window:Connect(l.drag.MouseLeave,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,
TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)
}):Play()end end)local function s()if not m then return end m=false if not l.window:_interactive()then return end h.
tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,
100,0,4),BackgroundTransparency=0.7}):Play()local t,u,v=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),r()h.tweenService:Create(l.window.main,t,{Position=u}):Play()h.tweenService:Create(l.drag,t,{Position=v}):Play()end
l.window:Connect(l.dragInteract.InputBegan,function(t,u)if u then return end local v=t.UserInputType.Name if v==
'MouseButton1'or v=='Touch'then if not l.window:_interactive()then return end m=true if o and o.IgnoreGuiInset then n=h.
guiService:GetGuiInset()end p=l.window.main.AbsolutePosition+l.window.main.AbsoluteSize*l.window.main.AnchorPoint-h.
userInputService:GetMouseLocation()if not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,
Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,110,0,4),BackgroundTransparency=0}):Play()end end end)
l.window:Connect(h.userInputService.InputEnded,function(t)local u=t.UserInputType.Name if u=='MouseButton1'or u=='Touch'
then s()end end)l.window:Connect(h.userInputService.WindowFocusReleased,s)local t,u=1e-7,1e-60 l.window:Connect(h.
runService.RenderStepped,function(v)if not m then return end if not l.window:_interactive()then s()return end local w,x=
r()l.window.main.Position=l.window.main.Position:Lerp(w,1-t^v)l.drag.Position=l.drag.Position:Lerp(x,1-u^v)end)return l
end return f end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f={}f.__index=f f.__type=
'Dropdown'local g=c.Parent.Parent.utility local h,i,j,k,l,m=d(g.variables),d(g.functions),d(g.image),d(g.constants),d(g.
locale),d(g.HapticEngine)local n,o,p,q,r,s,t,u,v=k.icons.chevron,k.icons.check,k.icons.dot,k.icons.search,UDim.new(0,12)
,UDim.new(0,7),30,38,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)local function w(x)local y
,z={},{}for A,B in x do if typeof(B)=='string'and not y[B]then y[B]=true table.insert(z,B)end end return z end
local function x(y,z)if y==nil then return{}end if typeof(y)=='string'then return{y}end if typeof(y)=='table'then local
A=w(y)if not z and#A>1 then return{A[1]}end return A end return{}end local function y(z,A)local B={}for C,D in z do if
table.find(A,D)then table.insert(B,D)end end return B end local function z(A,B)if#A~=#B then return false end for C,D in
A do if not table.find(B,D)then return false end end return true end function f.new(A,B)B=if typeof(B)=='table'then B
else{}local C,D=B.options or B.Options or{},B.multiSelect or B.MultiSelect or B.MultipleOptions or false local E=
setmetatable({tab=assert(A,'Missing argument #1 (Tab expected)'),window=A.window,name=B.name or B.Name or'Dropdown',icon
=B.icon or B.Icon,description=B.description or B.Description,forgetState=B.forgetState or B.ForgetState or A.forgetState
,flag=B.flag or B.Flag or(not(B.forgetState or B.ForgetState or A.forgetState)and i.deriveFlagFromName(B.name or B.Name
or'Dropdown')or nil),callback=B.callback or B.Callback or function()end,options=w(C),multiSelect=D,placeholderText=l.
resolve(B.placeholder or B.Placeholder or'None'),value=x(B.value or B.Value or B.currentOption or B.CurrentOption,D),
_isOpen=false,_optionFrames={}},f)E._desiredValue=E.value E.value=y(E.value,E.options)E.window:_registerControl(E)E.main
=E.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=E.name,ClipsDescendants=true,
BackgroundTransparency=1,Parent=E.tab.tabPage})E.top=E.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.
fromScale(0,0),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=E
.main},{BackgroundTransparency='ElementTransparency'})E.stroke=E.window:StyleElementPanel(E.top)E.hoverOverlay=E.window:
CreateHoverOverlay(E.top)E.flashTarget=E.top E.container=E.window:Create('Frame',{BorderSizePixel=0,Parent=E.top,Size=
UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})E
.containerLayout=E.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=E.container})if
E.icon then E.iconLabel=E.window:Create('ImageLabel',{Image=E.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=E.container},{ImageColor3='ContentColor'})end E.title=E.
window:Create('TextLabel',{Text=l.t(E.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=E.container},{TextColor3='ContentColor',FontFace='Font'})E.selectedLabel=E.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.fromOffset(168,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextWrapped=true,
TextTransparency=1,ZIndex=5,Parent=E.top},{TextColor3='ContentColor',FontFace='Font'})E.chevron=E.window:Create(
'ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,Image='rbxassetid://'..tostring(n),Rotation=180,ImageTransparency=1,ZIndex=5,
Parent=E.top},{ImageColor3='ContentColor'})E.interact=E.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false
,Parent=E.main})E.panel=E.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.
new(1,0,1,-47),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,BackgroundTransparency=1,Parent=E
.main})E.panelStroke=E.window:StyleElementPanel(E.panel)E.window:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=E.panel})E.window:Create('UIPadding',{PaddingTop=
UDim.new(0,7),PaddingBottom=UDim.new(0,6),Parent=E.panel})E:_buildSearch()E.list=E.window:Create('ScrollingFrame',{
Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=true,AutomaticCanvasSize
=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),ScrollBarImageColor3=Color3.fromRGB(240,240,240),ScrollBarThickness=3,
ScrollBarImageTransparency=1,ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,ZIndex=1,Parent=E.panel})E.
window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=E.list})E.listLayout=E.window:Create('UIListLayout',{
Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Center,Parent=E.
list})E.window:Create('UIPadding',{PaddingBottom=UDim.new(0,2),Parent=E.list})local function F(G)return table.find(E.
value,G)~=nil end local function G(H,I)local J=F(H.name)local K,L,M,N=if E._isOpen then(J and 0.9 or 0.95)else 1,if E.
_isOpen then(J and 0 or 0.3)else 1,if E._isOpen then(J and 0 or 0.7)else 1,if E._isOpen then(J and 0.85 or 0.93)else 1 j
.assign(H.checkIcon,'Image',if J then o else p)if I then local O=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out)h.tweenService:Create(H.frame,O,{BackgroundTransparency=K}):Play()h.tweenService:Create(H.title,O,{
TextTransparency=L}):Play()h.tweenService:Create(H.checkIcon,O,{ImageTransparency=M}):Play()h.tweenService:Create(H.
stroke,O,{Transparency=N}):Play()else H.frame.BackgroundTransparency=K H.title.TextTransparency=L H.checkIcon.
ImageTransparency=M H.stroke.Transparency=N end end local function H()if E.multiSelect then local I=#E.value if I==0
then E.selectedLabel.Text=E.placeholderText elseif I==1 then E.selectedLabel.Text=E.value[1]else E.selectedLabel.Text=l.
resolve'Various'end else E.selectedLabel.Text=E.value[1]or E.placeholderText end end E._renderOptionState=G E.
_updateSelectedLabel=H local function I(J)local K=E.window:Create('Frame',{Size=UDim2.new(1,-12,0,38),BorderSizePixel=0,
BackgroundTransparency=1,Parent=E.list},{BackgroundColor3='DropdownHighlight'})local L,M,N,O=E.window:Create('UICorner',
{CornerRadius=s,Parent=K}),E.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=K}),E.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=50,
Parent=K}),E.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),Size=UDim2.fromOffset(
170,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=K})E.window:Create('UIListLayout',{Padding=UDim.new(0
,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder
.LayoutOrder,Parent=O})local P,Q=E.window:Create('ImageLabel',{Image='rbxassetid://'..tostring(o),Size=UDim2.fromOffset(
16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=O},{ImageColor3='ContentColor'}),E
.window:Create('TextLabel',{Text=J,Size=UDim2.fromOffset(170,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=O},{TextColor3
='ContentColor',FontFace='Font'})local R={name=J,frame=K,interact=N,title=Q,checkIcon=P,container=O,stroke=M,corner=L,
connections={}}table.insert(R.connections,E.window:ConnectFor(E,K.MouseEnter,function()if not E._isOpen or not E.window:
_interactive()then return end if F(J)then return end h.tweenService:Create(K,TweenInfo.new(0.2,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=0.9}):Play()h.tweenService:Create(Q,TweenInfo.new(0.2,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{TextTransparency=0.15}):Play()end))table.insert(R.connections,E.window:ConnectFor(E,K.
MouseLeave,function()if not E._isOpen then return end if F(J)then return end h.tweenService:Create(K,TweenInfo.new(0.2,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.95}):Play()h.tweenService:Create(Q,TweenInfo.
new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(R.connections,E
.window:ConnectFor(E,N.MouseButton1Click,function()if not E._isOpen then return end m.click()local S=F(J)if not E.
multiSelect then if S then E:_close()return end table.clear(E.value)table.insert(E.value,J)else if S then local T=table.
find(E.value,J)if T then table.remove(E.value,T)end else table.insert(E.value,J)end end E._desiredValue=table.clone(E.
value)for T,U in E._optionFrames do G(U,true)end H()E.window:_runGuarded(E,E.callback,E:_callbackValue())E.window:
_persist(E)if not E.multiSelect then task.wait(0.1)E:_close()end end))return R end E._buildOption=I for J,K in E.options
do local L=I(K)table.insert(E._optionFrames,L)end H()E:_updateCorners()E.window:ConnectFor(E,E.interact.
MouseButton1Click,function()m.click()if E._isOpen then E:_close()else E:_open()end end)E.window:ConnectFor(E,E.main.
MouseEnter,function()if E._isOpen or not E.window:_interactive()then return end h.tweenService:Create(E.title,TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextColor3=E.window.theme.ElementTextHoverColor}):Play()h.
tweenService:Create(E.hoverOverlay,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=0.97}):Play()end)E.window:ConnectFor(E,E.main.MouseLeave,function()h.tweenService:Create(E.title,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextColor3=E.window.theme.ContentColor}):Play()h.
tweenService:Create(E.hoverOverlay,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=1}):Play()end)if E.description then E.descriptor=d(c.Parent.descriptor).new(E.tab,{description=E.
description})end return E end function f._callbackValue(A)if A.multiSelect then return table.clone(A.value)end return A.
value[1]end function f._buildSearch(A)A._searchOpen=false A.searchbar=A.window:Create('Frame',{Name='Search',Size=UDim2.
new(1,-12,0,t),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,LayoutOrder=1,
ClipsDescendants=false,ZIndex=1,Parent=A.panel})A.window:Create('UICorner',{CornerRadius=UDim.new(0,12),Parent=A.
searchbar})A.searchStroke=A.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=A.
searchbar})A.searchShadow=A.window:CreateGlow(A.searchbar,Color3.fromRGB(255,255,255),20,1)A.searchToggle=A.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=51,Parent=A.
searchbar})A.searchInput=A.window:Create('TextBox',{Text='',PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),
Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,Interactable=false,ZIndex=52,TextTransparency=1,Parent=A.
searchbar},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})A.searchIcon=A.window:
Create('ImageButton',{Image='rbxassetid://'..tostring(q),Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,
ImageTransparency=1,Parent=A.searchbar},{ImageColor3='ContentColor'})A.window:ConnectFor(A,A.searchToggle.
MouseButton1Click,function()if not A._searchOpen then A:_expandSearch()end end)A.window:ConnectFor(A,A.searchIcon.
MouseButton1Click,function()if A._searchOpen then A:_collapseSearch()else A:_expandSearch()end end)A.window:ConnectFor(A
,A.searchInput:GetPropertyChangedSignal'Text',function()A:_applyFilter(A.searchInput.Text)end)A.window:ConnectFor(A,A.
searchInput.FocusLost,function()if A.searchInput.Text==''then A:_collapseSearch()end end)end function f._expandSearch(A)
if A._searchOpen then return end A._searchOpen=true A.searchInput.TextEditable=true A.searchInput.Interactable=true h.
tweenService:Create(A.searchbar,v,{Size=UDim2.new(1,-12,0,u),BackgroundTransparency=0.92}):Play()h.tweenService:Create(A
.searchStroke,v,{Transparency=0.86}):Play()h.tweenService:Create(A.searchShadow,v,{Transparency=0.92}):Play()h.
tweenService:Create(A.searchInput,v,{TextTransparency=0.3}):Play()A.searchInput:CaptureFocus()end function f.
_collapseSearch(A)if not A._searchOpen then return end A._searchOpen=false A.searchInput.TextEditable=false A.
searchInput.Interactable=false A.searchInput:ReleaseFocus()A.searchInput.Text=''h.tweenService:Create(A.searchbar,v,{
Size=UDim2.new(1,-12,0,t),BackgroundTransparency=1}):Play()h.tweenService:Create(A.searchStroke,v,{Transparency=1}):
Play()h.tweenService:Create(A.searchShadow,v,{Transparency=1}):Play()h.tweenService:Create(A.searchInput,v,{
TextTransparency=1}):Play()end function f._applyFilter(A,B)B=string.lower(B or'')for C,D in A._optionFrames do D.frame.
Visible=B==''or string.find(string.lower(D.name),B,1,true)~=nil end A:_updateCorners()A:_resizeToOptions()end function f
._resizeToOptions(A)if not A._isOpen then return end h.tweenService:Create(A.main,v,{Size=UDim2.new(1,-20,0,A:
_openHeight())}):Play()end function f._updateCorners(A)local B={}for C,D in A._optionFrames do if D.frame.Visible then
table.insert(B,D)end end for C,D in B do local E,F=if C==1 then r else s,if C==#B then r else s D.corner.TopLeftRadius=E
D.corner.TopRightRadius=E D.corner.BottomLeftRadius=F D.corner.BottomRightRadius=F end end function f._openHeight(A)
local B=0 for C,D in A._optionFrames do if D.frame.Visible then B+=1 end end local C=B*38+math.max(0,B-1)*5+2 return
math.min(180,95+C)end function f._open(A)if A._isOpen then return end A._isOpen=true if A._outsideClickConn then A.
window:Disconnect(A._outsideClickConn)end A._outsideClickConn=A.window:Connect(h.userInputService.InputBegan,function(B)
if B.UserInputType~=Enum.UserInputType.MouseButton1 and B.UserInputType~=Enum.UserInputType.Touch then return end local
C,D,E=B.Position,A.main.AbsolutePosition,A.main.AbsoluteSize if C.X<D.X or C.X>D.X+E.X or C.Y<D.Y or C.Y>D.Y+E.Y then A:
_close()end end)h.tweenService:Create(A.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=UDim2.new(1,-20,0,A:_openHeight())}):Play()h.tweenService:Create(A.chevron,TweenInfo.new(0.7,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(A.panel,TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=A.window.theme.ElementTransparency or 0}):Play()h.
tweenService:Create(A.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=A.
window.theme.ElementStrokeTransparency}):Play()h.tweenService:Create(A.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),{ImageTransparency=0.5}):Play()for B,C in A._optionFrames do A._renderOptionState(C,true
)end end function f._close(A)if not A._isOpen then return end A._isOpen=false if A._outsideClickConn then A.window:
Disconnect(A._outsideClickConn)A._outsideClickConn=nil end A:_collapseSearch()h.tweenService:Create(A.chevron,TweenInfo.
new(0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):Play()h.tweenService:Create(A.panel,
TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=1}):Play()h.tweenService:
Create(A.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.
tweenService:Create(A.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=1
}):Play()for B,C in A._optionFrames do A._renderOptionState(C,true)end h.tweenService:Create(A.main,TweenInfo.new(0.5,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()end function f._destroyOption
(A,B)if B.connections then for C,D in B.connections do local E=table.find(A.connections,D)if E then table.remove(A.
connections,E)end A.window:Disconnect(D)end B.connections=nil end A.window:DestroySubtree(B.frame)end function f.Refresh
(A,B)A.options=w(B or{})for C,D in A._optionFrames do A:_destroyOption(D)end table.clear(A._optionFrames)local C=A.value
A.value=y(A._desiredValue or A.value,A.options)local D=not z(A.value,C)for E,F in A.options do local G=A._buildOption(F)
table.insert(A._optionFrames,G)if A._isOpen then A._renderOptionState(G,false)end end A._updateSelectedLabel()A:
_applyFilter(if A._searchOpen then A.searchInput.Text else'')if D then A.window:_runGuarded(A,A.callback,A:
_callbackValue())A.window:_persist(A)end end function f.Add(A,B)if typeof(B)~='string'or B==''then return end if table.
find(A.options,B)then return end table.insert(A.options,B)local C=A._buildOption(B)table.insert(A._optionFrames,C)if A.
_isOpen then A._renderOptionState(C,true)end A:_applyFilter(if A._searchOpen then A.searchInput.Text else'')end function
f.Remove(A,B)local C=table.find(A.options,B)if not C then return end table.remove(A.options,C)for D,E in A._optionFrames
do if E.name==B then A:_destroyOption(E)table.remove(A._optionFrames,D)break end end local D=table.find(A.value,B)if D
then table.remove(A.value,D)A._desiredValue=table.clone(A.value)A._updateSelectedLabel()A.window:_runGuarded(A,A.
callback,A:_callbackValue())A.window:_persist(A)end A:_applyFilter(if A._searchOpen then A.searchInput.Text else'')end
function f.Set(A,B,C)local D=x(B,A.multiSelect)A._desiredValue=D A.value=y(D,A.options)for E,F in A._optionFrames do A.
_renderOptionState(F,true)end A._updateSelectedLabel()if not C then A.window:_runGuarded(A,A.callback,A:_callbackValue()
)A.window:_persist(A)end end function f._setShown(A,B,C)local D=A.window D:_reveal(A.stroke,{Transparency=if B then D.
theme.ElementStrokeTransparency else 1},C)D:_reveal(A.title,{TextTransparency=if B then 0 else 1},C)D:_reveal(A.top,{
BackgroundTransparency=if B then(D.theme.ElementTransparency or 0)else 1},C)if A.iconLabel then D:_reveal(A.iconLabel,{
ImageTransparency=if B then 0 else 1},C)end if A.descriptor then D:_reveal(A.descriptor.titleLabel,{TextTransparency=if
B then 0.7 else 1},C)end D:_reveal(A.selectedLabel,{TextTransparency=if B then 0.5 else 1},C)D:_reveal(A.chevron,{
ImageTransparency=if B then 0.5 else 1},C)if not B and A._isOpen then A:_close()end end function f.MoveTo(A,B)A.tab:
_moveElement(A,B)end function f.MoveToTop(A)A.tab:_moveElement(A,1)end function f.MoveToBottom(A)A.tab:_moveElement(A,#A
.tab.elements)end function f.MoveUp(A)local B=table.find(A.tab.elements,A)if B then A.tab:_moveElement(A,B-1)end end
function f.MoveDown(A)local B=table.find(A.tab.elements,A)if B then A.tab:_moveElement(A,B+1)end end return f end)()end,
[10]=function()local b,c,d=a(10)local e return(function(...)local f={}f.__index=f f.__type='Group'local g,h,i,j,k=d(c.
Parent.Parent.utility.moveable),d(c.Parent.Parent.utility.log),d(c.Parent.Parent.utility.ordering),8,{button=true,toggle
=true,stat=true,slider=true}function f.new(l,m)m=if typeof(m)=='table'then m else{}local n=string.lower(m.direction or m
.Direction or'row')local o=n=='column'or n=='vertical'local p=not o local q=if p then Enum.FillDirection.Horizontal else
Enum.FillDirection.Vertical local r,s=setmetatable({tab=assert(l,'Missing argument #1 (Tab expected)'),window=l.window,
direction=q,compact=p,forgetState=l.forgetState,elements={}},f),l.direction==Enum.FillDirection.Horizontal r.main=r.
window:Create('Frame',{Name='Group',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=
if p then UDim2.new(1,-20,0,0)else UDim2.new(1,0,0,0),Parent=r.tab.tabPage})if s then r.main.Size=UDim2.new(0,0,0,0)r.
window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=r.main})end r.tabPage=r.main r.layout=r.window:Create(
'UIListLayout',{FillDirection=q,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,j),VerticalAlignment=if p then
Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top,HorizontalAlignment=if p then Enum.HorizontalAlignment.
Left else Enum.HorizontalAlignment.Center,Parent=r.main})return r end function f._add(l,m,n)if l.compact and not k[m]
then h.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{m}'. Use a column for it.`
)return nil end local o=d(c.Parent[m]).new(l,n)table.insert(l.elements,o)i(o,#l.elements*10)l.window:_restoreLate(o)if l
.compact then l:_wrapChild(o)end l:_reflowRow()if not l.window.hidden then o:_setShown(true,true)end return o end
function f._reflowRow(l)if l.direction~=Enum.FillDirection.Horizontal then return end local m=#l.elements>0 for n,o in l
.elements do if o.__type~='Group'then m=false break end end l.layout.Padding=if m then UDim.new(0,-10)else UDim.new(0,j)
end function f._wrapChild(l,m)l.layout.Wraps=true l.layout.HorizontalFlex=Enum.UIFlexAlignment.Fill m._widthManaged=true
local n=if m._minWidth then m:_minWidth()else 0 if n>0 then m.main.AutomaticSize=Enum.AutomaticSize.None m.main.Size=
UDim2.new(0,n,m.main.Size.Y.Scale,m.main.Size.Y.Offset)end end function f.CreateButton(l,m)return l:_add('button',m)end
function f.CreateToggle(l,m)return l:_add('toggle',m)end function f.CreateSwitch(l,m)return l:_add('toggle',m)end
function f.CreateStat(l,m)return l:_add('stat',m)end function f.CreateSlider(l,m)return l:_add('slider',m)end function f
.CreateDropdown(l,m)return l:_add('dropdown',m)end function f.CreateSection(l,m)return l:_add('section',m)end function f
._addGroup(l,m)m=if typeof(m)=='table'then table.clone(m)else{}if l.direction==Enum.FillDirection.Horizontal then l.
layout.VerticalAlignment=Enum.VerticalAlignment.Top if l.tab.direction~=Enum.FillDirection.Horizontal then l.main.Size=
UDim2.new(1,0,0,0)end end local n=f.new(l,m)table.insert(l.elements,n)n.main.LayoutOrder=#l.elements*10 l:_reflowRow()
return n end function f.CreateGroup(l,m)return l:_addGroup(m)end function f._moveElement(l,m,n)local o=table.find(l.
elements,m)if not o then return end table.remove(l.elements,o)n=math.clamp(n,1,#l.elements+1)table.insert(l.elements,n,m
)for p,q in l.elements do i(q,p*10)end end function f._setShown(l,m,n)for o,p in l.elements do p:_setShown(m,n)end end
function f._refreshTheme(l)for m,n in l.elements do if n._refreshTheme then n:_refreshTheme()end end end g(f)return f
end)()end,[11]=function()local b,c,d=a(11)local e return(function(...)local f={}f.__index=f f.__type='Input'local g=c.
Parent.Parent.utility local h,i,j,k,l,m=d(g.variables),d(g.functions),d(g.moveable),d(g.locale),d(g.constants),d(g.
HapticEngine)local n,o=l.pillResizeInfo,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local function p(q)local r,s=q:match'^([%d%.%-]+)%^([%d%.%-]+)$'if r and s then local t,u=tonumber(r),tonumber(s)if t
and u then return t^u end end return tonumber(q)end function f.new(q,r)r=if typeof(r)=='table'then r else{}local s=
setmetatable({tab=assert(q,'Missing argument #1 (Tab expected)'),window=q.window,name=r.name or r.Name or'Input',icon=r.
icon or r.Icon,description=r.description or r.Description,forgetState=r.forgetState or r.ForgetState or q.forgetState,
placeholder=r.placeholder or r.Placeholder or'',numeric=r.numeric or r.Numeric or false,clearOnFocus=r.clearOnFocus or r
.ClearOnFocus or false,callback=r.callback or r.Callback or function()end},f)s.value=tostring(r.value or r.Value or r.
currentValue or r.CurrentValue or'')s.flag=r.flag or r.Flag or(not s.forgetState and i.deriveFlagFromName(s.name)or nil)
s.window:_registerControl(s)s.main=s.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=s.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=s.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})s.stroke=s.window:StyleElementBody(s.main)s.hoverOverlay=s.window:CreateHoverOverlay(s.main)s.
container=s.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=s.main})s.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=s.container}
)if s.icon then s.iconLabel=s.window:Create('ImageLabel',{Image=s.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=s.container},{ImageColor3='ContentColor'})end s.title=s.
window:Create('TextLabel',{Text=k.t(s.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=s.container},{TextColor3='ContentColor',FontFace='Font'})s.box=s.window:Create('Frame',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(85,30),BorderSizePixel=0,
BackgroundTransparency=1,Parent=s.main},{BackgroundColor3='FieldBackground'})s.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=s.box})s.boxStroke=s.window:Create('UIStroke',{Transparency=1,Parent=s.box},{Color='SurfaceStroke'}
)s.glow=s.window:CreateGlow(s.box,'FieldGlow',20,1)s._glowIdle=1 s.input=s.window:Create('TextBox',{Text=s.value,
PlaceholderText=k.t(s.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(
0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=
Enum.TextTruncate.AtEnd,ClearTextOnFocus=s.clearOnFocus,TextTransparency=1,Parent=s.box},{TextColor3='ContentColor',
FontFace='Font',PlaceholderColor3='PlaceholderColor'})s.window:ConnectFor(s,s.input:GetPropertyChangedSignal'Text',
function()if s.numeric then local t=(s.input.Text:gsub('[^%d%.%-eE%^]',''))if t~=s.input.Text then s.input.Text=t return
end end s:_sizeBox(true)end)s.window:ConnectFor(s,s.input.Focused,function()h.tweenService:Create(s.input,o,{
TextTransparency=0}):Play()end)s.window:ConnectFor(s,s.input.FocusLost,function()h.tweenService:Create(s.input,o,{
TextTransparency=0.6}):Play()if s.clearOnFocus and s.input.Text==''and s.value~=''then s.input.Text=s.value return end
if s.input.Text==s.value then return end s:_commit(s.input.Text)end)s.window:_wireElementHover(s)if s.description then s
.descriptor=d(c.Parent.descriptor).new(s.tab,{description=s.description})end s:_sizeBox(false)return s end function f.
_sizeBox(q,r)local s=q.input.Text~=''and q.input.Text or q.placeholder local t=math.clamp(i.textWidth(q.window.theme.
Font,15,s)+30,70,220)if r then h.tweenService:Create(q.box,n,{Size=UDim2.fromOffset(t,30)}):Play()else q.box.Size=UDim2.
fromOffset(t,30)end end function f._commit(q,r,s)r=tostring(r)if q.numeric then local t=p(r)if not t or t==math.huge or
t==-math.huge then if q.input.Text~=q.value then q.input.Text=q.value end return end r=tostring(t)end local t=r~=q.value
q.value=r if q.input.Text~=r then q.input.Text=r end if not s then q.window:_runGuarded(q,q.callback,r)q.window:
_persist(q)if t and not q.window._loading then m.click()q.window:_flashResult(q,true)end end end function f.Set(q,r,s)q:
_commit(r,s)end function f._setShown(q,r,s)local t=q.window if r then t:_revealCommon(q,s)t:_reveal(q.box,{
BackgroundTransparency=t.theme.FieldTransparency},s)t:_reveal(q.boxStroke,{Transparency=0.85},s)t:_reveal(q.input,{
TextTransparency=0.6},s)else t:_hideCommon(q,s)t:_reveal(q.box,{BackgroundTransparency=1},s)t:_reveal(q.boxStroke,{
Transparency=1},s)t:_reveal(q.input,{TextTransparency=1},s)end end function f._refreshTheme(q)h.tweenService:Create(q.
box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=q.window.theme.
FieldTransparency}):Play()end j(f)return f end)()end,[12]=function()local b,c,d=a(12)local e return(function(...)local f
={}f.__index=f f.__type='Keybind'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o=d(g.variables),d(g.functions),d(g
.moveable),d(g.locale),d(g.constants),d(g.HapticEngine),d(g.enums),d(g.log)local p,q,r=l.pillResizeInfo,TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{[Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.
MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'}local function s(t)if typeof(t)~='EnumItem'or t==Enum.
KeyCode.Unknown then return'None'end return r[t]or t.Name end local function t(u)if typeof(u)=='EnumItem'then return u
end if type(u)=='string'then local v,w=pcall(function()return Enum.KeyCode[u]end)if v and w then return w end local x,y=
pcall(function()return Enum.UserInputType[u]end)if x and y and r[y]then return y end end return Enum.KeyCode.Unknown end
function f.new(u,v)v=if typeof(v)=='table'then v else{}local w=setmetatable({tab=assert(u,
'Missing argument #1 (Tab expected)'),window=u.window,name=v.name or v.Name or'Keybind',icon=v.icon or v.Icon,
description=v.description or v.Description,forgetState=v.forgetState or v.ForgetState or u.forgetState,isMenuToggle=v.
isMenuToggle or v.IsMenuToggle or false,callback=v.callback or v.Callback or function()end,onChanged=v.onChanged or v.
OnChanged or function()end,hold=v.hold or v.Hold or false,holdThreshold=v.holdThreshold or v.HoldThreshold or 0.2,
recording=false},f)w.value=t(v.value or v.Value or v.default or v.Default)w.flag=v.flag or v.Flag or(not w.forgetState
and i.deriveFlagFromName(w.name)or nil)w.window:_registerControl(w)w.main=w.window:Create('Frame',{Size=UDim2.new(1,-20,
0,41),BorderSizePixel=0,Name=w.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=w.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})w.stroke=w.window:StyleElementBody(w.main)w.hoverOverlay=w.
window:CreateHoverOverlay(w.main)w.container=w.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20
,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=w.main})w.window:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,Parent=w.container})if w.icon then w.iconLabel=w.window:Create('ImageLabel',{Image=w.icon,Size=
UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=w.container},{
ImageColor3='ContentColor'})end w.title=w.window:Create('TextLabel',{Text=k.t(w.name),Size=UDim2.fromOffset(150,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=w.container},{TextColor3='ContentColor',FontFace=
'Font'})w.box=w.window:Create('TextButton',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.
fromOffset(40,30),AutoButtonColor=false,Text='',BorderSizePixel=0,BackgroundTransparency=1,Parent=w.main},{
BackgroundColor3='FieldBackground'})w.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=w.box})w.boxStroke=w.
window:Create('UIStroke',{Transparency=1,Parent=w.box},{Color='SurfaceStroke'})w.glow=w.window:CreateGlow(w.box,
'FieldGlow',20,1)w._glowIdle=0.9 w.keyLabel=w.window:Create('TextLabel',{Text=s(w.value),Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,
TextTransparency=1,Parent=w.box},{TextColor3='ContentColor',FontFace='Font'})w.window:ConnectFor(w,w.box.
MouseButton1Click,function()m.click()if w.recording then w:_stopRecording()else w:_startRecording()end end)w.window:
ConnectFor(w,h.userInputService.InputBegan,function(x,y)if y then return end if w.recording then w:_capture(x)return end
if w.window._recordingKeybind then return end if w:_matches(x)then if w.hold then w:_beginHold(x)else w.window:
_runGuarded(w,w.callback,w.value)end end end)w.window:_wireElementHover(w)if w.description then w.descriptor=d(c.Parent.
descriptor).new(w.tab,{description=w.description})end w:_sizeBox(false)return w end function f._sizeBox(u,v)local w=math
.clamp(i.textWidth(u.window.theme.Font,15,u.keyLabel.Text)+28,40,200)if v then h.tweenService:Create(u.box,p,{Size=UDim2
.fromOffset(w,30)}):Play()else u.box.Size=UDim2.fromOffset(w,30)end end function f._startRecording(u)local v=u.window.
_recordingKeybind if v and v~=u then v:_stopRecording()end u.recording=true u.window._recordingKeybind=u u.keyLabel.Text
=k.resolve'Recording'u:_sizeBox(true)h.tweenService:Create(u.glow,q,{Transparency=0.7}):Play()h.tweenService:Create(u.
keyLabel,q,{TextTransparency=0}):Play()end function f._stopRecording(u)u.recording=false if u.window._recordingKeybind==
u then local v=u.window task.defer(function()if v._recordingKeybind==u then v._recordingKeybind=nil end end)end u.
keyLabel.Text=s(u.value)u:_sizeBox(true)h.tweenService:Create(u.glow,q,{Transparency=0.9}):Play()h.tweenService:Create(u
.keyLabel,q,{TextTransparency=0.6}):Play()end function f._capture(u,v)local w if v.UserInputType==Enum.UserInputType.
Keyboard then if v.KeyCode==Enum.KeyCode.Escape then u:_stopRecording()return end if v.KeyCode==Enum.KeyCode.Backspace
then u:_bind(Enum.KeyCode.Unknown)return end w=v.KeyCode elseif v.UserInputType==Enum.UserInputType.MouseButton2 or v.
UserInputType==Enum.UserInputType.MouseButton3 then w=v.UserInputType end if not w then return end if u.isMenuToggle
then local x=u.window:_keybindUsing(w,u)if x then u.window:Notify{title=k.resolve'Keybind unavailable',content=string.
format(k.resolve'%s is bound to %s. Kept %s.',s(w),x.name,s(u.value))}u:_stopRecording()u.window:_flashResult(u,false)
return end elseif w==u.window.settings.toggleKeybind then u.window:Notify{title=k.resolve'Keybind unavailable',content=
string.format(k.resolve'%s is the menu toggle key. Kept %s.',s(w),s(u.value))}u:_stopRecording()u.window:_flashResult(u,
false)return end u:_bind(w)end function f._bind(u,v)u.value=v u:_stopRecording()u.window:_runGuarded(u,u.onChanged,v)u.
window:_persist(u)u.window:_flashResult(u,true)end function f._matches(u,v)local w=u.value if typeof(w)~='EnumItem'or w
==Enum.KeyCode.Unknown then return false end if w.EnumType==Enum.KeyCode then return v.KeyCode==w elseif w.EnumType==
Enum.UserInputType then return v.UserInputType==w end return false end function f._beginHold(u,v)if u._holding or u.
_holdPress then return end local w={}u._holdPress=w local x,y=v.KeyCode,v.UserInputType task.delay(u.holdThreshold,
function()if u._holdPress~=w then return end u._holding=true u.window:_runGuarded(u,u.callback,true)end)local z z=u.
window:ConnectFor(u,h.userInputService.InputEnded,function(A)local B=if x~=Enum.KeyCode.Unknown then A.KeyCode==x else A
.UserInputType==y if not B then return end if u.connections then local C=table.find(u.connections,z)if C then table.
remove(u.connections,C)end end u.window:Disconnect(z)if u._holdPress==w then u._holdPress=nil end if u._holding then u.
_holding=false u.window:_runGuarded(u,u.callback,false)end end)end function f.Set(u,v,w)local x=t(v)if x~=Enum.KeyCode.
Unknown then if u.isMenuToggle then local y=u.window:_keybindUsing(x,u)if y then o.warn('Rayfield: '..s(x)..
" is bound to '"..tostring(y.name).."'; kept "..s(u.value))return end elseif x==u.window.settings.toggleKeybind then o.
warn('Rayfield: '..s(x)..' is the menu toggle key; kept '..s(u.value))return end end u.value=x if u.recording then u:
_stopRecording()else u.keyLabel.Text=s(u.value)u:_sizeBox(true)end if not w then u.window:_runGuarded(u,u.onChanged,u.
value)u.window:_persist(u)end end function f._serialize(u)return{tostring(u.value.EnumType),u.value.Value}end function f
._deserialize(u,v)local w=tostring(v[1]):gsub('^Enum%.','')local x,y=pcall(function()return Enum[w]end)if not x or not y
then return end local z=n.itemFromValue(y,v[2])if z then u:Set(z)end end function f._setShown(u,v,w)local x=u.window if
v then x:_revealCommon(u,w)x:_reveal(u.box,{BackgroundTransparency=x.theme.FieldTransparency},w)x:_reveal(u.boxStroke,{
Transparency=0.85},w)x:_reveal(u.keyLabel,{TextTransparency=0.6},w)x:_reveal(u.glow,{Transparency=0.9},w)else x:
_hideCommon(u,w)x:_reveal(u.box,{BackgroundTransparency=1},w)x:_reveal(u.boxStroke,{Transparency=1},w)x:_reveal(u.
keyLabel,{TextTransparency=1},w)x:_reveal(u.glow,{Transparency=1},w)end end function f._refreshTheme(u)h.tweenService:
Create(u.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=u.window.theme.
FieldTransparency}):Play()end j(f)return f end)()end,[13]=function()local b,c,d=a(13)local e return(function(...)local f
={}f.__index=f f.__type='Notification'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r,s,t=d(g.variables),d(g
.functions),d(g.constants),d(g.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8
local function u(v)return math.clamp(#v*0.06+3,3,9)end function f.new(v,w)w=if typeof(w)=='table'then w else{}local x=
setmetatable({window=assert(v,'Missing argument #1 (Window expected)'),title=w.title or w.Title or'Notification',content
=w.content or w.Content or'',icon=w.icon or w.Icon,_hovered=false,_dismissed=false},f)x.duration=w.duration or w.
Duration or u(x.content)local y=x.icon~=nil and x.icon~=0 and x.icon~=''x.main=x.window:Create('Frame',{Name=
'Notification',BackgroundTransparency=1,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=j.zIndex.notification,Parent=x.
window.notifications})x.window:Create('UIPadding',{PaddingTop=UDim.new(0,t),Parent=x.main})x.body=x.window:Create(
'Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,1,0),Position=q,AnchorPoint=Vector2.new(0.5,0.5
),Active=true,BorderSizePixel=0,ZIndex=j.zIndex.notification,BackgroundTransparency=1,Parent=x.main})x.window:Create(
'UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=x.body},{Color={'WindowColor',i.toColorSequence}})x.window:
Create('UICorner',{Parent=x.body},{CornerRadius='CornerRoundness'})x.stroke=x.window:Create('UIStroke',{Transparency=1,
Parent=x.body},{Color='SurfaceStroke'})x.shadow=x.window:CreateGlow(x.body,'ShadowColor',20,1)x.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=x.body})x.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=x.body})if y then x.
iconLabel=x.window:Create('ImageLabel',{Image=x.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ZIndex=j.zIndex.notification,ImageTransparency=1,Parent=x.body},{ImageColor3=
'ContentColor'})end x.container=x.window:Create('Frame',{Size=UDim2.fromOffset(y and 222 or 260,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=j.zIndex.notification,Parent=x.body})x.
window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,4),Parent=x.container})x.titleLabel=x.window:Create('TextLabel',{Text=x.title,Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=j.zIndex.notification,TextTransparency=1,Parent=x.container},{TextColor3=
'ContentColor',FontFace='TitleFont'})if x.content~=''then x.descriptionLabel=x.window:Create('TextLabel',{Text=x.content
,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=j.zIndex.
notification,TextTransparency=1,Parent=x.container},{TextColor3='ContentColor',FontFace='Font'})end x.window.
_notificationCount=(x.window._notificationCount or 0)+1 x.main.LayoutOrder=x.window._notificationCount local z=x.window.
_liveNotifications if not z then z={}x.window._liveNotifications=z end table.insert(z,x)while#z>s do local A=table.
remove(z,1)if A and A~=x then task.spawn(A._dismiss,A)end end x._connections={x.window:Connect(x.body.MouseEnter,
function()x._hovered=true end),x.window:Connect(x.body.MouseLeave,function()x._hovered=false end),x.window:Connect(x.
body.InputBegan,function(A)if A.UserInputType==Enum.UserInputType.MouseButton1 or A.UserInputType==Enum.UserInputType.
Touch then x:_dismiss()end end)}task.spawn(function()x:_show()end)return x end function f._measure(v)local w=v.iconLabel
and 222 or 260 local x=i.textHeight(v.window.theme.TitleFont,16,v.title,w)if v.descriptionLabel then x=x+4+i.textHeight(
v.window.theme.Font,15,v.content,w)end return math.max(x,v.iconLabel and 24 or 0)+28 end function f._show(v)local w=v:
_measure()+t if not v.main.Parent then return end k.notify()h.tweenService:Create(v.main,l,{Size=UDim2.new(1,0,0,w)}):
Play()h.tweenService:Create(v.body,o,{Position=r}):Play()h.tweenService:Create(v.body,m,{BackgroundTransparency=0}):
Play()h.tweenService:Create(v.titleLabel,n,{TextTransparency=0}):Play()h.tweenService:Create(v.stroke,m,{Transparency=
0.95}):Play()h.tweenService:Create(v.shadow,n,{Transparency=0.6}):Play()task.wait(0.05)if v._dismissed or not v.main.
Parent then return end if v.iconLabel then h.tweenService:Create(v.iconLabel,n,{ImageTransparency=0}):Play()end task.
wait(0.05)if v._dismissed or not v.main.Parent then return end if v.descriptionLabel then h.tweenService:Create(v.
descriptionLabel,n,{TextTransparency=0.35}):Play()end local x=0 while x<v.duration and not v._dismissed and v.main.
Parent do local y=task.wait()if not v._hovered then x+=y end end v:_dismiss()end function f._dismiss(v)if v._dismissed
then return end v._dismissed=true local w=v.window._liveNotifications local x=w and table.find(w,v)if w and x then table
.remove(w,x)end if not v.main.Parent then return end h.tweenService:Create(v.body,m,{BackgroundTransparency=1}):Play()h.
tweenService:Create(v.stroke,m,{Transparency=1}):Play()h.tweenService:Create(v.shadow,n,{Transparency=1}):Play()h.
tweenService:Create(v.titleLabel,n,{TextTransparency=1}):Play()if v.descriptionLabel then h.tweenService:Create(v.
descriptionLabel,n,{TextTransparency=1}):Play()end if v.iconLabel then h.tweenService:Create(v.iconLabel,n,{
ImageTransparency=1}):Play()end h.tweenService:Create(v.body,p,{Size=UDim2.new(1,-90,1,0)}):Play()local y=h.tweenService
:Create(v.main,p,{Size=UDim2.new(1,0,0,0)})y:Play()y.Completed:Wait()if not v.main.Parent then return end for z,A in v.
_connections do v.window:Disconnect(A)end v.window:DestroySubtree(v.main)end return f end)()end,[14]=function()local b,c
,d=a(14)local e return(function(...)local f={}f.__index=f f.__type='Popup'local g=c.Parent.Parent.utility local h,i,j,k,
l,m,n,o,p,q,r,s,t,u,v=d(g.variables),d(g.functions),d(g.constants),d(g.locale),d(g.log),d(g.HapticEngine),TweenInfo.new(
0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16 local w,x,y,z,A,B,C,D=r-s*2,18,14,15,16,12,300,4 local
E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S=w-D*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function T(U)for V=#S,1,-1
do local W=S[V]if W._closed or not W.screenGui.Parent then table.remove(S,V)end end return S[#S]==U end function f.new(U
,V)V=if typeof(V)=='table'then V else{}local W=setmetatable({window=assert(U,'Missing argument #1 (Window expected)'),
title=V.title or V.Title or'Popup',subtitle=V.subtitle or V.Subtitle,content=V.content or V.Content,icon=V.icon or V.
Icon,boxes=V.boxes or V.Boxes,options=V.options or V.Options,dismissable=if V.dismissable~=nil then V.dismissable elseif
V.Dismissable~=nil then V.Dismissable else true,_reveal={},_connections={},_closed=false},f)if not W.options or#W.
options==0 then W.options={{text='Okay'}}end W:_build()table.insert(S,W)task.spawn(function()W:_show()end)return W end
function f._fade(U,V,W,X)table.insert(U._reveal,{instance=V,prop=W,to=X})return V end function f._build(U)local V,W=U.
window,U.icon~=nil and U.icon~=0 and U.icon~=''U.screenGui=V:Create('ScreenGui',{Name=h.httpService:GenerateGUID(false),
IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=j.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior
.Global,Parent=h.guiContainer})U.backdrop=V:Create('Frame',{Name='Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),
BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,BackgroundTransparency=1,Parent=U.screenGui})U:_fade(U.backdrop,
'BackgroundTransparency',R)U.card=V:Create('Frame',{Name='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint
=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),Size=UDim2.fromOffset(r,0),AutomaticSize=Enum.AutomaticSize.Y,
Active=true,BorderSizePixel=0,BackgroundTransparency=1,Parent=U.screenGui})U:_fade(U.card,'BackgroundTransparency',0)V:
Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=U.card},{Color={'WindowColor',i.toColorSequence}})V:
Create('UICorner',{Parent=U.card},{CornerRadius='CornerRoundness'})U.cardStroke=V:Create('UIStroke',{Transparency=1,
Parent=U.card},{Color='SurfaceStroke'})U:_fade(U.cardStroke,'Transparency',0.95)U.cardShadow=V:CreateGlow(U.card,
'ShadowColor',26,1)U:_fade(U.cardShadow,'Transparency',0.55)V:Create('UIPadding',{PaddingLeft=UDim.new(0,s),PaddingRight
=UDim.new(0,s),PaddingTop=UDim.new(0,t),PaddingBottom=UDim.new(0,u),Parent=U.card})V:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,v),Parent=U.card})local X=U:_measureHeader(W)U:_buildHeader(W,X)local Y=U:_buildContent()
U:_buildFooter()local Z=2+(Y>0 and 1 or 0)local _=t+X+Y+N+u+v*(Z-1)U.card.Size=UDim2.fromOffset(r,_)U.card.AutomaticSize
=Enum.AutomaticSize.None if U.dismissable then table.insert(U._connections,V:Connect(U.backdrop.InputBegan,function(aa)
if aa.UserInputType==Enum.UserInputType.MouseButton1 or aa.UserInputType==Enum.UserInputType.Touch then U:Close()end end
))table.insert(U._connections,V:Connect(h.userInputService.InputBegan,function(aa,ab)if not ab and aa.KeyCode==Enum.
KeyCode.Escape and T(U)then U:Close()end end))end end function f._buildHeader(aa,ab,U)local V=aa.window local W=V:
Create('Frame',{Name='Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,U),LayoutOrder=1,Parent=aa.card})V:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,B),Parent=W})
if ab then aa:_fade(V:Create('ImageLabel',{Image=aa.icon,Size=UDim2.fromOffset(A,A),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=W},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end
local X=V:Create('Frame',{Name='Text',BackgroundTransparency=1,Size=UDim2.new(1,ab and-(A+B)or 0,0,aa._columnH),
LayoutOrder=2,Parent=W})V:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,3),Parent=X})aa:_fade(V:Create('TextLabel',{Text=k.t(aa.title),Size=UDim2.new(1,0,0,aa.
_titleH),BackgroundTransparency=1,TextSize=x,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=X},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if aa.subtitle and aa.
subtitle~=''then aa:_fade(V:Create('TextLabel',{Text=k.t(aa.subtitle),Size=UDim2.new(1,0,0,aa._subH),
BackgroundTransparency=1,TextSize=y,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,
TextTransparency=1,Parent=X},{TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0.55)end end function f.
_buildContent(aa)if(not aa.content or aa.content=='')and(not aa.boxes or#aa.boxes==0)then return 0 end local ab,U=aa.
window,if aa.boxes and#aa.boxes>0 then aa:_measureBoxes()else aa:_measureText()local V=math.min(U,C)+D*2 local W=ab:
Create('ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,V),CanvasSize=
UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,ScrollBarImageColor3=Color3.fromRGB(255
,255,255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,ScrollBarImageTransparency=1,Parent=aa.card})aa:
_fade(W,'ScrollBarImageTransparency',0.8)ab:Create('UIPadding',{PaddingLeft=UDim.new(0,D),PaddingRight=UDim.new(0,D),
PaddingTop=UDim.new(0,D),PaddingBottom=UDim.new(0,D),Parent=W})if aa.boxes and#aa.boxes>0 then ab:Create('UIListLayout',
{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,L),Parent=W})for X,Y in aa.boxes do aa:_buildBox(W,Y,X)end else aa:_fade(ab:Create(
'TextLabel',{Text=k.t(aa.content),Size=UDim2.new(1,0,0,U),BackgroundTransparency=1,TextSize=z,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,TextTransparency=1,Parent=W},{TextColor3=
'ContentColor',FontFace='Font'}),'TextTransparency',0.5)end return V end function f._buildBox(aa,ab,U,V)local W=aa.
window U=if typeof(U)=='table'then U else{title=tostring(U)}local X,Y,Z,_,ac=U.icon~=nil and U.icon~=0 and U.icon~='',aa
:_measureBox(U)local ad=W:Create('Frame',{Name='Box',BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Size
=UDim2.new(1,-M,0,Y),LayoutOrder=V,BackgroundTransparency=1,Parent=ab})aa:_fade(ad,'BackgroundTransparency',0)local ae=W
:StyleElementPanel(ad)aa:_fade(ae,'Transparency',W.theme.ElementStrokeTransparency)W:Create('UIPadding',{PaddingLeft=
UDim.new(0,F),PaddingRight=UDim.new(0,F),PaddingTop=UDim.new(0,G),PaddingBottom=UDim.new(0,G),Parent=ad})W:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,I),Parent=ad})
if X then aa:_fade(W:Create('ImageLabel',{Image=U.icon,Size=UDim2.fromOffset(H,H),BackgroundTransparency=1,
BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=ad},{ImageColor3='ContentColor'}),'ImageTransparency',0)end
local af=W:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,X and-(H+I)or 0,0,ac),LayoutOrder=2,Parent=ad})W:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0
,3),Parent=af})aa:_fade(W:Create('TextLabel',{Text=k.t(U.title or U.Title or''),Size=UDim2.new(1,0,0,Z),
BackgroundTransparency=1,TextSize=J,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=af},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local ag=U.
description or U.Description if ag and ag~=''then aa:_fade(W:Create('TextLabel',{Text=k.t(ag),Size=UDim2.new(1,0,0,_),
BackgroundTransparency=1,TextSize=K,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=af},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function f._buildFooter(aa)local ab=aa.window local ac=ab:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,N),LayoutOrder=3,Parent=aa.card})ab:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,O),Parent=ac})for ad,ae in aa.options do aa:_buildButton(ac,ae,ad)end end function f._buildButton(aa,ab,ac,ad)
local ae=aa.window ac=if typeof(ac)=='table'then ac else{text=tostring(ac)}local af,ag,U,V,W,X,Y=ac.style or ac.Style or
'neutral',ac.text or ac.Text or ac.name or ac.Name or'Okay',ac.callback or ac.Callback if af=='primary'then V,W,X,Y=ae.
theme.AccentColor,ae.theme.AccentStroke,ae.theme.AccentStroke,0.1 elseif af=='danger'then V,W,X,Y=ae.theme.ErrorColor,ae
.theme.ErrorStrokeColor,ae.theme.ErrorStrokeColor,0 else V,W,X,Y=ae.theme.NeutralButton,ae.theme.NeutralButtonHover,ae.
theme.NeutralButtonStroke,0.85 end local Z=ae:Create('Frame',{Name='Button',BackgroundColor3=V,BorderSizePixel=0,Size=
UDim2.new(0,0,0,N),LayoutOrder=ad,BackgroundTransparency=1,Parent=ab})aa:_fade(Z,'BackgroundTransparency',0)ae:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=Z})ae:Create('UICorner',{CornerRadius=P,Parent=Z})local _=ae:Create(
'UIStroke',{Color=X,Transparency=1,Parent=Z})aa:_fade(_,'Transparency',Y)aa:_fade(ae:Create('TextLabel',{Text=k.t(ag),
Size=UDim2.fromScale(1,1),BackgroundTransparency=1,TextSize=Q,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=
Enum.TextTruncate.AtEnd,TextColor3=i.contrastText(V),TextTransparency=1,Parent=Z},{FontFace='Font'}),'TextTransparency',
0)local ah,ai=ae:Create('TextButton',{Text='',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,
ZIndex=2,Parent=Z}),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(aa._connections,ae:
Connect(ah.MouseEnter,function()if aa._closed then return end h.tweenService:Create(Z,ai,{BackgroundColor3=W}):Play()end
))table.insert(aa._connections,ae:Connect(ah.MouseLeave,function()h.tweenService:Create(Z,ai,{BackgroundColor3=V}):Play(
)end))table.insert(aa._connections,ae:Connect(ah.MouseButton1Click,function()if aa._closed then return end m.click()h.
tweenService:Create(_,ai,{Transparency=1}):Play()if U then task.spawn(function()local aj,ak=pcall(U)if not aj then l.
warn("Rayfield: popup button '"..ag.."' callback errored:")l.print(ak)end end)end aa:Close()end))end function f.
_measureHeader(aa,ab)local ac=w-(if ab then A+B else 0)aa._titleH=i.textHeight(aa.window.theme.Font,x,k.resolve(aa.title
),ac)aa._subH=if aa.subtitle and aa.subtitle~=''then i.textHeight(aa.window.theme.Font,y,k.resolve(aa.subtitle),ac)else
0 aa._columnH=aa._titleH+(if aa._subH>0 then 3+aa._subH else 0)return math.max(aa._columnH,if ab then A else 0)end
function f._measureText(aa)return i.textHeight(aa.window.theme.Font,z,k.resolve(aa.content),E)end function f._measureBox
(aa,ab)ab=if typeof(ab)=='table'then ab else{title=tostring(ab)}local ac=ab.icon~=nil and ab.icon~=0 and ab.icon~=''
local ad=E-M-F*2-(if ac then H+I else 0)local ae,af,ag=i.textHeight(aa.window.theme.TitleFont,J,k.resolve(ab.title or ab
.Title or''),ad),0,ab.description or ab.Description if ag and ag~=''then af=i.textHeight(aa.window.theme.Font,K,k.
resolve(ag),ad)end local ah=ae+(if af>0 then 3+af else 0)local ai=math.max(ah,if ac then H else 0)+G*2 return ai,ae,af,
ah end function f._measureBoxes(aa)local ab=0 for ac,ad in aa.boxes do ab+=(aa:_measureBox(ad))if ac<#aa.boxes then ab+=
L end end return ab end function f._show(aa)if not aa.screenGui.Parent then return end m.notify()h.tweenService:Create(
aa.card,n,{Position=UDim2.new(0.5,0,0.5,0)}):Play()for ab,ac in aa._reveal do local ad=if ac.instance==aa.backdrop then
q else o h.tweenService:Create(ac.instance,ad,{[ac.prop]=ac.to}):Play()end end function f.Close(aa)if aa._closed then
return end aa._closed=true local ab=table.find(S,aa)if ab then table.remove(S,ab)end for ac,ad in aa._connections do aa.
window:Disconnect(ad)end aa._connections={}if not aa.screenGui.Parent then return end h.tweenService:Create(aa.card,p,{
Position=UDim2.new(0.5,0,0.5,10)}):Play()for ac,ad in aa._reveal do h.tweenService:Create(ad.instance,p,{[ad.prop]=1}):
Play()end task.delay(p.Time,function()aa.window:DestroySubtree(aa.screenGui)end)end return f end)()end,[15]=function()
local aa,ab,ac=a(15)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,b,c=ac(ae.
variables),ac(ae.constants),ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),0.6,0.2 local function d(e)if e.__type=='Group'then local f={}local function g(h)for i,j in h.
elements do if j.__type=='Group'then g(j)elseif j.name then table.insert(f,j.name)end end end g(e)return table.concat(f,
'\n')end return e.name or''end local function e(f)local g={}for h,i in f.tabs do if i.neglectSelector then continue end
for j,k in i.elements do if k.__type~='Section'then table.insert(g,k)end end end return g end local function f(g,h,i)af.
tweenService:Create(g.searchPill,i,{BackgroundTransparency=if h then 0.9 else 1}):Play()af.tweenService:Create(g.
searchStroke,i,{Transparency=if h then 0.85 else 1}):Play()af.tweenService:Create(g.searchShadow,i,{Transparency=if h
then 0.92 else 1}):Play()af.tweenService:Create(g.searchIcon,i,{ImageTransparency=if h then 0.65 else 1}):Play()af.
tweenService:Create(g.searchInput,i,{TextTransparency=if h then 0.2 else 1}):Play()end local function g(h,i,j)for k,l in
h.tabs do if not l.neglectSelector and l.topbarItem then l:_applyVisual(if i then(if h.selectedTab==l then'selected'else
'unselected')else'hidden',j)end end end local function h(i,j)j=string.lower(j or'')local k=false for l,m in i.
_searchUnits do local n=j==''or string.find(m.text,j,1,true)~=nil m.unit.main.Visible=n if m.unit.descriptor then m.unit
.descriptor.main.Visible=n end k=k or n end i.searchEmpty.Visible=not k and j~=''end local function i(j)j._searchUnits={
}local k=0 for l,m in e(j)do k+=1 local n=m.main table.insert(j._searchUnits,{unit=m,text=string.lower(d(m)),homeParent=
n.Parent,homeOrder=n.LayoutOrder,descOrder=m.descriptor and m.descriptor.main.LayoutOrder})n.LayoutOrder=k*10 n.Parent=j
.searchPage n.Visible=true if m.descriptor then m.descriptor.main.LayoutOrder=k*10+1 m.descriptor.main.Parent=j.
searchPage m.descriptor.main.Visible=true end end end local function j(k)for l,m in k._searchUnits do local n=m.unit if
n.main and n.main.Parent then n.main.LayoutOrder=m.homeOrder n.main.Parent=m.homeParent n.main.Visible=true end if n.
descriptor and n.descriptor.main and n.descriptor.main.Parent then n.descriptor.main.LayoutOrder=m.descOrder n.
descriptor.main.Parent=m.homeParent n.descriptor.main.Visible=true end end k._searchUnits={}end function aj.open(k)if k.
_searching or k.minimised or not k:_interactive()then return end k._searching=true i(k)h(k,'')k:_jumpTo(k.searchPage)g(k
,false,ak)task.delay(ak.Time,function()if k._searching then k.tabList.Visible=false end end)k.searchPill.Visible=true f(
k,true,ak)k.searchInput:CaptureFocus()af.tweenService:Create(k.searchAction.iconLabel,ak,{ImageTransparency=c}):Play()
end function aj.close(k,l)if not k._searching then return end l=l or{}k._searching=false k.searchInput.Text=''k.
searchInput:ReleaseFocus()k.searchEmpty.Visible=false j(k)local m=if l.jumpTo==nil then k.selectedTab and k.selectedTab.
tabPage else l.jumpTo if m then k:_jumpTo(m)end f(k,false,ak)task.delay(ak.Time,function()if not k._searching then k.
searchPill.Visible=false end end)if l.showTabs then k.tabList.Visible=true g(k,true,ak)end af.tweenService:Create(k.
searchAction.iconLabel,ak,{ImageTransparency=b}):Play()end function aj.toggle(k)if k._searching then aj.close(k,{
showTabs=true})else aj.open(k)end end function aj.build(k)k._searching=false k.searchPage=k:Create('ScrollingFrame',{
Name='Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=
0,BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=k.elements})k:Create('UIListLayout',{Padding=UDim.
new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=k.searchPage})k:Create('UIPadding',{PaddingTop=
UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=k.searchPage})k.searchEmpty=k:Create('TextLabel',{Name='NoResults',
Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,TextTransparency=0.6,
BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=UDim2.fromOffset(200,20)
,Visible=false,ZIndex=3,Parent=k.main},{TextColor3='ContentColor',FontFace='Font'})k.searchPill=k:Create('Frame',{Name=
'SearchBar',AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,66),Size=UDim2.new(1,-35,0,35),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=k.main})k:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=k.searchPill})k.searchStroke=k:Create('UIStroke',{Color=Color3.fromRGB(255
,255,255),Thickness=1,Transparency=1,Parent=k.searchPill})k.searchShadow=k:Create('UIShadow',{BlurRadius=UDim.new(0,20),
Color=Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=k.searchPill})k.searchIcon=k:Create('ImageLabel',{
Image='rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=
UDim2.fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=k.searchPill},{ImageColor3=
'ContentColor'})k.searchInput=k:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent
=k.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})k:Connect(k.searchInput:
GetPropertyChangedSignal'Text',function()if k._searching then h(k,k.searchInput.Text)end end)k.searchAction=ai.new(k,{
name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(k)end})k.searchAction.isLit=function()return k.
_searching end end return aj end)()end,[16]=function()local aa,ab,ac=a(16)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale)
function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local aj=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or'Section',icon=ai.icon or ai.Icon},ae)
local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{Size=UDim2.new(1,-40,0,20+ak),
BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0 then aj.window:Create('UIPadding'
,{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3='ContentColor'})end aj.title
=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',FontFace='Font'})return aj end function ae._setShown(ah,ai
,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(
ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end end af(ae)return ae end)()end,[17]=function()local aa,ab,
ac=a(17)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local
ag,ah,ai,aj,ak,b=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.locale),ac(af.HapticEngine)
local function c(d)local e=0 while d%1~=0 and e<6 do d=d*10 e+=1 end return e end local function d(e,f,g)local h=e[1]+
math.round((g-e[1])/f)*f return math.clamp(h,e[1],e[2])end local e,f,g,h=TweenInfo.new(0.45,Enum.EasingStyle.Exponential
,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),300 function ae.new(i,j)j=if typeof(j)=='table'then j else{}local k=
setmetatable({tab=assert(i,'Missing argument #1 (Tab expected)'),window=i.window,name=j.name or j.Name or'Slider',icon=j
.icon or j.Icon,description=j.description or j.Description,forgetState=j.forgetState or j.ForgetState or i.forgetState,
range=j.range or j.Range or{0,100},increment=j.increment or j.Increment or 1,suffix=j.suffix or j.Suffix or'',callback=j
.callback or j.Callback or function()end,dragging=false,minimal=j.minimal or j.Minimal or false},ae)if k.range[1]>k.
range[2]then k.range={k.range[2],k.range[1]}end if k.increment<=0 then k.increment=1 end k.value=if(j.value or j.Value)
~=nil then(j.value or j.Value)elseif(j.currentValue or j.CurrentValue)~=nil then(j.currentValue or j.CurrentValue)else k
.range[1]k.value=d(k.range,k.increment,k.value)k._decimals=c(k.increment)k.flag=j.flag or j.Flag or(not k.forgetState
and ah.deriveFlagFromName(k.name)or nil)k.window:_registerControl(k)k.main=k.window:Create('Frame',{Size=UDim2.new(1,-20
,0,65),BorderSizePixel=0,Name=k.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=k.tab.
tabPage},{BackgroundTransparency='ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k._lastValue=k.value
if not k.minimal then k:_buildLabel()end k.track=k.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-15,0.5,0),Size=UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=k.main},{
BackgroundColor3='SliderBackground'})k.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=k.track})k.progress=
k.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=k.track})k.
window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=k.progress})k.window:Create('UIGradient',{Offset=Vector2.
new(0,0.5),Rotation=2,Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)
},Parent=k.progress},{Color={'SliderProgress',ah.toColorSequence}})k.progressGlow=k.window:CreateGlow(k.progress,
'AccentColor',20,1)k.handle=k.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,20,0.5,0),Size=
UDim2.fromOffset(35,20),BorderSizePixel=0,ZIndex=50,BackgroundTransparency=1,Parent=k.progress},{BackgroundColor3=
'SliderHandle'})k.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.handle})k.handleGlow=k.window:
CreateGlow(k.handle,Color3.fromRGB(255,255,255),10,1)k.handleStroke=k.window:Create('UIStroke',{Transparency=1,Parent=k.
handle},{Color='SliderStroke'})k.interact=k.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,
1),Text='',TextTransparency=1,ZIndex=10,Parent=k.track})k.window:ConnectFor(k,k.main.MouseEnter,function()if not k.
window:_interactive()then return end ag.tweenService:Create(k.track,e,{BackgroundColor3=k.window.theme.
SliderBackgroundHover}):Play()end)k.window:ConnectFor(k,k.main.MouseLeave,function()ag.tweenService:Create(k.track,e,{
BackgroundColor3=k.window.theme.SliderBackground}):Play()end)k.window:ConnectFor(k,k.interact.InputBegan,function(l)if l
.UserInputType==Enum.UserInputType.MouseButton1 or l.UserInputType==Enum.UserInputType.Touch then b.click()k.dragging=
true k:_setHeld(true)k:_updateFromMouse()if k._dragConnection then k._dragConnection:Disconnect()k._dragConnection=nil
end k._dragConnection=ag.runService.RenderStepped:Connect(function()if k.window.unloaded or not k.dragging then if k.
_dragConnection then k._dragConnection:Disconnect()k._dragConnection=nil end return end k:_updateFromMouse()end)end end)
k.window:ConnectFor(k,ag.userInputService.InputEnded,function(l)if(l.UserInputType==Enum.UserInputType.MouseButton1 or l
.UserInputType==Enum.UserInputType.Touch)and k.dragging then k.dragging=false k:_setHeld(false)if k._dragConnection then
k._dragConnection:Disconnect()k._dragConnection=nil end k.window:_persist(k)end end)if k.description and not k.minimal
then k.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})end k.window:ConnectFor(k,k.main:
GetPropertyChangedSignal'AbsoluteSize',function()if k.window.animating or(k.window.hidden and k.window.hasShownOnce)then
return end k:_applyLayout()end)k:_applyLayout()if k.minimal then k.main.Size=UDim2.new(1,-20,0,41)k.track.AnchorPoint=
Vector2.new(0.5,0.5)k.track.Position=UDim2.new(0.5,0,0.5,0)k.track.Size=UDim2.new(1,-30,0,14)end k:_renderProgress()
return k end function ae._buildLabel(i)i.container=i.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=i.main})i
.containerLayout=i.window:Create('UIListLayout',{Padding=UDim.new(0,2),VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.container})i.titleContainer=i.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=i.container})i.window:Create('UIListLayout',{Padding=UDim
.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=i.titleContainer})i.titleFlex=i.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,
Parent=i.titleContainer})if i.icon then i.iconLabel=i.window:Create('ImageLabel',{Image=i.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=i.titleContainer},{ImageColor3=
'ContentColor'})end i.title=i.window:Create('TextLabel',{Text=ak.t(i.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,
RichText=true,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=i.titleContainer},{TextColor3='ContentColor',FontFace=
'Font'})i.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=i.title})i.valueHost=i.window:Create(
'Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=i.container})
i.valueOdo=ai.new(i.window,i.valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28
})i.valueOdo:snap(i:_format(i.value))end function ae._setMainHeight(i,j)if i._widthManaged then i.main.Size=UDim2.new(i.
main.Size.X.Scale,i.main.Size.X.Offset,0,j)else i.main.Size=UDim2.new(1,-20,0,j)end end function ae._applyLayout(i)if i.
minimal then return end local j=i.main.AbsoluteSize.X local k=if j>0 and j<h then'narrow'else'wide'if i._layoutMode==k
then return end i._layoutMode=k if k=='narrow'then i:_setMainHeight(70)i.container.AnchorPoint=Vector2.new(0,0)i.
container.Position=UDim2.new(0,20,0,14)i.container.Size=UDim2.new(1,-40,0,16)i.containerLayout.FillDirection=Enum.
FillDirection.Horizontal i.titleFlex.FlexMode=Enum.UIFlexMode.Fill i.valueHost.AutomaticSize=Enum.AutomaticSize.X i.
valueHost.Size=UDim2.new(0,0,0,16)i.track.AnchorPoint=Vector2.new(0.5,1)i.track.Position=UDim2.new(0.5,0,1,-14)i.track.
Size=UDim2.new(1,-30,0,14)else i:_setMainHeight(65)i.container.AnchorPoint=Vector2.new(0,0.5)i.container.Position=UDim2.
new(0,20,0.5,0)i.container.Size=UDim2.new(0,170,0,33)i.containerLayout.FillDirection=Enum.FillDirection.Vertical i.
titleFlex.FlexMode=Enum.UIFlexMode.None i.valueHost.AutomaticSize=Enum.AutomaticSize.None i.valueHost.Size=UDim2.new(1,0
,0,16)i.track.AnchorPoint=Vector2.new(1,0.5)i.track.Position=UDim2.new(1,-15,0.5,0)i.track.Size=UDim2.new(0,222,0,14)end
end function ae._format(i,j)local k=string.format('%.'..i._decimals..'f',j)if i.suffix~=''then return k..' '..i.suffix
end return k end function ae._renderProgress(i,j)local k=i.range[2]-i.range[1]local l=if k~=0 then math.clamp((i.value-i
.range[1])/k,0,1)else 0 local m=UDim2.fromScale(l,1)if j then ag.tweenService:Create(i.progress,j,{Size=m}):Play()else i
.progress.Size=m end end function ae._updateFromMouse(i)local j=i.track.AbsoluteSize.X if j<=0 then return end local k=
math.clamp((ag.userInputService:GetMouseLocation().X-i.track.AbsolutePosition.X)/j,0,1)local l=d(i.range,i.increment,i.
range[1]+k*(i.range[2]-i.range[1]))if l~=i.value then i.value=l if i.valueOdo then i.valueOdo:snap(i:_format(l))end i.
_lastValue=l i:_renderProgress(g)i:_fireCallback(l)end end function ae._setHeld(i,j)if j then ag.tweenService:Create(i.
handle,f,{Size=UDim2.fromOffset(41,22),BackgroundTransparency=0.7}):Play()ag.tweenService:Create(i.handleStroke,f,{
Transparency=0.6}):Play()else ag.tweenService:Create(i.handle,f,{Size=UDim2.fromOffset(35,20),BackgroundTransparency=0})
:Play()ag.tweenService:Create(i.handleStroke,f,{Transparency=1}):Play()end end function ae._fireCallback(i,j)i.window:
_runGuarded(i,i.callback,j)end function ae.Set(i,j,k)j=d(i.range,i.increment,j)i.value=j if i.valueOdo then i.valueOdo:
to(i:_format(j),j>=(i._lastValue or j))end i._lastValue=j i:_renderProgress(e)if not k then i:_fireCallback(j)i.window:
_persist(i)end end local i=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function
ae._setShown(j,k,l)local m=j.window if k then m:_revealCommon(j,l)m:_reveal(j.track,{BackgroundTransparency=0},l)m:
_reveal(j.progress,{BackgroundTransparency=0},l)m:_reveal(j.handle,{BackgroundTransparency=0},l)if j.valueOdo then j.
valueOdo:reveal(0.3,l)end m:_reveal(j.progressGlow,{Transparency=math.max(0.55,m.theme.AccentGlow)},l,i)m:_reveal(j.
handleGlow,{Transparency=0.8},l,i)else m:_hideCommon(j,l)m:_reveal(j.track,{BackgroundTransparency=1},l)m:_reveal(j.
progress,{BackgroundTransparency=1},l)m:_reveal(j.handle,{BackgroundTransparency=1},l)if j.valueOdo then j.valueOdo:
reveal(1,l)end m:_reveal(j.progressGlow,{Transparency=1},l,i)m:_reveal(j.handleGlow,{Transparency=1},l,i)end end
function ae._refreshTheme(j)ag.tweenService:Create(j.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=math.max(0.55,j.window.theme.AccentGlow)}):Play()end function ae._minWidth(j)if j.
minimal then return 100 end local k=40 if j.icon then k+=22 end k+=ah.textWidth(j.window.theme.Font,16,j.name)k+=12 k+=
ah.textWidth(j.window.theme.Font,15,j:_format(j.value))return math.max(k,160)end aj(ae)return ae end)()end,[18]=function
()local aa,ab,ac=a(18)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,b,c=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.
constants),ac(af.locale),ac(af.log)local d,e,f,g=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function h(i)return i.fill.
Keypoints[1].Value end local function i(j)if j>0 then return string.format('+%.1f%%',j)elseif j<0 then return string.
format('%.1f%%',j)else return'0%'end end local function j(k)if typeof(k)~='number'then return tostring(k)end local l=
tostring(math.floor(math.abs(k)))local m=l:reverse():gsub('%d%d%d','%0,'):reverse()if m:sub(1,1)==','then m=m:sub(2)end
return if k<0 then'-'..m else m end local function k(l)if l>0 then return'+'..j(math.round(l))elseif l<0 then return j(
math.round(l))else return'0'end end function ae.new(l,m)m=if typeof(m)=='table'then m else{}local n=setmetatable({tab=
assert(l,'Missing argument #1 (Tab expected)'),window=l.window,name=m.name or m.Name or'Statistic',icon=m.icon or m.Icon
,description=m.description or m.Description,value=if(m.value or m.Value)~=nil then(m.value or m.Value)else 0,_hasValue=(
m.value or m.Value)~=nil,numberEasing=if(m.numberEasing~=nil)then m.numberEasing elseif m.NumberEasing~=nil then m.
NumberEasing else true,changeMode=m.changeMode or m.ChangeMode or'percentage',changeBaseline=m.changeBaseline or m.
ChangeBaseline or'previous',prefix=m.prefix or m.Prefix or'',suffix=m.suffix or m.Suffix or'',compact=m.compact or m.
Compact or l.compact or false,display=(m.display or m.Display or'value'),_initialValue=if(m.value or m.Value)~=nil then(
m.value or m.Value)else nil,_lastChange=0},ae)if n.compact then n:_buildCompact()else n:_buildFull()end if n.description
then if n.compact then c.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{n.name}'.`)else
n.descriptor=ac(ab.Parent.descriptor).new(n.tab,{description=n.description})end end return n end function ae._buildFull(
l)local m=l.window l.main=m:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=l.name,ZIndex=5,
BackgroundTransparency=1,Parent=l.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})m:Create('UICorner',{Parent=l.main},{CornerRadius='ElementCornerRadius'})l.stroke=m:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=l.main},{Transparency='ElementStrokeTransparency'})l
.strokeGradient=m:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=d.neutral.stroke,Transparency=e,Parent
=l.stroke})l.titleContainer=m:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=l.main})l.gradientContainer=m:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=l.main})l.glow=m:CreateGlow(l.main,h(d.neutral),13,1)l.title=m:Create(
'TextLabel',{Text=b.t(l.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=l.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})l.mainGradient=m:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=d.neutral.fill,Transparency=e,Parent=l.gradientContainer})m:Create('UICorner',{Parent=l.
gradientContainer},{CornerRadius='ElementCornerRadius'})if l.icon then l.iconLabel=m:Create('ImageLabel',{Image=l.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=l.
titleContainer},{ImageColor3='ContentColor'})end l.containerLayout=m:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=l.titleContainer})l.valueHost=m:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=l.main})l.changeHost=m:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=l.main})l.
valueOdo=ai.new(m,l.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})l.valueOdo:snap(l:
_formatValue(l.value))l.changeOdo=ai.new(m,l.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})l.changeOdo:snap(l:_formatChange(0))l._accentGradients={l.strokeGradient,l.mainGradient}end function ae.
_buildCompact(l)local m,n=l.window,l.tab.compact or false l.main=m:Create('Frame',{Name=l.name,Size=if n then UDim2.
fromOffset(0,f)else UDim2.new(1,-20,0,f),AutomaticSize=if n then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=l.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})m:Create('UICorner',{Parent=l.main},{CornerRadius=
'ElementCornerRadius'})l.stroke=m:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=l.main},{
Transparency='ElementStrokeTransparency'})l.strokeGradient=m:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=d.neutral.stroke,Transparency=e,Parent=l.stroke})if n then m:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=l.main})end m:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=l.main})l.card=m:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,f),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=l.main})m:Create('UICorner',{Parent=l.card},{CornerRadius='ElementCornerRadius'})l.
mainGradient=m:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=d.neutral.fill,Transparency=e,Parent=l.
card})m:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=l.card})m:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=l.card})l.titleContainer=m:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=l.card})m:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=l.titleContainer})m:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=l
.titleContainer})if l.icon then l.iconLabel=m:Create('ImageLabel',{Image=l.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=l.titleContainer},{
ImageColor3='ContentColor'})end l.title=m:Create('TextLabel',{Text=b.t(l.name),Size=UDim2.fromOffset(0,16),AutomaticSize
=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=l.titleContainer},{TextColor3=
'ContentColor',FontFace='Font'})m:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=l.title})l.readoutHost=m:
Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),BackgroundTransparency=1,BorderSizePixel=
0,LayoutOrder=1,ZIndex=6,Parent=l.card})l.readoutOdo=ai.new(m,l.readoutHost,{textSize=17,alignment=Enum.
HorizontalAlignment.Right,transparency=1})l.readoutOdo:snap(l.display=='change'and l:_formatChange(0)or l:_formatValue(l
.value))l._accentGradients={l.strokeGradient,l.mainGradient}end function ae._setAccent(l,m,n)local o=d[m]l.
strokeGradient.Color=o.stroke l.mainGradient.Color=o.fill if l.glow then l.glow.Color=h(o)end local p,q=if n==1 then 14
elseif n==-1 then-10 else 2,if n==1 then Vector2.new(0.04,0.5)elseif n==-1 then Vector2.new(-4E-2,0.5)else Vector2.new(0
,0.5)for r,s in l._accentGradients do ag.tweenService:Create(s,g,{Rotation=p,Offset=q}):Play()end end function ae.
_formatValue(l,m)return l.prefix..j(m)..l.suffix end function ae._formatChange(l,m)if l.changeMode=='absolute'then
return k(m)else return i(m)end end function ae._showValue(l,m,n,o,p)if l.numberEasing and not p then m:to(l:
_formatValue(n),n>=o)else m:snap(l:_formatValue(n))end end function ae._updateFullReadouts(l,m,n,o,p,q,r)l:_showValue(l.
valueOdo,m,n,r)if q then l.changeOdo:snap(q)l._lastChange=0 elseif l.numberEasing and not p then l.changeOdo:to(l:
_formatChange(o),o>=l._lastChange)l._lastChange=o else l.changeOdo:snap(l:_formatChange(o or 0))l._lastChange=o or 0 end
end function ae._updateCompactReadout(l,m,n,o,p,q,r)if l.display=='change'then if q then l.readoutOdo:snap(q)l.
_lastChange=0 elseif l.numberEasing and not p then l.readoutOdo:to(l:_formatChange(o),o>=l._lastChange)l._lastChange=o
else l.readoutOdo:snap(l:_formatChange(o or 0))l._lastChange=o or 0 end else l:_showValue(l.readoutOdo,m,n,r)end end
function ae.Set(l,m)assert(typeof(m)=='number','Statistic:Set() - value must be a number, got '..typeof(m))local n,o=l.
value,not l._hasValue l.value=m l._hasValue=true if o then l._initialValue=m end local p=if l.changeBaseline=='initial'
then l._initialValue else n local q,r,s,t,u=o or p==m if q then r=0 t='neutral'u=0 elseif p==0 then local v,w=if m>0
then'+'else'-',if l.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'s=v..w t=if m>0 then'positive'else'negative'u=
if m>0 then 1 else-1 elseif l.changeMode=='percentage'then r=((m-p)/math.abs(p))*100 u=if r>0 then 1 elseif r<0 then-1
else 0 t=if u==1 then'positive'elseif u==-1 then'negative'else'neutral'else r=m-p u=if r>0 then 1 elseif r<0 then-1 else
0 t=if u==1 then'positive'elseif u==-1 then'negative'else'neutral'end l:_setAccent(t,u)if l.compact then l:
_updateCompactReadout(m,n,r,q,s,o)else l:_updateFullReadouts(m,n,r,q,s,o)end end function ae.ResetBaseline(l,m)local n,o
,p=l.value,not l._hasValue,if typeof(m)=='number'then m else l.value l._initialValue=p l.value=p l._hasValue=true l.
_lastChange=0 if l.compact then if l.display=='change'then l.readoutOdo:snap(l:_formatChange(0))else l:_showValue(l.
readoutOdo,p,n,o)end else l.changeOdo:snap(l:_formatChange(0))l:_showValue(l.valueOdo,p,n,o)end l:_setAccent('neutral',0
)end function ae._setShown(l,m,n)local o=l.window if l.compact then o:_reveal(l.main,{BackgroundTransparency=if m then(l
.window.theme.ElementTransparency or 0)else 1},n)o:_reveal(l.stroke,{Transparency=if m then l.window.theme.
ElementStrokeTransparency else 1},n)o:_reveal(l.card,{BackgroundTransparency=if m then 0 else 1},n)o:_reveal(l.title,{
TextTransparency=if m then 0 else 1},n)if l.iconLabel then o:_reveal(l.iconLabel,{ImageTransparency=if m then 0 else 1},
n)end l.readoutOdo:reveal(if m then 0 else 1,n)return end if m then o:_revealCommon(l,n)o:_reveal(l.gradientContainer,{
BackgroundTransparency=0},n)o:_reveal(l.glow,{Transparency=0.82},n)l.valueOdo:reveal(0,n)l.changeOdo:reveal(0,n)else o:
_hideCommon(l,n)o:_reveal(l.gradientContainer,{BackgroundTransparency=1},n)o:_reveal(l.glow,{Transparency=1},n)l.
valueOdo:reveal(1,n)l.changeOdo:reveal(1,n)end end function ae._minWidth(l)local m=40 if l.icon then m+=26 end m+=ah.
textWidth(l.window.theme.Font,16,b.resolve(l.name))local n=if l.display=='change'then l:_formatChange(0)else l:
_formatValue(l.value)m+=ah.textWidth(l.window.theme.Font,17,n)return m end aj(ae)return ae end)()end,[19]=function()
local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,b=ac(af.variables),ac(af.functions),ac(af.locale),ac(af.ordering),ac(af.HapticEngine),ac(ab
.Parent.search)local function c(d,e)for f,g in e do if g.__type=='Group'then c(d,g.elements)else d:_unregisterControl(g)
end if g.connections then for h,i in g.connections do d:Disconnect(i)end g.connections=nil end if g._dragConnection then
g._dragConnection:Disconnect()g._dragConnection=nil end if g._outsideClickConn then d:Disconnect(g._outsideClickConn)g.
_outsideClickConn=nil end end end local d,e,f={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=
0.3,content=0.3},unselected={background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},TweenInfo
.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection
.Out)function ae.new(g,h)h=if typeof(h)=='table'then h else{}local i=setmetatable({window=assert(g,
'Missing argument #1 (Window expected)'),name=h.name or h.Name,icon=h.icon or h.Icon,neglectSelector=h.neglectSelector
or h.NeglectSelector or false,customOrder=h.customOrder or h.CustomOrder or 0,forgetState=h.forgetState or h.ForgetState
or false,elements={},connections={}},ae)assert(i.name or i.icon,'A tab needs a name or an icon.')if not i.
neglectSelector then i.topbarItem=i.window:Create('Frame',{Name=i.name,Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.
AutomaticSize.X,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,
LayoutOrder=i.customOrder or 0,Parent=i.window.tabList})i.topbarItemInteract=i.window:Create('TextButton',{Active=false,
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=i.topbarItem})i.
window:Create('UICorner',{Parent=i.topbarItem},{CornerRadius='PillCornerRadius'})i.topbarItemGradient=i.window:Create(
'UIGradient',{Rotation=90,Parent=i.topbarItem},{Color={'TabBackground',ah.toColorSequence}})i.topbarItemStroke=i.window:
Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=i
.topbarItem})i.topbarItemStrokeGradient=i.window:Create('UIGradient',{Rotation=90,Parent=i.topbarItemStroke},{Color={
'TabStroke',ah.toColorSequence}})i.topbarItemContainer=i.window:Create('Frame',{Size=UDim2.fromOffset(0,34),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,Parent=i.topbarItem})i.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=i.topbarItemContainer})i.topbarItemLayout=i.
window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent
=i.topbarItemContainer})if i.icon then i.topbarItemIcon=i.window:Create('ImageLabel',{Image=i.icon,Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=i.topbarItemContainer},{
ImageColor3='TabColor'})end if i.name then i.topbarItemTitle=i.window:Create('TextLabel',{Text=ai.t(i.name),Size=UDim2.
fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.XY,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=i.topbarItemContainer},
{TextColor3='TabColor',FontFace='Font'})end end i.tabPage=i.window:Create('ScrollingFrame',{Name=i.name,Size=UDim2.new(1
,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency=1,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=i.customOrder or 0,Parent=i.window.elements})i.tabPageLayout=i.window:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.tabPage})i.window
:Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=i.tabPage})if not i.neglectSelector
then table.insert(i.connections,i.window:Connect(i.topbarItemInteract.MouseButton1Click,function()ak.click()i:Select()
end))table.insert(i.connections,i.window:Connect(i.topbarItemInteract.MouseEnter,function()if not i.window:_interactive(
)then return end if i.window.selectedTab~=i then i:_applyVisual('hover',f)i:_spinGradients()end end))table.insert(i.
connections,i.window:Connect(i.topbarItemInteract.MouseLeave,function()if i.window.selectedTab~=i then i:_applyVisual(
'unselected',f)end end))end return i end function ae._applyVisual(g,h,i)if g.neglectSelector or not g.topbarItem then
return end local j=d[h]if not j then return end if i then ag.tweenService:Create(g.topbarItem,i,{BackgroundTransparency=
j.background}):Play()ag.tweenService:Create(g.topbarItemStroke,i,{Transparency=j.stroke}):Play()if g.topbarItemIcon then
ag.tweenService:Create(g.topbarItemIcon,i,{ImageTransparency=j.content}):Play()end if g.topbarItemTitle then ag.
tweenService:Create(g.topbarItemTitle,i,{TextTransparency=j.content}):Play()end else g.topbarItem.BackgroundTransparency
=j.background g.topbarItemStroke.Transparency=j.stroke if g.topbarItemIcon then g.topbarItemIcon.ImageTransparency=j.
content end if g.topbarItemTitle then g.topbarItemTitle.TextTransparency=j.content end end end function ae.
_spinGradients(g)if g.neglectSelector then return end local h=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)for i,j in{g.topbarItemGradient,g.topbarItemStrokeGradient}do j.Rotation=-270 ag.tweenService:
Create(j,h,{Rotation=90}):Play()end end function ae.Select(g,h)if g.window._searching then b.close(g.window,{showTabs=
true,jumpTo=false})end g.window.selectedTab=g g.window:_jumpTo(g.tabPage)local i=h or not g.window:_interactive()if not
g.neglectSelector and not i then g:_applyVisual('selected',e)end for j,k in g.window.tabs do if k~=g.window.selectedTab
then k:Deselect(i)end end if g~=g.window.rfSettings and g.window.settingsAction and not i then ag.tweenService:Create(g.
window.settingsAction.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=
0.6}):Play()end end function ae.Deselect(g,h)if not g.neglectSelector and not h then g:_applyVisual('unselected',e)end
end function ae._register(g,h)table.insert(g.elements,h)aj(h,#g.elements*10)g.window:_restoreLate(h)if not g.window.
hidden then h:_setShown(true,true)end return h end function ae.CreateButton(g,h)return g:_register(ac(ab.Parent.button).
new(g,h))end function ae.CreateToggle(g,h)return g:_register(ac(ab.Parent.toggle).new(g,h))end function ae.CreateSwitch(
g,h)return g:CreateToggle(h)end function ae.CreateSection(g,h)return g:_register(ac(ab.Parent.section).new(g,h))end
function ae.CreateStat(g,h)return g:_register(ac(ab.Parent.stat).new(g,h))end function ae.CreateSlider(g,h)return g:
_register(ac(ab.Parent.slider).new(g,h))end function ae.CreateDropdown(g,h)return g:_register(ac(ab.Parent.dropdown).
new(g,h))end function ae.CreateInput(g,h)return g:_register(ac(ab.Parent.input).new(g,h))end function ae.CreateKeybind(g
,h)return g:_register(ac(ab.Parent.keybind).new(g,h))end function ae.CreateColorPicker(g,h)return g:_register(ac(ab.
Parent.colorpicker).new(g,h))end function ae.CreateGroup(g,h)return g:_register(ac(ab.Parent.group).new(g,h))end
function ae._moveElement(g,h,i)local j=table.find(g.elements,h)if not j then return end table.remove(g.elements,j)i=math
.clamp(i,1,#g.elements+1)table.insert(g.elements,i,h)for k,l in g.elements do aj(l,k*10)end end function ae.Remove(g)
local h=g.window if h._searching then b.close(h,{showTabs=true,jumpTo=h.selectedTab and h.selectedTab.tabPage})end local
i=table.find(h.tabs,g)if i then table.remove(h.tabs,i)end if h.selectedTab==g then h.selectedTab=nil for j,k in ipairs(h
.tabs)do if not k.neglectSelector then k:Select()break end end end c(h,g.elements)for j,k in g.connections do h:
Disconnect(k)end g.connections={}if g.topbarItem then h:DestroySubtree(g.topbarItem)end if g.tabPage then h:
DestroySubtree(g.tabPage)end g.topbarItem=nil g.tabPage=nil g.elements={}end return ae end)()end,[20]=function()local aa
,ab,ac=a(20)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tag'local af=ab.Parent.Parent.utility local
ag,ah,ai,aj,ak=ac(af.variables),ac(af.functions),ac(af.image),Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(b,c)c=if typeof(c)=='table'then c else{}local d=setmetatable(
{window=assert(b,'Missing argument #1 (Window expected)'),text=c.text or c.Text or c.title or c.Title,icon=c.icon or c.
Icon,color=c.color or c.Color or aj},ae)assert(d.icon or(d.text and d.text~=''),'A Tag requires an icon, text, or both.'
)d.main=d.window:Create('Frame',{Name='Tag',Size=UDim2.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=d.color,BorderSizePixel=0,LayoutOrder=c.order or c.Order or 0,BackgroundTransparency=1,Parent=d.window.
tagContainer})d.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=d.main})d.window:Create('UIPadding',{
PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=d.main})d.window:Create('UIListLayout',{Padding=UDim.new(0
,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder
.LayoutOrder,Parent=d.main})local e=ah.contrastColor(d.color)d.iconLabel=d.window:Create('ImageLabel',{Name='Icon',Image
=d.icon or'',ImageColor3=e,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,Visible=d.icon~=nil,ZIndex=5,
ImageTransparency=1,Parent=d.main})d.title=d.window:Create('TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size
=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,Text=d.text or'',TextColor3=e,
TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,RichText=true,Visible=d.text~=nil and d.text~='',
LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=d.main},{FontFace='Font'})d.window.tagContainer.Visible=true if not d.
window.hidden then d:_setShown(true,ak)end return d end function ae._setShown(b,c,d)local e,f=if c then 0 else 1,if
typeof(d)=='TweenInfo'then d elseif d then ak else nil if f then ag.tweenService:Create(b.main,f,{BackgroundTransparency
=e}):Play()ag.tweenService:Create(b.iconLabel,f,{ImageTransparency=e}):Play()ag.tweenService:Create(b.title,f,{
TextTransparency=e}):Play()else b.main.BackgroundTransparency=e b.iconLabel.ImageTransparency=e b.title.TextTransparency
=e end end function ae.SetColor(b,c)b.color=c local d=ah.contrastColor(c)ag.tweenService:Create(b.main,ak,{
BackgroundColor3=c}):Play()ag.tweenService:Create(b.iconLabel,ak,{ImageColor3=d}):Play()ag.tweenService:Create(b.title,
ak,{TextColor3=d}):Play()end function ae.SetText(b,c)b.text=c b.title.Text=c or''b.title.Visible=c~=nil and c~=''end
function ae.SetIcon(b,c)b.icon=c ai.assign(b.iconLabel,'Image',c)b.iconLabel.Visible=c~=nil end function ae.Set(b,c)if c
.color or c.Color then b:SetColor(c.color or c.Color)end if c.text or c.Text or c.title or c.Title then b:SetText(c.text
or c.Text or c.title or c.Title)end if c.icon~=nil or c.Icon~=nil then b:SetIcon(c.icon or c.Icon)end end function ae.
Remove(b)b.window:DestroySubtree(b.main)local c=table.find(b.window.tags,b)if c then table.remove(b.window.tags,c)end if
#b.window.tags==0 then b.window.tagContainer.Visible=false end end return ae end)()end,[21]=function()local aa,ab,ac=a(
21)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.Parent.Parent.utility local ag,ah,
ai,aj,ak,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.image),ac(af.
HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.
Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,UDim2.new(0.5,0,0.5,-180),UDim2.new(0.5,0,0.5,180),
UDim2.new(0.5,0,0.5,0)local function t(u)return math.clamp(#u*0.05+3,3,8)end local function u(v)if type(v)=='number'then
return'rbxassetid://'..tostring(v)end return v end function ae.new(v,w,x)w=if typeof(w)=='table'then w else{}local y=
setmetatable({window=assert(v,'Missing argument #1 (Window expected)'),title=w.title or w.Title or'',subtitle=w.subtitle
or w.Subtitle,icon=w.icon or w.Icon,avatar=w.avatar or w.Avatar,minWidth=w.minWidth or w.MinWidth,subtitleAbove=w.
subtitleAbove or w.SubtitleAbove or false,position=w.position or'Top',_hovered=false,_dismissed=false},ae)y.duration=w.
duration or w.Duration or t(y.title..(y.subtitle or''))local z=y.avatar~=nil and y.avatar~=0 local A=z or(y.icon~=nil
and y.icon~=0 and y.icon~='')y._iconImage=if z then aj.avatar(y.avatar,function(B)if y.iconLabel and not y._dismissed
and y.main.Parent then aj.assign(y.iconLabel,'Image',B)end end)elseif A then u(y.icon)else nil y._iconSize=if z then h
else g y._leftPad=if z then k else i y._rightPad=if z then l else j y._minWidth=math.max(y.minWidth or 0,o)local B=y.
subtitle~=nil and y.subtitle~=''y.main=y.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=UDim2.new(0,0
,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=x or y.window.toasts})y.window:Create('UIPadding',{PaddingTop=UDim
.new(0,n),Parent=y.main})y.body=y.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0
,1,0),Position=if y.position=='Bottom'then r else q,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,
ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=y.main})y.window:Create('UIGradient',{Rotation=270,Offset=Vector2
.new(0,-0.1),Parent=y.body},{Color={'WindowColor',ah.toColorSequence}})y.window:Create('UICorner',{CornerRadius=UDim.
new(1,0),Parent=y.body})y.stroke=y.window:Create('UIStroke',{Transparency=1,Parent=y.body},{Color='SurfaceStroke'})y.
shadow=y.window:CreateGlow(y.body,'ShadowColor',20,1)y.window:Create('UIPadding',{PaddingLeft=UDim.new(0,y._leftPad),
PaddingRight=UDim.new(0,y._rightPad),Parent=y.body})y.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,m),Parent=y.body})if A then y.iconLabel=y.window:Create('ImageLabel',{
Image=y._iconImage,Size=UDim2.fromOffset(y._iconSize,y._iconSize),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=y.body
},if z then nil else{ImageColor3='ContentColor'})y.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=y.
iconLabel})end y.container=y.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,B and 32
or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=y.body})y.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=y.container})y.titleLabel=y.window:Create('TextLabel',
{Text=y.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if y.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=y.container},{TextColor3='ContentColor',FontFace='TitleFont'})if B then y.subtitleLabel=y.
window:Create('TextLabel',{Text=y.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if y.subtitleAbove then 1 else
2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=y.container},{TextColor3='ContentColor',FontFace='Font'})end y
.window._toastCount=(y.window._toastCount or 0)+1 y.main.LayoutOrder=-y.window._toastCount y._connections={y.window:
Connect(y.body.MouseEnter,function()y._hovered=true end),y.window:Connect(y.body.MouseLeave,function()y._hovered=false
end),y.window:Connect(y.body.InputBegan,function(C)if C.UserInputType==Enum.UserInputType.MouseButton1 or C.
UserInputType==Enum.UserInputType.Touch then y:_dismiss()end end)}task.spawn(function()y:_show()end)return y end
function ae._measure(v)local w,x=ah.textWidth(v.window.theme.TitleFont,16,v.title),if v.subtitleLabel then ah.textWidth(
v.window.theme.Font,14,v.subtitle)else 0 local y,z=math.max(w,x),if v.iconLabel then v._leftPad+v._iconSize+m else v.
_leftPad local A,B=math.clamp(z+y+v._rightPad,v._minWidth,p),if v.subtitleLabel then 31 else 16 local C=math.max(B,if v.
iconLabel then v._iconSize else 0)+18 return A,C end function ae._show(v)if not v.main.Parent then return end ak.notify(
)local w,x=v:_measure()v.main.Size=UDim2.new(0,w,0,0)ag.tweenService:Create(v.main,c,{Size=UDim2.new(0,w,0,x+n)}):Play()
ag.tweenService:Create(v.body,b,{Position=s}):Play()ag.tweenService:Create(v.body,d,{BackgroundTransparency=0}):Play()ag
.tweenService:Create(v.stroke,d,{Transparency=0.9}):Play()ag.tweenService:Create(v.shadow,e,{Transparency=0.6}):Play()ag
.tweenService:Create(v.titleLabel,e,{TextTransparency=0}):Play()task.wait(0.05)if v._dismissed or not v.main.Parent then
return end if v.iconLabel then ag.tweenService:Create(v.iconLabel,e,{BackgroundTransparency=0.95}):Play()ag.tweenService
:Create(v.iconLabel,e,{ImageTransparency=0}):Play()end task.wait(0.05)if v._dismissed or not v.main.Parent then return
end if v.subtitleLabel then ag.tweenService:Create(v.subtitleLabel,e,{TextTransparency=0.5}):Play()end local y=0 while y
<v.duration and not v._dismissed and v.main.Parent do local z=task.wait()if not v._hovered then y+=z end end v:_dismiss(
)end function ae._dismiss(v)if v._dismissed then return end v._dismissed=true if not v.main.Parent then return end ag.
tweenService:Create(v.body,d,{BackgroundTransparency=1}):Play()ag.tweenService:Create(v.stroke,d,{Transparency=1}):Play(
)ag.tweenService:Create(v.shadow,e,{Transparency=1}):Play()ag.tweenService:Create(v.titleLabel,e,{TextTransparency=1}):
Play()if v.subtitleLabel then ag.tweenService:Create(v.subtitleLabel,e,{TextTransparency=1}):Play()end if v.iconLabel
then ag.tweenService:Create(v.iconLabel,e,{ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:
Create(v.body,f,{Size=UDim2.new(1,-60,1,0)}):Play()local w=ag.tweenService:Create(v.main,f,{Size=UDim2.new(0,v.main.Size
.X.Offset,0,0)})w:Play()w.Completed:Wait()if not v.main.Parent then return end for x,y in v._connections do v.window:
Disconnect(y)end v.window:DestroySubtree(v.main)end return ae end)()end,[22]=function()local aa,ab,ac=a(22)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=
ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),ac(af.HapticEngine)function ae.new(b,c)c=if typeof(c)==
'table'then c else{}local d=setmetatable({tab=assert(b,'Missing argument #1 (Tab expected)'),window=b.window,name=c.name
or c.Name or'Switch',icon=c.icon or c.Icon,description=c.description or c.Description,forgetState=c.forgetState or c.
ForgetState or b.forgetState,compact=b.compact or false,flag=c.flag or c.Flag or(not(c.forgetState or c.ForgetState or b
.forgetState)and ah.deriveFlagFromName(c.name or c.Name or'Switch')or nil),callback=c.callback or c.Callback or function
()end,value=if(c.value or c.Value)~=nil then(c.value or c.Value)else false},ae)d.window:_registerControl(d)if d.compact
then d:_buildCompact()else d:_buildFull()end if d.description and not d.compact then d.descriptor=ac(ab.Parent.
descriptor).new(d.tab,{description=d.description})end return d end function ae._buildSwitch(b,c)local d=b.window b.
functionContainer=d:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,Parent=c},{
BackgroundColor3='ToggleTrack'})d:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=b.functionContainer})b.
containerStroke=d:Create('UIStroke',{Transparency=1,Parent=b.functionContainer},{Color='SurfaceStroke'})b.indicator=d:
Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=b.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1
,-47,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=b.value and b.window.theme.AccentColor or b.window.theme.
ToggleKnobOff,BackgroundTransparency=1,Parent=b.functionContainer})d:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=b.indicator})b.indicatorStroke=d:Create('UIStroke',{Color=b.value and b.window.theme.AccentStroke or Color3.
fromRGB(255,255,255),Transparency=1,Parent=b.indicator})b.indicatorGlow=d:CreateGlow(b.indicator,'AccentColor',20,1)b.
overlay=d:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=Vector2.
new(0,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=b.functionContainer},{Visible=
'DarkToggleOverlay'})d:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=b.overlay})b.overlayGradient=d:Create(
'UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0.35)},Parent=b.overlay})return b.functionContainer end function ae._performToggle(b)ak.
click()b.value=not b.value b:_animateIndicator()b.window:_runGuarded(b,b.callback,b.value)b.window:_persist(b)end
function ae._buildFull(b)local c=b.window b.main=c:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=b.
name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=b.tab.tabPage},{BackgroundTransparency
='ElementTransparency'})b.stroke=c:StyleElementBody(b.main)b.hoverOverlay=c:CreateHoverOverlay(b.main)b.container=c:
Create('Frame',{BorderSizePixel=0,Parent=b.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=
Vector2.new(0,0.5),BackgroundTransparency=1})b.containerLayout=c:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,Parent=b.container})if b.icon then b.iconLabel=c:Create('ImageLabel',{Image=b.icon,Size=UDim2.
fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=b.container},{ImageColor3=
'ContentColor'})end b.title=c:Create('TextLabel',{Text=aj.t(b.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=b.container},{TextColor3='ContentColor',FontFace='Font'})b.
interact=c:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Position=UDim2.
fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,Parent=b.main})b:_buildSwitch(b.main)b.
functionContainer.Position=UDim2.new(1,-15,0,20)b.functionContainer.AnchorPoint=Vector2.new(1,0.5)b.window:
_wireElementHover(b)b.window:ConnectFor(b,b.interact.MouseButton1Click,function()ag.tweenService:Create(b.stroke,
TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()ag.tweenService:Create(b.
main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()b:
_performToggle()task.wait(0.11)ag.tweenService:Create(b.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.tweenService:Create(b.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=b.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._buildCompact(b)local c=b.window b.main,b.stroke,b.interact=c:_buildCompactRow(b.tab,b.name,10)b.
hoverOverlay=b.interact c:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=b.interact})
c:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=b.interact})b.container=c:Create('Frame',
{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0
,Parent=b.interact})c:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=b.container})c:Create('UIListLayout',{
Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=b.container})if b.icon then b.iconLabel=c:Create('ImageLabel',{
Image=b.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,
Parent=b.container},{ImageColor3='ContentColor'})end b.title=c:Create('TextLabel',{Text=aj.t(b.name),Size=UDim2.
fromOffset(0,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=b.
container},{TextColor3='ContentColor',FontFace='Font'})c:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=b.
title})b:_buildSwitch(b.interact)b.functionContainer.LayoutOrder=1 b.window:_wireElementHover(b)b.window:ConnectFor(b,b.
interact.MouseButton1Click,function()ag.tweenService:Create(b.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Transparency=1}):Play()b:_performToggle()task.wait(0.11)ag.tweenService:Create(b.stroke,TweenInfo.
new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=b.window.theme.ElementStrokeTransparency}):Play(
)end)end function ae._animateIndicator(b)local c=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out
)if b.indicatorGlow then ag.tweenService:Create(b.indicatorGlow,c,{Transparency=b.value and b.window.theme.AccentGlow or
1}):Play()end if b.value then ag.tweenService:Create(b.indicator,c,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=b.
window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.tweenService:Create(b.indicatorStroke,c,{Color=b.window.
theme.AccentStroke,Transparency=0}):Play()else ag.tweenService:Create(b.indicator,c,{Position=UDim2.new(1,-47,0.5,0),
BackgroundColor3=b.window.theme.ToggleKnobOff,BackgroundTransparency=b.window.theme.ToggleKnobOffTransparency}):Play()ag
.tweenService:Create(b.indicatorStroke,c,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local b,c=
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(d,e,f)local g=d.window if e then g:_revealCommon(d,f)g:
_reveal(d.indicator,{BackgroundColor3=d.value and g.theme.AccentColor or g.theme.ToggleKnobOff,BackgroundTransparency=d.
value and 0 or g.theme.ToggleKnobOffTransparency},f,b)g:_reveal(d.indicatorStroke,{Color=d.value and g.theme.
AccentStroke or Color3.fromRGB(255,255,255),Transparency=d.value and 0 or 0.7},f,b)g:_reveal(d.indicatorGlow,{
Transparency=d.value and g.theme.AccentGlow or 1},f,c)g:_reveal(d.overlay,{BackgroundTransparency=0},f,b)g:_reveal(d.
containerStroke,{Transparency=0.85},f,b)g:_reveal(d.functionContainer,{BackgroundTransparency=g.theme.
ToggleTrackTransparency},f,b)else g:_hideCommon(d,f)g:_reveal(d.indicator,{BackgroundTransparency=1},f,b)g:_reveal(d.
indicatorStroke,{Transparency=1},f,b)g:_reveal(d.indicatorGlow,{Transparency=1},f,c)g:_reveal(d.overlay,{
BackgroundTransparency=1},f,b)g:_reveal(d.containerStroke,{Transparency=1},f,b)g:_reveal(d.functionContainer,{
BackgroundTransparency=1},f,b)end end function ae._refreshTheme(d)local e,f,g=d.window.theme,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService g:Create(d.functionContainer,f,{BackgroundTransparency=e.
ToggleTrackTransparency}):Play()g:Create(d.indicator,f,{BackgroundColor3=d.value and e.AccentColor or e.ToggleKnobOff,
BackgroundTransparency=d.value and 0 or e.ToggleKnobOffTransparency}):Play()g:Create(d.indicatorStroke,f,{Color=d.value
and e.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if d.indicatorGlow then g:Create(d.indicatorGlow,f,{
Transparency=d.value and e.AccentGlow or 1}):Play()end end function ae._minWidth(d)local e=90 if d.icon then e+=21 end e
+=ah.textWidth(d.window.theme.Font,16,d.name)return e end ai(ae)function ae.Set(d,e,f)local g=d.value~=e d.value=e if g
then d:_animateIndicator()end if not f then d.window:_runGuarded(d,d.callback,d.value)d.window:_persist(d)end end return
ae end)()end,[23]=function()local aa,ab,ac=a(23)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,
ag,ah,ai,aj,ak,b,c,d,e,f,g,h=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae.constants),ac(ae.locale),ac(ae.log),
ac(ae.HapticEngine),ac(ae.windowSizing),ac(ab.Parent.chrome),ac(ab.Parent.search),ac(ae.variables),ab.Parent.Parent.
themes,{}h.__index=h local i,j,k,l,m,n=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.
fromOffset(185,50),UDim2.new(0.5,0,0,20),320,41,2 local function o():UDim2 local p=f.workspace.CurrentCamera return c.
fit(p and p.ViewportSize)end local p={WindowColor=true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=
true,TabStroke=true,SliderProgress=true}local function q(r,s)if p[r]and typeof(s)=='Color3'then return ColorSequence.
new(s)end return s end local function r(s)return if typeof(s)=='ColorSequence'then s.Keypoints[1].Value else s end
local function s(t,u)local v=0.299*t.R+0.587*t.G+0.114*t.B local w=if v>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)
return t:Lerp(w,u)end local function t(u,v)if v.ElementGradient then local w=r(u.ElementGradient)if v.ElementStroke==nil
then u.ElementStroke=s(w,0.28)end if v.ElementStrokeGradient==nil then u.ElementStrokeGradient=ColorSequence.new(s(w,0.4
))end if v.ElementStrokeHover==nil then u.ElementStrokeHover=s(w,0.52)end end if v.TabBackground and v.TabStroke==nil
then u.TabStroke=ColorSequence.new(s(r(u.TabBackground),0.4))end end local function u(v)if typeof(v)=='table'then return
v elseif typeof(v)=='string'then local w=g:FindFirstChild(string.lower(v))if w then return ac(w)end ak.warn(
"Rayfield: unknown theme '"..v.."', using default")elseif v~=nil then ak.warn
[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(g.default)end
local function v(w)local x,y=table.clone(ac(g.default)),u(w)for z,A in y do x[z]=q(z,A)end if typeof(w)=='table'then t(x
,y)end local z=if typeof(w)=='table'then w else nil if not(z and(z.Font or z.font))then x.Font=f.brandFont(Enum.
FontWeight.Medium)end if not(z and(z.TitleFont or z.titleFont))then x.TitleFont=f.brandFont(Enum.FontWeight.SemiBold)end
return x end function h.new(w)w=if typeof(w)=='table'then w else{}if w.translations or w.Translations then aj.register(w
.translations or w.Translations)end if w.translator or w.Translator then aj.translator=w.translator or w.Translator end
aj.setActive(w.locale or w.Locale or aj.detect())local x=w.fallbackFont or w.FallbackFont if x then f.setFallbackFont(x)
end local y=setmetatable({name=w.name or w.Name or'Rayfield Window',subheading=w.subtitle or w.Subtitle,size=o(),
instances={},connections={},icon=w.icon or w.Icon,showName=w.showName or w.ShowName or'Rayfield',showIcon=w.showIcon or
w.ShowIcon or ai.icons.rayfield,themeProperties={},localeProperties={},tabs={},tags={},selectedTab=nil,theme=v(w.theme
or w.Theme),controls={},configuration=(function()local y=w.configuration or w.Configuration if not y then return{}end
return{autoSave=y.autoSave or y.AutoSave,autoLoad=y.autoLoad or y.AutoLoad,fileName=y.fileName or y.FileName,
customFolder=y.customFolder or y.CustomFolder}end)()},h)y.Flags=setmetatable({},{__index=function(z,A)local B=y.controls
[A]return B and B.value end,__newindex=function(z,A,B)local C=y.controls[A]if not C then ak.warn("Rayfield: no flag '"..
tostring(A).."' to set")return end C:Set(B)end,__iter=function()local z return function()local A z,A=next(y.controls,z)
if z then return z,A.value end return nil end end})y.screenGui=y:Create('ScreenGui',{Name=f.httpService:GenerateGUID(
false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.
ZIndexBehavior.Global,Parent=f.guiContainer})y.main=y:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=
y.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((y.size.X.Offset-
50),0),BackgroundTransparency=1,Visible=false,Parent=y.screenGui})y.drag=ac(ab.Parent.drag).new(y)y.windowCorner=y:
Create('UICorner',{Parent=y.main},{CornerRadius='CornerRoundness'})y.windowStroke=y:Create('UIStroke',{Transparency=1,
Parent=y.main},{Color='SurfaceStroke'})y.windowGradient=y:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),
Parent=y.main},{Color={'WindowColor',ag.toColorSequence}})y.bottomFade=y:Create('Frame',{BackgroundColor3=Color3.
fromRGB(255,255,255),BorderSizePixel=0,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,-
9.3E-2,100),ZIndex=ai.zIndex.bottomFade,BackgroundTransparency=1,Parent=y.main})y:Create('UICorner',{Parent=y.bottomFade
},{CornerRadius='CornerRoundness'})y.bottomFadeGradient=y:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,0.2),
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),
NumberSequenceKeypoint.new(0.7007,0.631),NumberSequenceKeypoint.new(1,1)},Parent=y.bottomFade},{Color={'WindowColor',
function(z)return ColorSequence.new(ag.toColorSequence(z).Keypoints[1].Value)end}})y.topbar=y:Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,66),Active=true,Parent=y.main})y.topContainer=y:Create('Frame',{Size=UDim2
.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,Parent=y.topbar})y.topContainerLayout=y:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=y.topContainer})y.titleContainer=y:Create('Frame',{
Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(
0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=y.topContainer})y.titleContainerLayout=y:Create('UIListLayout',{
Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=y.titleContainer})if y.name then y.title=y:Create('TextLabel',{Text=aj.t(y.
name),FontFace=f.brandFont(Enum.FontWeight.Medium),Size=UDim2.fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=
y.titleContainer},{FontFace='Font',TextColor3='TitlingColor'})end if y.icon then y.topbarIcon=y:Create('ImageLabel',{
Image=y.icon,BackgroundTransparency=1,Size=UDim2.fromOffset(32,32),ImageTransparency=1,Parent=y.topContainer},{
ImageColor3='TitlingColor'})end if y.subheading then y.subtitle=y:Create('TextLabel',{Text=aj.t(y.subheading),Size=UDim2
.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=y.titleContainer},{TextColor3='TitlingColor',FontFace=
'Font'})end y.tagContainer=y:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.
fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=y.
topContainer})y.tagContainerLayout=y:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=y.tagContainer})y
.windowShadow=y:CreateGlow(y.main,'ShadowColor',20,1)y.elements=y:Create('Frame',{Size=UDim2.new(1,0,1,-106),Position=
UDim2.fromScale(0.5,1),AnchorPoint=Vector2.new(0.5,1),BackgroundTransparency=1,ClipsDescendants=true,Parent=y.main})y.
elementsLayout=y:Create('UIPageLayout',{Padding=UDim.new(0,0),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,TouchInputEnabled=false,EasingStyle=Enum.
EasingStyle.Exponential,TweenTime=0.4,Parent=y.elements})y.tabList=y:Create('ScrollingFrame',{Name='Tabs',Active=true,
Size=UDim2.new(1,0,0,38),Position=UDim2.new(0.5,0,0,65),AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1,
AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.X,Parent=y.main})y.tabListLayout=y:Create('UIListLayout',{Padding=UDim.new(0
,7),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum
.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=y.tabList})y:Create('UIPadding',{PaddingLeft=UDim.
new(0,22),PaddingRight=UDim.new(0,10),Parent=y.tabList})y.actionContainer=y:Create('Frame',{AnchorPoint=Vector2.new(1,
0.5),AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),
BackgroundTransparency=1,Parent=y.topbar})y.actionsListLayout=y:Create('UIListLayout',{Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Right,SortOrder=Enum.SortOrder.LayoutOrder,Parent=y.actionContainer})y.rfSettings=y:CreateTab{name=
'Rayfield Settings',customOrder=1000,neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(y,{name='Close',icon
=ai.icons.close,order=1,callback=function()y:ToggleHide()end})y.minimiseAction=ac(ab.Parent.action).new(y,{name=
'Minimise',icon=ai.icons.minimise,order=2,callback=function()y:ToggleMinimise()end})y.settingsAction=ac(ab.Parent.action
).new(y,{name='Settings',icon=ai.icons.settings,order=3,linkedTab=y.rfSettings,callback=function()y.rfSettings:Select()
end})e.build(y)y.unloaded=false y.minimised=false y.hidden=true y.animating=false y._revealing=false y.hasShownOnce=
false y.settings={toggleKeybind=Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=false}y:
LoadSettings()b.setContainer(y.screenGui)b.setEnabled(y.settings.haptics)d.buildCollapsedFace(y)y:_bindKeybind()y:
_bindMouseOverride()y:_bindTopbarDrag()y:_watchViewport()y:_buildSettingsUI()y:_syncLiveAnimation()return y end function
h._syncLiveAnimation(w)if not w.theme.LiveAnimation then w._liveAnimating=false return end if w._liveAnimating then
return end w._liveAnimating=true w._liveGeneration=(w._liveGeneration or 0)+1 local x=w._liveGeneration task.spawn(
function()local y,z=true,TweenInfo.new(10,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)while w._liveGeneration==x and
w._liveAnimating and not w.unloaded do local A=f.tweenService:Create(w.windowGradient,z,{Offset=Vector2.new(if y then
0.4 else-0.2,0),Rotation=(if y then 220 else 280)})w._liveTween=A A:Play()A.Completed:Wait()y=not y end if w.
_liveGeneration==x then w._liveAnimating=false w._liveTween=nil end end)end function h.ChangeTheme(w,x)local y=if
typeof(x)=='table'then x else v(x)for z,A in y do w.theme[z]=q(z,A)end if typeof(x)=='table'then t(w.theme,y)end for z,A
in w.themeProperties do for B,C in A do local D=if typeof(C)=='table'then C[2](w.theme[C[1] ])else w.theme[C]if typeof(D
)=='Color3'or typeof(D)=='number'then f.tweenService:Create(z,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[B]=D}):Play()else z[B]=D end end end if w.hidden then w._themeRefreshPending=true else w:
_refreshElementThemes()end w:_syncLiveAnimation()end function h._refreshElementThemes(w)for x,y in w.tabs do for z,A in
y.elements do if A._refreshTheme then A:_refreshTheme()end end end end function h.CreateTab(w,x)local y=ac(ab.Parent.tab
).new(w,x)table.insert(w.tabs,y)if not y.neglectSelector then local z=true for A,B in w.tabs do if B~=y and not B.
neglectSelector then z=false break end end if z then y:Select(true)end if not w.hidden and not w.minimised then y.
topbarItem.Visible=true y:_applyVisual(if w.selectedTab==y then'selected'else'unselected',TweenInfo.new(0.4,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out))end end return y end function h.CreateTag(w,x)local y=ac(ab.Parent.tag).new(
w,x)table.insert(w.tags,y)return y end function h._registerControl(w,x)if not x.flag or x.flag==''or x.forgetState then
return end local y=x.flag if w.controls[y]then local z=2 while w.controls[y..z]do z+=1 end y=y..z ak.warn(
"Rayfield: duplicate config flag '"..x.flag.."', saving this one as '"..y..
"'. Set a unique flag to keep it stable across sessions.")end x.flag=y w.controls[y]=x return y end function h.
_restoreLate(w,x)if not w._loadedConfig or not x.flag or x.forgetState then return end local y=w._loading w._loading=
true ah.applyTo(x,w._loadedConfig[x.flag])w._loading=y end function h._persist(w,x)if x.flag and not x.forgetState and w
.configuration.autoSave and not w._loading then task.spawn(w.Save,w)end end function h._unregisterControl(w,x)if x.flag
and w.controls[x.flag]==x then w.controls[x.flag]=nil end end function h._keybindUsing(w,x,y)if typeof(x)~='EnumItem'or
x==Enum.KeyCode.Unknown then return nil end for z,A in w.tabs do for B,C in A.elements do if C~=y and C.__type==
'Keybind'and C.value==x then return C end end end return nil end function h.Notify(w,x)if w.unloaded then return end if
not w.notifications then w.notifications=w:Create('Frame',{Name='Notifications',Size=UDim2.new(0,300,0,800),Position=
UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=w.screenGui})w:Create('UIListLayout'
,{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),Parent=w.notifications})end return
ac(ab.Parent.notification).new(w,x)end function h.Toast(w,x)if w.unloaded then return end local y=(x or{}).position or
'Top'local z=y=='Top'local A=if z then'_toastsTop'else'_toastsBottom'local B=w[A]if not B then B=w:Create('Frame',{Name=
'Toasts',Size=UDim2.new(0,l,1,-24),Position=if z then UDim2.new(0.5,0,0,12)else UDim2.new(0.5,0,1,-12),AnchorPoint=if z
then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.toast,Parent=w.screenGui})w:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=if z then Enum.VerticalAlignment.Top
else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,0),Parent=B})w[A]=B end return ac(ab.Parent.toast).new(w,x,B)end function h.Popup(w,x)if
w.unloaded then return end return ac(ab.Parent.popup).new(w,x)end function h.Hide(w)if w.animating or w.hidden then
return end if w._searching then e.close(w,{showTabs=false,jumpTo=w.selectedTab and w.selectedTab.tabPage})end w.
animating=true w._revealing=true w.hidden=true w.collapsedInteract.Visible=false if w.minimised then w.minimised=false
af.assign(w.minimiseAction.iconLabel,'Image',ai.icons.minimise)end w._restorePosition=w.main.Position local x,y=w:
_collapsedRect()local z,A,B,C=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,
Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(w.drag.
dragCosmetic,z,{Size=UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not w.hidden
then return end w.drag.drag.Visible=false end)f.tweenService:Create(w.windowShadow,z,{Transparency=1}):Play()f.
tweenService:Create(w.bottomFade,z,{BackgroundTransparency=1}):Play()if w.title then f.tweenService:Create(w.title,z,{
TextTransparency=1}):Play()end if w.subtitle then f.tweenService:Create(w.subtitle,z,{TextTransparency=1}):Play()end if
w.topbarIcon then f.tweenService:Create(w.topbarIcon,z,{ImageTransparency=1}):Play()end for D,E in ipairs(w.
actionContainer:GetChildren())do if E:IsA'Frame'then f.tweenService:Create(E.ImageLabel,z,{ImageTransparency=1}):Play()
end end for D,E in w.tags do E:_setShown(false,z)end for D,E in pairs(w.tabs)do if not E.neglectSelector and E.
topbarItem then E:_applyVisual('hidden',z)end end w:_fadeSelectedElementsOut()f.tweenService:Create(w.main,A,{Size=y,
Position=x}):Play()f.tweenService:Create(w.windowCorner,B,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()
if not w.hidden then return end w.topbar.Visible=false w.elements.Visible=false w.tabList.Visible=false d.
setCollapsedShown(w,true,C)end)task.delay(0.35,function()if not w.hidden then return end w.collapsedInteract.Visible=
true w.animating=false w._revealing=false end)end function h.ToggleHide(w)if w.animating then return end if w.hidden
then w:Show()else w:Hide()end end function h.ToggleMinimise(w)if w.animating or w.hidden then return end if w._searching
then e.close(w,{showTabs=true})end w.animating=true local x,y=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if w.minimised then w.
minimised=false af.assign(w.minimiseAction.iconLabel,'Image',ai.icons.minimise)f.tweenService:Create(w.main,x,{Size=w.
size}):Play()f.tweenService:Create(w.windowShadow,y,{Transparency=0.6}):Play()f.tweenService:Create(w.bottomFade,y,{
BackgroundTransparency=0}):Play()f.tweenService:Create(w.drag.drag,x,{Position=UDim2.new(w.main.Position.X.Scale,w.main.
Position.X.Offset,w.main.Position.Y.Scale,w.main.Position.Y.Offset+w.size.Y.Offset/2+15)}):Play()task.delay(0.2,function
()if w.minimised or w.hidden then return end w.elements.Visible=true w.tabList.Visible=true for z,A in pairs(w.tabs)do
if not A.neglectSelector and A.topbarItem then A.topbarItem.Visible=true A:_applyVisual(if w.selectedTab==A then
'selected'else'unselected',y)end end w:_revealElements(0.035,0.4)end)task.delay(0.5,function()w.animating=false end)else
w.minimised=true af.assign(w.minimiseAction.iconLabel,'Image',ai.icons.maximise)w:_fadeSelectedElementsOut()for z,A in
pairs(w.tabs)do if not A.neglectSelector and A.topbarItem then A:_applyVisual('hidden',y)end end task.delay(0.3,function
()if not w.minimised then return end w.elements.Visible=false w.tabList.Visible=false for z,A in pairs(w.tabs)do if not
A.neglectSelector and A.topbarItem then A.topbarItem.Visible=false end end end)f.tweenService:Create(w.windowShadow,y,{
Transparency=1}):Play()f.tweenService:Create(w.bottomFade,y,{BackgroundTransparency=1}):Play()f.tweenService:Create(w.
main,x,{Size=UDim2.fromOffset(w.size.X.Offset,66)}):Play()f.tweenService:Create(w.drag.drag,x,{Position=UDim2.new(w.main
.Position.X.Scale,w.main.Position.X.Offset,w.main.Position.Y.Scale,w.main.Position.Y.Offset+33+15)}):Play()task.delay(
0.5,function()w.animating=false end)end end function h._syncDragBar(w)local x=w.drag and w.drag.drag if not x then
return end local y,z=w.main.Position,w.size.Y.Offset/2+15 x.Position=UDim2.new(y.X.Scale,y.X.Offset,y.Y.Scale,y.Y.Offset
+z)end function h._clampToScreen(w)if not w.settings or not w.settings.keepOnScreen then return end local x=w.main.
Position if x.X.Scale~=0 or x.Y.Scale~=0 then return end local y,z,A,B=w.screenGui.AbsoluteSize,w.size.X.Offset/2,w.size
.Y.Offset/2,8 local C,D=math.clamp(x.X.Offset,z+B,math.max(z+B,y.X-z-B)),math.clamp(x.Y.Offset,A+B,math.max(A+B,y.Y-A-B)
)if C~=x.X.Offset or D~=x.Y.Offset then w.main.Position=UDim2.fromOffset(C,D)end end function h._applyWindowSize(w)if w.
unloaded then return end local x=o()local y=x~=w.size w.size=x if w.hidden or w.minimised or w.animating or w._revealing
then w._pendingResize=w._pendingResize or y return end if not y and not w._pendingResize then return end w.
_pendingResize=false w.main.Size=x w:_clampToScreen()w:_syncDragBar()end function h._watchViewport(w)local x,y:
RBXScriptConnection?=false local function z()if x then return end x=true task.defer(function()x=false w:
_applyWindowSize()end)end local function A()if y then w:Disconnect(y)y=nil end local B=f.workspace.CurrentCamera if B
then y=w:Connect(B:GetPropertyChangedSignal'ViewportSize',z)end z()end w:Connect(f.workspace:GetPropertyChangedSignal
'CurrentCamera',A)A()local B=0 w:Connect(f.runService.Heartbeat,function(C:number)B+=C if B<n then return end B=0 w:
_applyWindowSize()end)end function h._bindKeybind(w)w:Connect(f.userInputService.InputBegan,function(x,y)if y or w.
_recordingKeybind then return end if x.KeyCode==w.settings.toggleKeybind or x.UserInputType==w.settings.toggleKeybind
then w:ToggleHide()end end)end function h._bindMouseOverride(w)local x=f.userInputService local function y()return w.
settings.mouseOverride and not w.hidden and not w.minimised end local function z()if not y()then return end if x:
IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if x.MouseBehavior~=Enum.MouseBehavior.Default then
x.MouseBehavior=Enum.MouseBehavior.Default end if not x.MouseIconEnabled then x.MouseIconEnabled=true end end w:Connect(
x:GetPropertyChangedSignal'MouseBehavior',z)w:Connect(x:GetPropertyChangedSignal'MouseIconEnabled',z)w:Connect(x.
InputEnded,function(A)if A.UserInputType==Enum.UserInputType.MouseButton2 then z()end end)w._freeMouse=z end function h.
_bindTopbarDrag(w)local x,y,z,A=f.userInputService,false,Vector2.zero,Vector2.zero if w.screenGui and w.screenGui.
IgnoreGuiInset then A=f.guiService:GetGuiInset()end local function B()local C=x:GetMouseLocation()+z+A local D,E=C.X,C.Y
if w.settings and w.settings.keepOnScreen then local F,G,H=w.main.AbsoluteSize,w.screenGui.AbsoluteSize,8 local I,J=F.X/
2,F.Y/2 D=math.clamp(D,I+H,math.max(I+H,G.X-I-H))E=math.clamp(E,J+H,math.max(J+H,G.Y-J-H))end return UDim2.fromOffset(D,
E)end local function C(D,E)for F,G in{w.tabList,w.actionContainer}do local H,I=G.AbsolutePosition,G.AbsoluteSize if D>=H
.X and D<=H.X+I.X and E>=H.Y and E<=H.Y+I.Y then return true end end return false end w:Connect(w.topbar.InputBegan,
function(D,E)if E then return end local F=D.UserInputType.Name if F~='MouseButton1'and F~='Touch'then return end if C(D.
Position.X,D.Position.Y)then return end if not w:_interactive()then return end y=true if w.screenGui and w.screenGui.
IgnoreGuiInset then A=f.guiService:GetGuiInset()end z=w.main.AbsolutePosition+w.main.AbsoluteSize*w.main.AnchorPoint-x:
GetMouseLocation()end)w:Connect(x.InputEnded,function(D)local E=D.UserInputType.Name if E=='MouseButton1'or E=='Touch'
then y=false end end)w:Connect(x.WindowFocusReleased,function()y=false end)w:Connect(f.runService.RenderStepped,function
()if not y then return end if not w:_interactive()then y=false return end w.main.Position=B()if w.drag and w.drag.drag
then local D=w.main.Position w.drag.drag.Position=UDim2.new(D.X.Scale,D.X.Offset,D.Y.Scale,D.Y.Offset+(w.main.Size.Y.
Offset/2+15))end end)end function h._buildSettingsUI(w)w.rfSettings:CreateSection{name='General'}w.rfSettings:
CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=w.settings.toggleKeybind,isMenuToggle=true,onChanged=
function(x)w.settings.toggleKeybind=x w:SaveSettings()end}w.rfSettings:CreateToggle{name='Unlock cursor while open',
description=[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=w.
settings.mouseOverride,callback=function(x)w.settings.mouseOverride=x w:SaveSettings()end}w.rfSettings:CreateToggle{name
='Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=w
.settings.welcomeToast,callback=function(x)w.settings.welcomeToast=x w:SaveSettings()end}w.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=w.settings.haptics,
callback=function(x)w.settings.haptics=x b.setEnabled(x)w:SaveSettings()end}w.rfSettings:CreateSection{name='Window'}w.
rfSettings:CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=w.settings.keepOnScreen,callback=function(
x)w.settings.keepOnScreen=x w:SaveSettings()end}w.rfSettings:CreateButton{name='Reset Window Position',callback=function
()f.tweenService:Create(w.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()f.tweenService:Create(w.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,w.size.Y.Offset/2+15)}):Play()end}if next(w.configuration)~=nil then
w.rfSettings:CreateSection{name='Configurations'}local x,y,z=(w:ListConfigs()[1])local function A()local B=w:
ListConfigs()y:Refresh(B)if x and not table.find(B,x)then x=B[1]end if x then y:Set(x,true)end end y=w.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=w:ListConfigs(),value=x,placeholder=
'No saved configurations',callback=function(B)x=B end}z=w.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local B=w.rfSettings:CreateGroup()B:CreateButton{name='Save',icon=ai.icons.config,callback=function()local C=z.
value if C==''then C=x end if not C or C==''then w:Toast{title=aj.resolve'Name your configuration first'}return end if w
:Save(C)then z:Set''x=C A()w:Toast{title=aj.resolve'Saved configuration',subtitle=C,icon=ai.icons.config}else w:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=C}end end}B:CreateButton{name='Load',callback=function()if not x
or x==''then w:Toast{title=aj.resolve'Pick a configuration to load'}return end if w:_applyNamedConfig(x)then w:Toast{
title=aj.resolve'Loaded configuration',subtitle=x}else w:Toast{title=aj.resolve"Couldn't load configuration",subtitle=x}
end end}B:CreateButton{name='Delete',callback=function()local C=x if not C or C==''then w:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if w:DeleteConfig(C)then A()w:Toast{title=aj.resolve'Deleted configuration',
subtitle=C}else w:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=C}end end}end end function h.
SaveSettings(w)return ah.saveSettings(w)end function h.LoadSettings(w)return ah.loadSettings(w)end function h.
_fadeSelectedElementsOut(w)if w.selectedTab then for x,y in ipairs(w.selectedTab.elements)do y:_setShown(false,true)end
end end function h._revealElements(w,x,y)for z,A in pairs(w.tabs)do if A~=w.selectedTab then for B,C in ipairs(A.
elements)do C:_setShown(true,false)end end end local z=w.selectedTab if not z then return end local A=z.tabPage local B=
A.AbsolutePosition.Y local C,D,E=B+A.AbsoluteWindowSize.Y,math.floor(y/x),0 for F,G in ipairs(z.elements)do local H=G.
main.AbsolutePosition.Y local I=(H+G.main.AbsoluteSize.Y)>B and H<C if I then G:_setShown(true,true)E+=1 if E<=D then
task.wait(x)end else G:_setShown(true,false)end end end function h.Show(w)if w.animating or not w.hidden then return end
w.animating=true w._revealing=true if w.configuration.autoLoad and not w._autoLoaded then w._autoLoaded=true local x,y=
pcall(w.Load,w)if not x then ak.warn('Rayfield: Failed to load configuration - '..tostring(y))end end w.hidden=false w.
minimised=false if w._themeRefreshPending then w._themeRefreshPending=false w:_refreshElementThemes()end w.
collapsedInteract.Visible=false if w._freeMouse then w._freeMouse()end if w.hasShownOnce then w:_quickRestore()else w.
hasShownOnce=true w:_firstShow()end end function h._quickRestore(w)local x,y,z,A=w._restorePosition or UDim2.new(0.5,0,
0.5,0),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.
Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)d.
setCollapsedShown(w,false,TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))f.tweenService:Create(w.
main,y,{Size=w.size,Position=x}):Play()f.tweenService:Create(w.windowCorner,z,{CornerRadius=w.theme.CornerRoundness}):
Play()task.delay(0.22,function()w.topbar.Visible=true w.tabList.Visible=true w.elements.Visible=true f.tweenService:
Create(w.windowShadow,A,{Transparency=0.6}):Play()f.tweenService:Create(w.bottomFade,A,{BackgroundTransparency=0}):Play(
)if w.topbarIcon then f.tweenService:Create(w.topbarIcon,A,{ImageTransparency=0}):Play()end if w.title then f.
tweenService:Create(w.title,A,{TextTransparency=0}):Play()end if w.subtitle then f.tweenService:Create(w.subtitle,A,{
TextTransparency=0.7}):Play()end for B,C in ipairs(w.actionContainer:GetChildren())do if C:IsA'Frame'then f.tweenService
:Create(C.ImageLabel,A,{ImageTransparency=0.6}):Play()end end if w.settingsAction and w.selectedTab==w.rfSettings then f
.tweenService:Create(w.settingsAction.iconLabel,A,{ImageTransparency=0.2}):Play()end for B,C in w.tags do C:_setShown(
true,A)end for B,C in pairs(w.tabs)do if not C.neglectSelector and C.topbarItem then C.topbarItem.Visible=true C:
_applyVisual(if w.selectedTab==C then'selected'else'unselected',A)end end w:_revealElements(0.035,0.4)end)task.delay(
0.22,function()w.drag.drag.Position=UDim2.new(x.X.Scale,x.X.Offset,x.Y.Scale,x.Y.Offset+w.size.Y.Offset/2+15)w.drag.
dragCosmetic.Size=UDim2.fromOffset(0,4)w.drag.dragCosmetic.BackgroundTransparency=1 w.drag.drag.Visible=true f.
tweenService:Create(w.drag.dragCosmetic,y,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()w.animating=false w._revealing=false end)end function h._firstShow(w)w.elements.Visible=true w.
tabList.Visible=true w.drag.drag.Visible=false w.main.Visible=true f.tweenService:Create(w.main,TweenInfo.new(1,Enum.
EasingStyle.Exponential,Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=w.size}):Play()task.wait(0.85)f.
tweenService:Create(w.windowShadow,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Transparency=0.6}):Play()f.tweenService:Create(w.bottomFade,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{BackgroundTransparency=0}):Play()task.wait(0.3)if w.icon then f.tweenService:Create(w.topbarIcon,
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if w.title
then f.tweenService:Create(w.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if w.subtitle then f.tweenService:Create(w.subtitle,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for x,y in ipairs(w.actionContainer:
GetChildren())do if y:IsA'Frame'then task.wait(0.02)f.tweenService:Create(y.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for x,y in w.tags do y:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()for x,y in pairs(w.tabs)do if not y.neglectSelector then y.topbarItem.Visible=true y:_applyVisual(if w.
selectedTab==y then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))y:
_spinGradients()task.wait(0.15)end end end)w:_revealElements(0.03,2)task.wait(1)w.drag.drag.Visible=true f.tweenService:
Create(w.drag.dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
BackgroundTransparency=0.7}):Play()f.tweenService:Create(w.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Size=UDim2.fromOffset(100,4)}):Play()w.animating=false w._revealing=false local x
=f.localPlayer if x and w.settings.welcomeToast and d.isNewUser()then w:Toast{title=x.DisplayName,subtitle=aj.resolve
'Signed in as',subtitleAbove=true,avatar=x.UserId,minWidth=220}end end function h.GetPath(w)return ah.getPath(w)end
function h.Save(w,x)if x~=nil and(type(x)~='string'or x=='')then return false end return ah.save(w,x)end function h.Load
(w,x)if x~=nil and(type(x)~='string'or x=='')then return false end return ah.load(w,x)end function h._applyNamedConfig(w
,x)if not w:Load(x)then return false end w:Save()return true end function h.ListConfigs(w)return ah.list(w)end function
h.DeleteConfig(w,x)return ah.delete(w,x)end function h.Get(w,x)local y=w.controls[x]return y and y.value end function h.
Set(w,x,y)local z=w.controls[x]if not z then return false end z:Set(y)return true end function h._jumpTo(w,x)if x then w
.elementsLayout:JumpTo(x)end end function h.Navigate(w,x)if x==nil then return end local y for z,A in w.tabs do if A==x
or A.name==x or A.tabPage==x then y=A break end end if not y then return end y:Select()end function h.Create(w,x,y,z)
assert(typeof(x)=='string','Invalid argument #1 (string expected)')local A=Instance.new(x)if z and w.theme then for B,C
in z do A[B]=(if typeof(C)=='table'then C[2](w.theme[C[1] ])else w.theme[C])end w.themeProperties[A]=z end if y then for
B,C in y do if aj.isToken(C)then w:_bindLocale(A,B,aj.sourceOf(C))else af.assign(A,B,C)end end end table.insert(w.
instances,A)return A end function h._bindLocale(w,x,y,z)x[y]=aj.resolve(z)local A=w.localeProperties[x]if not A then A={
}w.localeProperties[x]=A end A[y]=z end function h.SetLocale(w,x)aj.setActive(x)for y,z in w.localeProperties do for A,B
in z do y[A]=aj.resolve(B)end end end function h.SetTranslator(w,x)aj.translator=x end function h.RegisterTranslations(w
,x)aj.register(x)w:SetLocale(aj.current)end function h.CreateGlow(w,x,y,z,A)local B={BlurRadius=UDim.new(0,z),
Transparency=A,ZIndex=-1,Parent=x}if typeof(y)=='string'then return w:Create('UIShadow',B,{Color={y,function(C)return if
typeof(C)=='ColorSequence'then C.Keypoints[1].Value else C end}})end B.Color=y return w:Create('UIShadow',B)end function
h._flashResult(w,x,y)local z=x.box if not z then return end local A,B,C,D,E,F=x.glow,x.boxStroke,y and ai.accent.on or w
.theme.ErrorColor,y and ai.accent.onStroke or w.theme.ErrorStrokeColor,TweenInfo.new(0.1,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(z,E,{
BackgroundColor3=C}):Play()if B then f.tweenService:Create(B,E,{Color=D,Transparency=0.4}):Play()end if A then f.
tweenService:Create(A,E,{Color=D,Transparency=0.6}):Play()end x._flashToken=(x._flashToken or 0)+1 local G=x._flashToken
task.delay(0.22,function()if x._flashToken~=G then return end f.tweenService:Create(z,F,{BackgroundColor3=w.theme.
FieldBackground}):Play()if B then f.tweenService:Create(B,F,{Color=w.theme.SurfaceStroke,Transparency=0.85}):Play()end
if A then f.tweenService:Create(A,F,{Color=w.theme.FieldGlow,Transparency=x._glowIdle or 1}):Play()end end)end function
h.CreateHoverOverlay(w,x)local y=w:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1
,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=x})w:Create('UICorner',{Parent=y},{CornerRadius=
'ElementCornerRadius'})return y end function h._wireElementHover(w,x)local y,z=TweenInfo.new(0.25,Enum.EasingStyle.Quint
,Enum.EasingDirection.Out),w.theme w:Connect(x.main.MouseEnter,function()if not w:_interactive()then return end f.
tweenService:Create(x.stroke,y,{Transparency=z.ElementStrokeHoverTransparency,Color=z.ElementStrokeHover}):Play()f.
tweenService:Create(x.title,y,{TextColor3=z.ElementTextHoverColor}):Play()if x.hoverOverlay then f.tweenService:Create(x
.hoverOverlay,y,{BackgroundTransparency=0.97}):Play()end end)w:Connect(x.main.MouseLeave,function()f.tweenService:
Create(x.stroke,y,{Transparency=z.ElementStrokeTransparency,Color=z.ElementStroke}):Play()f.tweenService:Create(x.title,
y,{TextColor3=z.ContentColor}):Play()if x.hoverOverlay then f.tweenService:Create(x.hoverOverlay,y,{
BackgroundTransparency=1}):Play()end end)end function h._runGuarded(w,x,y,...)local z=table.pack(...)task.spawn(function
()local A,B=pcall(function()return y(table.unpack(z,1,z.n))end)if A or x._errored then return end x._errored=true local
C,D=x.flashTarget or x.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(C,D
,{BackgroundColor3=w.theme.ErrorColor}):Play()f.tweenService:Create(x.stroke,D,{Color=w.theme.ErrorStrokeColor}):Play()
if x.title then x.title.Text=aj.resolve'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {
x.__type} component named '{x.name}':`)ak.print(B)task.wait(1)if x.title then x.title.Text=aj.resolve(x.name)end f.
tweenService:Create(C,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.
fromRGB(255,255,255)}):Play()f.tweenService:Create(x.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{Color=w.theme.ElementStroke}):Play()x._errored=false end)end function h.StyleElementBody(w,x)w:
Create('UIGradient',{Rotation=270,Parent=x},{Color='ElementGradient'})w:Create('UICorner',{Parent=x},{CornerRadius=
'ElementCornerRadius'})return w:Create('UIStroke',{Transparency=1,Parent=x},{Color='ElementStroke',Transparency=
'ElementStrokeTransparency'})end function h._buildCompactRow(w,x,y,z)local A=w:Create('Frame',{Name=y,Size=UDim2.
fromOffset(0,m),AutomaticSize=Enum.AutomaticSize.X,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,BackgroundTransparency=1,Parent=x.tabPage},{BackgroundTransparency='ElementTransparency'})local B=w:
StyleElementBody(A)w:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=A})w:Create('UIListLayout',{FillDirection
=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=A})local C=w:Create('TextButton',{Text='',BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,m),BorderSizePixel=0,TextTransparency=1,ZIndex=z or 1,Parent=
A})w:Create('UICorner',{Parent=C},{CornerRadius='ElementCornerRadius'})return A,B,C end function h.StyleElementPanel(w,x
)w:Create('UIGradient',{Rotation=270,Parent=x},{Color='ElementGradient'})w:Create('UICorner',{Parent=x},{CornerRadius=
'ElementCornerRadius'})local y=w:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=x})w:Create(
'UIGradient',{Rotation=270,Parent=y},{Color='ElementStrokeGradient'})return y end function h._reveal(w,x,y,z,A)if not x
then return end if z then f.tweenService:Create(x,A or i,y):Play()else for B,C in y do x[B]=C end end end function h.
_revealCommon(w,x,y)w:_reveal(x.stroke,{Transparency=w.theme.ElementStrokeTransparency},y)w:_reveal(x.title,{
TextTransparency=0},y)w:_reveal(x.main,{BackgroundTransparency=w.theme.ElementTransparency or 0},y)if x.iconLabel then w
:_reveal(x.iconLabel,{ImageTransparency=0},y)end if x.descriptor then w:_reveal(x.descriptor.titleLabel,{
TextTransparency=0.7},y)end end function h._hideCommon(w,x,y)w:_reveal(x.stroke,{Transparency=1},y)w:_reveal(x.title,{
TextTransparency=1},y)w:_reveal(x.main,{BackgroundTransparency=1},y)if x.iconLabel then w:_reveal(x.iconLabel,{
ImageTransparency=1},y)end if x.descriptor then w:_reveal(x.descriptor.titleLabel,{TextTransparency=1},y)end end
function h._collapsedRect(w)local x=j local y=UDim2.new(k.X.Scale,k.X.Offset,k.Y.Scale,k.Y.Offset+x.Y.Offset/2)return y,
x end function h._interactive(w)return not w.animating and not w.hidden end function h._settled(w)return not w.hidden
and not w._revealing end function h.Connect(w,x,y)local z=x:Connect(y)table.insert(w.connections,z)return z end function
h.ConnectFor(w,x,y,z)local A=w:Connect(y,z)x.connections=x.connections or{}table.insert(x.connections,A)return A end
function h.Disconnect(w,x)if not x then return end local y=table.find(w.connections,x)if y then table.remove(w.
connections,y)end x:Disconnect()end function h.DestroySubtree(w,x)if not x then return end local y={[x]=true}for z,A in
x:GetDescendants()do y[A]=true end for z=#w.instances,1,-1 do local A=w.instances[z]if y[A]then table.remove(w.instances
,z)w.themeProperties[A]=nil w.localeProperties[A]=nil end end x:Destroy()end function h.Unload(w)w.unloaded=true b.
teardown()b.releaseContainer(w.screenGui)if w._liveTween then w._liveTween:Cancel()w._liveTween=nil end for x=#w.
connections,1,-1 do w.connections[x]:Disconnect()end for x=#w.instances,1,-1 do w.instances[x]:Destroy()end table.clear(
w.connections)table.clear(w.instances)table.clear(w.themeProperties)table.clear(w.localeProperties)table.clear(w.
controls)table.clear(w.tabs)end return h end)()end,[25]=function()local aa,ab,ac=a(25)local ad return(function(...)
return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,16,32)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(30,22,46)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,28,56))},ShadowColor=Color3.fromRGB(12,6,
22),ElementStroke=Color3.fromRGB(54,42,74),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
32,24,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(36,28,54)),ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,
54))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,58,104)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,72,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,58,104))},
ElementStrokeHover=Color3.fromRGB(84,68,118),TabBackground=ColorSequence.new(Color3.fromRGB(54,42,80),Color3.fromRGB(34,
26,52)),TabStroke=ColorSequence.new(Color3.fromRGB(88,70,128),Color3.fromRGB(54,42,80)),SliderBackground=Color3.fromRGB(
46,36,68),SliderBackgroundHover=Color3.fromRGB(60,48,90),SliderProgress=ColorSequence.new(Color3.fromRGB(170,112,248),
Color3.fromRGB(138,80,224)),AccentColor=Color3.fromRGB(168,110,246),AccentStroke=Color3.fromRGB(200,154,255),
ToggleKnobOff=Color3.fromRGB(224,214,236),StatBackground=Color3.fromRGB(24,18,38),DropdownHighlight=Color3.fromRGB(168,
110,246),NeutralButton=Color3.fromRGB(46,36,68),NeutralButtonHover=Color3.fromRGB(60,48,90),NeutralButtonStroke=Color3.
fromRGB(140,116,190)}end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(12,16,34)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
20,26,50)),ColorSequenceKeypoint.new(1,Color3.fromRGB(28,36,66))},ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=
Color3.fromRGB(44,52,82),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,38,66)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(70,82,124)),ColorSequenceKeypoint.new(1,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.
fromRGB(64,76,116),TabBackground=ColorSequence.new(Color3.fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=
ColorSequence.new(Color3.fromRGB(78,92,140),Color3.fromRGB(48,58,92)),SliderBackground=Color3.fromRGB(40,48,78),
SliderBackgroundHover=Color3.fromRGB(54,64,100),SliderProgress=ColorSequence.new(Color3.fromRGB(64,132,248),Color3.
fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,120,240),AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3
.fromRGB(196,206,232),StatBackground=Color3.fromRGB(20,26,48),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton
=Color3.fromRGB(40,48,78),NeutralButtonHover=Color3.fromRGB(54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}
end)()end,[27]=function()local aa,ab,ac=a(27)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{CornerRoundness=UDim.new(0,20),WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10
)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},
ShadowColor=Color3.fromRGB(20,20,20),ElementStroke=Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,255,255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50)
,Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),
SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.
new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.
fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),
ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,DarkToggleOverlay=true,ElementTransparency=0,
ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(50,50,50),
ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,255,255),TitlingColor=Color3.fromRGB(255,255
,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.fromRGB(23,153,110),AccentStroke=Color3.fromRGB(
32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),SliderHandle=Color3.fromRGB(255,255,255),
PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.
fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=Color3.fromRGB(255,255,255),FieldTransparency=0.9,
FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(178,178,178),SurfaceStroke=Color3.fromRGB(255,255,
255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.fromRGB(54,54,54),NeutralButtonStroke=Color3.
fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=Color3.fromRGB(240,75,75)}end)()end,[28]=
function()local aa,ab,ac=a(28)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(32,27,23)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=Color3.fromRGB(54,46,40),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,76,64)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.fromRGB(84,72,60),TabBackground=
ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=ColorSequence.new(Color3.fromRGB(92,78,66
),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),SliderBackgroundHover=Color3.fromRGB(62,52,44),
SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,
142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3.fromRGB(232,224,214),StatBackground=Color3.fromRGB(
26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.
fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}end)()end,[29]=function()local aa,ab,ac=a(29)local ad
return(function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{WindowColor=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.new(1,Color3.fromRGB(236,241,245))},
ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,ElementStroke=Color3.fromRGB(218,224,
228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),ElementStrokeGradient=ColorSequence.new(Color3.
fromRGB(224,230,234),Color3.fromRGB(232,238,242)),ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(0,176,208),DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=
ColorSequence.new(Color3.fromRGB(0,176,208),Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206
,230),Color3.fromRGB(0,160,196)),SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,
220,224),SliderProgress=ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.
fromRGB(200,206,210),AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,
StatBackground=Color3.fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210)
,ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=
0,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,
210,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[31]=function()local aa,ab,ac=a(31)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number)?,showName:string?,showIcon:(
string|number)?,configuration:WindowConfiguration?,fallbackFont:(Font|Enum.Font)?,locale:string?,translations:
Translations?,translator:Translator?}export type TabProps={name:string?,icon:(string|number)?}export type TagProps={text
:string?,title:string?,icon:(string|number)?,color:Color3?,order:number?}export type SectionProps={name:string?,icon:(
string|number)?}export type GroupProps={direction:string?}export type ButtonProps={name:string?,description:string?,icon
:(string|number)?,callback:(()->())?}export type ToggleProps={name:string?,description:string?,icon:(string|number)?,
flag:string?,value:boolean?,forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={name:string?,
description:string?,icon:(string|number)?,flag:string?,range:{number}?,increment:number?,value:number?,suffix:string?,
minimal:boolean?,forgetState:boolean?,callback:((value:number)->())?}export type DropdownProps={name:string?,description
:string?,icon:(string|number)?,flag:string?,options:{string}?,value:(string|{string})?,multiSelect:boolean?,placeholder:
string?,forgetState:boolean?,callback:((value:any)->())?}export type InputProps={name:string?,description:string?,icon:(
string|number)?,flag:string?,value:string?,placeholder:string?,numeric:boolean?,clearOnFocus:boolean?,forgetState:
boolean?,callback:((value:string)->())?}export type KeybindProps={name:string?,description:string?,icon:(string|number)?
,flag:string?,value:(EnumItem|string)?,forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,
callback:((value:EnumItem|boolean)->())?,onChanged:((key:EnumItem)->())?}export type ColorPickerProps={name:string?,
description:string?,icon:(string|number)?,flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value
:Color3,alpha:number)->())?}export type StatProps={name:string?,description:string?,icon:(string|number)?,prefix:string?
,suffix:string?,value:number?,display:string?,compact:boolean?,changeMode:string?,changeBaseline:string?,numberEasing:
boolean?}export type NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type
ToastProps={title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,
duration:number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}
export type PopupOption={text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:
string?,icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type
Moveable={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),
MoveDown:(self:any)->()}export type Button=Moveable&{}export type Toggle=Moveable&{value:boolean,Set:(self:Toggle,value:
boolean,skipCallback:boolean?)->()}export type Slider=Moveable&{value:number,Set:(self:Slider,value:number,skipCallback:
boolean?)->()}export type Dropdown=Moveable&{value:{string},Set:(self:Dropdown,value:string|{string},skipCallback:
boolean?)->()}export type Input=Moveable&{value:string,Set:(self:Input,value:string,skipCallback:boolean?)->()}export
type Keybind=Moveable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string,skipChanged:boolean?)->()}export type
ColorPicker=Moveable&{value:Color3,alpha:number,Set:(self:ColorPicker,value:Color3|string,skipCallback:boolean?)->(),
SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export type Stat=Moveable&{value:number,Set:(self:
Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export type Section=Moveable&{}export type Tag={Set:(
self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,
icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup={Close:(self:Popup)->()}export type Group=Moveable&{
CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(self:Group,props:ToggleProps)->Toggle,CreateSwitch:(
self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:StatProps)->Stat,CreateSlider:(self:Group,props:
SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->Dropdown,CreateSection:(self:Group,props:
SectionProps)->Section,CreateGroup:(self:Group,props:GroupProps?)->Group}export type Tab={CreateButton:(self:Tab,props:
ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:Tab,props:ToggleProps)->Toggle
,CreateSlider:(self:Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:DropdownProps)->Dropdown,CreateInput:(
self:Tab,props:InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->Keybind,CreateColorPicker:(self:Tab,props
:ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,CreateSection:(self:Tab,props:SectionProps
)->Section,CreateGroup:(self:Tab,props:GroupProps?)->Group}export type Window={unloaded:boolean,CreateTab:(self:Window,
props:TabProps)->Tab,CreateTag:(self:Window,props:TagProps)->Tag,Notify:(self:Window,props:NotifyProps)->(),Toast:(self:
Window,props:ToastProps)->(),Popup:(self:Window,props:PopupProps)->Popup,Show:(self:Window)->(),Hide:(self:Window)->(),
ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(
self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:string)->(),SetTranslator:(self:Window,translator:
Translator?)->(),RegisterTranslations:(self:Window,translations:Translations)->(),Save:(self:Window,name:string?)->
boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:
string)->boolean,Unload:(self:Window)->()}export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->Window}
return{}end)()end,[33]=function()local aa,ab,ac=a(33)local ad return(function(...)local ae,af=ac(ab.Parent.variables),{}
af.enabled=false type HapticTypes={click:Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:HapticTypes,ah,ai
={},pcall(function()Instance.new'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,notify=Enum.
HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.HapticEffectType]:Instance},ak:Instance?={}function af
.setContainer(b:Instance?)ak=b end function af.releaseContainer(b:Instance?)if b==nil or ak==b then ak=nil end end
local function b():Instance if ak and ak.Parent then return ak end return ae.guiContainer end local function c(d:Enum.
HapticEffectType):Instance?local e=aj[d]if e and e.Parent then return e end local f,g=pcall(Instance.new,'HapticEffect')
if not f then return nil end local h=g::any h.Type=d local i=pcall(function()g.Parent=b()end)if not i then g:Destroy()
return nil end aj[d]=g return g end local function d(e:Enum.HapticEffectType?)if not e or not af.enabled then return end
local f=c(e)if f then local g=f::any pcall(g.Play,f)end end function af.click()d(ag.click)end function af.notify()d(ag.
notify)end function af.setEnabled(e:boolean?)af.enabled=e and true or false if not af.enabled then af.teardown()end end
function af.teardown()for e,f in aj do pcall(f.Destroy,f)aj[e]=nil end end return af end)()end,[34]=function()local aa,
ab,ac=a(34)local ad return(function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent.log)export type AssetId=number|
string export type AssetDownloadUrl=string export type CacheKey=AssetId export type ResolvedAsset=AssetId export type
AssetRequestPayload={Url:string,Method:string}local ag={Enum={AssetDownloadUrl={RobloxDownloadUrl=
'https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,RoProxyDownloadUrl=
'https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag ag.__type='assetResolver'type
AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,contentDownloadUrl:AssetDownloadUrl}
export type AssetResolver=AssetResolverState&{resolve:(self:AssetResolver,value:unknown)->ResolvedAsset?,
getAssetContentFromUrl:(self:AssetResolver,url:string,cacheKey:CacheKey?,forced:boolean?)->string?,getAssetContentFromId
:(self:AssetResolver,id:AssetId,forced:boolean?)->string?}local ah=8 function ag.new(ai:boolean?,aj:AssetDownloadUrl?):
AssetResolver local ak:{[CacheKey]:string}?=if ai then{}else nil local b=setmetatable({contentCache=ak,contentCacheOrder
=if ai then{}::{CacheKey}else nil,contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl}::
AssetResolverState,ag)::any return b end function ag.resolve(ai:AssetResolver,aj:unknown):ResolvedAsset?if type(aj)==
'number'then return aj end if type(aj)~='string'then return nil end if string.sub(aj,1,11)=='rbxasset://'or string.sub(
aj,1,11)=='rbxthumb://'then return aj end local ak=tonumber(string.match(aj,'^rbxassetid://(%d+)$'))if ak then return ak
end return nil end local function ai(aj:unknown):boolean if type(aj)~='table'then return false end local ak=aj::{Body:
unknown,StatusCode:unknown,Success:unknown}local b=ak.Body if type(b)~='string'or#b==0 then return false end if type(ak.
StatusCode)=='number'then local c=ak.StatusCode::number return c>=200 and c<300 end if type(ak.Success)=='boolean'then
return ak.Success::boolean end return false end function ag.getAssetContentFromUrl(aj:AssetResolver,ak:string,b:CacheKey
?,c:boolean?):string?local d=aj.contentCache if b~=nil and d and not c then local e=d[b]if e then return e end end local
e=ae.getRequestFn()if not e then af.warn'No request function available to download asset content.'return nil end local f
,g=pcall(e,{Url=ak,Method='GET'}::AssetRequestPayload)local h:string?if f and ai(g)then local i=(g::{Body:string}).Body
h=i if b~=nil and d then local j=aj.contentCacheOrder if j and d[b]==nil then table.insert(j,b)local k=if#j>ah then
table.remove(j,1)else nil if k~=nil then d[k]=nil end end d[b]=i end elseif not c then af.warn(
'Failed to download asset content for url: '..tostring(ak))end return h end function ag.getAssetContentFromId(aj:
AssetResolver,ak:AssetId,b:boolean?):string?local c=aj:resolve(ak)if not c or type(c)~='number'then af.warn(
'Invalid asset id: '..tostring(c))return nil end local d=string.format(aj.contentDownloadUrl,c)return aj:
getAssetContentFromUrl(d,c,b)end return ag end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(...)
local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.5 then
Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af:Color3|ColorSequence):
ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.new(af)end function ae.contrastText(af:
Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,20)else Color3.
fromRGB(255,255,255)end return ae end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae={}
ae.fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out)ae.icons={close=83277910885129,minimise=108115485663409,maximise=88738500661569,settings=
129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=
91452555903853,banner=111263549366178,config=125823673784681,rayfield=80387863064905}ae.accent={on=Color3.fromRGB(23,153
,110),onStroke=Color3.fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),
Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=
ColorSequence.new(Color3.fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75
),Color3.fromRGB(244,67,67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke
=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={bottomFade=100,notification=1500,
drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae.displayOrder={window=99999,banner
=100000,popup=100001}return ae end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function(...)local ae={}
function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return af:FromValue(ag)end)if ah and ai then return ai end
local aj,ak=pcall(function()return af:GetEnumItems()end)if not aj then return nil end for b,c in ak do if c.Value==ag
then return c end end return nil end return ae end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...
)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService':IsStudio()local ah=not ag and typeof(writefile)
=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,aj)end function af.readfile(ai:string):
string return readfile(ai)end function af.appendfile(ai:string,aj:string)appendfile(ai,aj)end function af.isfile(ai:
string):boolean return isfile(ai)end function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{
string}return listfiles(ai)end function af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):
boolean return isfolder(ai)end function af.delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new
'Folder'ai.Name='Filesystem'ai.Parent=ae.getService'ReplicatedStorage'local function aj(ak:string):{string}local b={}for
c in string.gmatch(ak,'[^/]+')do table.insert(b,c)end return b end local function ak(b:{string},c:boolean):Instance?
local d:Instance=ai for e=1,#b-1 do local f=d:FindFirstChild(b[e])if not f then if not c then return nil end local g=
Instance.new'Folder'g.Name=b[e]g.Parent=d f=g end d=f::Instance end return d end local function b(c:Instance?):
StringValue?if c and c:IsA'StringValue'then return c end return nil end function af.writefile(c:string,d:string)local e=
aj(c)assert(#e>0,'Invalid path')local f=ak(e,true)assert(f,'Invalid path')local g=e[#e]local h=f:FindFirstChild(g)local
i=b(h)if i then i.Value=d else if h then h:Destroy()end local j=Instance.new'StringValue'j.Name=g j.Value=d j.Parent=f
end end function af.readfile(c:string):string local d=aj(c)assert(#d>0,'Invalid path')local e=ak(d,false)assert(e,
'File not found: '..c)local f=e:FindFirstChild(d[#d])local g=b(f)assert(g,'File not found: '..c)return g.Value end
function af.appendfile(c:string,d:string)local e=aj(c)assert(#e>0,'Invalid path')local f=ak(e,false)assert(f,
'File not found: '..c)local g=f:FindFirstChild(e[#e])local h=b(g)assert(h,'File not found: '..c)h.Value=h.Value..d end
function af.isfile(c:string):boolean local d=aj(c)if#d==0 then return false end local e=ak(d,false)if not e then return
false end return b(e:FindFirstChild(d[#d]))~=nil end function af.listfiles(c:string):{string}local d,e:Instance=aj(c),ai
for f,g in d do local h=e:FindFirstChild(g)if not h or not h:IsA'Folder'then error('Folder not found: '..c)end e=h end
local f:{string}={}for g,h in e:GetChildren()do table.insert(f,c..'/'..h.Name)end return f end function af.delfile(c:
string)local d=aj(c)assert(#d>0,'Invalid path')local e=ak(d,false)assert(e,'File not found: '..c)local f=e:
FindFirstChild(d[#d])local g=b(f)assert(g,'File not found: '..c)g:Destroy()end function af.makefolder(c:string)local d=
aj(c)if#d==0 then return end local e:Instance=ai for f,g in d do local h=e:FindFirstChild(g)if not h then local i=
Instance.new'Folder'i.Name=g i.Parent=e h=i end e=h::Instance end end function af.isfolder(c:string):boolean local d=aj(
c)if#d==0 then return false end local e:Instance=ai for f,g in d do local h=e:FindFirstChild(g)if not h or not h:IsA
'Folder'then return false end e=h end return true end function af.delfolder(c:string)local d=aj(c)assert(#d>0,
'Invalid path')local e=ak(d,false)assert(e,'Folder not found: '..c)local f=e:FindFirstChild(d[#d])assert(f and f:IsA
'Folder','Folder not found: '..c)f:Destroy()end end function af.ensureFolder(ai:string)if not af.isfolder(ai)then af.
makefolder(ai)end end function af.ensureDir(ai:string)local aj=''for ak in string.gmatch(ai,'[^/]+')do aj=if aj==''then
ak else aj..'/'..ak if not af.isfolder(aj)then af.makefolder(aj)end end end return af end)()end,[39]=function()local aa,
ab,ac=a(39)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),ac(ab.Parent.path),'Rayfield',{}ah.
__index=ah export type FileSystemManager={root:string,assets:string,getPath:(self:FileSystemManager,subpath:string?)->
string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->string,getRootFolder:(self:FileSystemManager)->string
}function ah.new(ai:string?):FileSystemManager local aj=ai or ag local ak=setmetatable({root=aj,assets=aj..'/Assets'},ah
)::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.assets)return ak end function ah.getPath(ai,aj:string?):
string return af.join(ai.root,aj)end function ah.getAssetsFolder(ai,aj:string?):string if aj then local ak=af.join(ai.
assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets end function ah.getRootFolder(ai):string return ai.
root end return ah end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)local ae,af,ag={},
2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#ai do aj=bit32.bxor(aj,string.byte(ai,ak))
local b=aj%65536 local c=(aj-b)/65536 aj=(((c*ag)%65536)*65536+b*ag)%4294967296 end return aj end function ae.
deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:string):string return aj:sub(1,1):upper()..aj:
sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.format('Flag%08x',ah(ai))end return aj end return ae
end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)local ae=ac(ab.Parent.services)local af,ag,ah,
ai,aj,ak=ae.getService'HttpService',ae.getService'RunService',ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab
.Parent.log),ac(ab.Parent.path)local function b(c:unknown):string?local d,e=pcall(function()return af:JSONEncode(c)end)
if d and type(e)=='string'then return e else aj.warn('Failed to encode JSON:',e)return nil end end local function c(d:
string):unknown?local e,f=pcall(function()return af:JSONDecode(d)end)if e then return f else aj.warn(
'Failed to decode JSON:',f)return nil end end local d={}d.__type='fontManager'export type FontFace={name:string,family:
string,weight:number,style:string,assetId:string}export type FontManifest={name:string,faces:{FontFace}}export type
CachedFont={customId:number|string,manifest:FontManifest,loadedFromDisk:boolean,variants:{[string]:Font}}export type
FontCache={[number]:CachedFont}export type FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean
?}type FontManagerState={_debug:boolean,rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:
FontResolverOptions,fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|
string)->Font?,loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,
saveToDisk:boolean?,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type
fontManager=FontManager local function e(f:unknown):FontManifest?local g=f::any if type(g)~='table'or type(g.name)~=
'string'or type(g.faces)~='table'then return nil end g.name=ak.sanitizeFile(g.name)if#g.name==0 or#g.faces==0 then
return nil end for h,i in g.faces do if type(i)~='table'or type(i.name)~='string'or type(i.assetId)~='string'then return
nil end i.name=ak.sanitizeFile(i.name)if#i.name==0 then return nil end end return g::FontManifest end local f={
'\0\1\0\0','OTTO','true','ttcf','wOFF','wOF2'}local function g(h:string):boolean for i,j in f do if string.sub(h,1,#j)==
j then return true end end return false end local h=getfenv()local function i(j:Enum.FontWeight,k:Enum.FontStyle):string
return tostring(j)..'|'..tostring(k)end local function j(k:unknown):number?if type(k)=='number'then return k end if
type(k)=='string'then return tonumber(k)end return nil end function d.__index(k:FontManagerState,l:unknown):unknown
local m=(d::any)[l]if m~=nil then return m end local n=j(l)if not n then return nil end local o=k.fontCache if o then
local p=o[n]if p then local q=i(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local r=p.variants and p.variants[q]if r
then return r end for s,t in pairs(p.variants or{})do return t end end end return nil end function d.new(k:string,l:
boolean?,m:boolean?,n:ai.AssetDownloadUrl?,o:FontResolverOptions?):FontManager local p=o or{saveToDisk=true,skipCache=
not m or false,fallbackFont=Font.fromEnum(Enum.Font.SourceSans)}local q=setmetatable({rootFolder=k,fontCache=if m then{}
::FontCache else nil,assetResolver=ai.new(m,n),defaultOptions=p,_debug=l or ag:IsStudio()or false}::FontManagerState,d)
::any pcall(ah.ensureFolder,k)return q end function d.loadFont(k:FontManager,l:(number|string)?,m:Enum.FontWeight?,n:
Enum.FontStyle?,o:boolean?,p:boolean?):Font?if o==nil then o=k.defaultOptions.saveToDisk end if p==nil then p=k.
defaultOptions.skipCache end local q,r=m or Enum.FontWeight.Regular,n or Enum.FontStyle.Normal local s,t=i(q,r),k.
assetResolver:resolve(l)local u=j(t)if not u then aj.warn('Invalid font id: '..tostring(l))return k.defaultOptions.
fallbackFont end local v=k.fontCache if v and not p then local w=v[u]if w then local x=w.variants and w.variants[s]if x
then if k._debug then aj.print('Loaded font from cache for id: '..tostring(u))end return x end local y,z=pcall(Font.new,
w.customId::any,q,r)if y and z then w.variants=w.variants or{}w.variants[s]=z if k._debug then aj.print(
'Loaded font variant from cache for id: '..tostring(u))end return z else if k._debug then aj.warn(
'Failed to load font from cache for id: '..tostring(u))end v[u]=nil return k.defaultOptions.fallbackFont end end end if
not o then if k._debug then aj.warn[[Font loading without saving to disk can be detected by Anti-cheats.]]end return k.
defaultOptions.fallbackFont end local w=k.rootFolder..'/'..u..'.json'if typeof(ah.isfile)~='function'then return k.
defaultOptions.fallbackFont end local x,y:string?=false if ag:IsStudio()and k._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]y=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(w)then local z,A=pcall(ah.readfile,w)y=z and A or nil else y=k.assetResolver:getAssetContentFromId(u,
false)x=y~=nil end local z:FontManifest?if y then local A,B=pcall(c,y)if A and B then z=e(B)else if k._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(u)..'. Error: '..tostring(B))end end else return k.
defaultOptions.fallbackFont end if not z then if k._debug then aj.warn('Font manifest is nil for font id: '..tostring(u)
)end pcall(ah.delfile,w)return k.defaultOptions.fallbackFont end if x and y then pcall(ah.writefile,w,y)end local A,B=k.
rootFolder..'/'..z.name,true if not pcall(ah.ensureFolder,A)then return k.defaultOptions.fallbackFont end for C,D in
ipairs(z.faces)do local E=A..'/'..D.name:gsub(' ','-')..'.ttf'if not ah.isfile(E)then local F=k.assetResolver:resolve(D.
assetId)local G=if F~=nil then k.assetResolver:getAssetContentFromId(F,false)else nil if not G or not g(G)then B=false
if k._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(u)..', face: '..D.name)end
continue end pcall(ah.writefile,E,G)end local F,G=pcall(h.getcustomasset,E)if F and type(G)=='string'then z.faces[C].
assetId=G if k._debug then aj.print('Loaded font face for id: '..tostring(u)..', face: '..D.name)end else B=false if k.
_debug then aj.warn('Failed to load font face for id: '..tostring(u)..', face: '..D.name)end end end if not B then
return k.defaultOptions.fallbackFont end local C=b(z)if not C or not pcall(ah.writefile,A..'/manifest.json',C)then
return k.defaultOptions.fallbackFont end local D,E=pcall(h.getcustomasset,A..'/manifest.json')if not D or not E then if
k._debug then aj.warn('Failed to load font manifest for id: '..tostring(u))end return k.defaultOptions.fallbackFont end
local F,G=pcall(Font.new,E::any,q,r)if not F or not G then if k._debug then aj.warn('Failed to load font for id: '..
tostring(u))end return k.defaultOptions.fallbackFont end v=k.fontCache if v then v[u]={customId=E,manifest=z,
loadedFromDisk=true,variants={[s]=G}}if k._debug then aj.print('Cached font for id: '..tostring(u))end end return G end
function d.resolve(k:FontManager,l:number|string):Font?local m=j(l)if not m then return nil end local n=k.fontCache if n
then local o=n[m]if o then if k._debug then aj.print('Resolved font for id: '..tostring(m))end for p,q in pairs(o.
variants or{})do return q end end end return nil end function d.getFontFromId(k:FontManager,l:number|string):Font?return
k:resolve(l)end return d end)()end,[42]=function()local aa,ab,ac=a(42)local ad return(function(...)local ae,af,ag,ah={},
ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=af.
textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae.contrastColor=ag.contrastColor ae.toColorSequence=ag.
toColorSequence ae.contrastText=ag.contrastText return ae end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(
function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.variables)type AvatarCallback=ae.AvatarCallback type
PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.rewrites ag.onBlock=nil::((unknown)->())?type
PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:PendingProperties}}local ah,ai:{[string]:
boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(ak:unknown):number?if type(ak)=='number'
then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,'^rbxassetid://(%d+)$'))end return nil end
local function ak(b:unknown):string if ag.onBlock then ag.onBlock(b)end return''end function ag.preload(b:
PreloadCallback?):(boolean,number)ah=false return ae.preload(function(c)ah=true table.clear(ag.pending)if b then b(c)end
end)end function ag.avatar(b:number,c:AvatarCallback?):string if not af.secureMode then return`rbxthumb://type=AvatarHeadShot&id={
b}&w=48&h=48`end return ae.avatar(b,c)end function ag.assign(b:Instance,c:string,d:unknown)local e=b::any if not ai[c]
then e[c]=d return end e[c]=ag.resolve(d)if af.secureMode and not ah then local f=aj(d)if f and not ag.rewrites[f]then
local g=ag.pending[f]if not g then g=setmetatable({},{__mode='k'})::any ag.pending[f]=g end local h=g[b]if not h then h=
{}g[b]=h end h[c]=true end end end ae.onCached=function(b:number)local c=ag.pending[b]if not c then return end local d=
ag.rewrites[b]if d then for e,f in c do if e.Parent then local g=e::any for h in f do g[h]=d end end end end ag.pending[
b]=nil end function ag.resolve(b:unknown):string if b==nil or b==0 or b==''then return''end if type(b)=='string'then if
string.sub(b,1,11)=='rbxasset://'then return b end if string.sub(b,1,11)=='rbxthumb://'then return if af.secureMode then
ak(b)else b end end local c:number?if type(b)=='number'then c=b elseif type(b)=='string'then c=tonumber(string.match(b,
'^rbxassetid://(%d+)$'))end local d=if c then ag.rewrites[c]else nil if d then return d end if af.secureMode then return
ak(b)end if type(b)=='number'then return'rbxassetid://'..b end if type(b)=='string'then return b end return ak(b)end
return ag end)()end,[44]=function()local aa,ab,ac=a(44)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.
filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:string}
export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback export type
AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,
imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,b,c,d,e,f:{[number]:string}={},ag.
fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for g,h
in ah.icons do local i=h::number f[i]=c..tostring(i)..'.png'end local g=0 for h in f do g+=1 end ai.rewrites={}::
RewriteMap ai.onCached=nil::OnCachedCallback?local h='\137PNG\r\n\26\n'local function i(j:string,k:string):string?if
type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(j)then
pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local l=b:getAssetContentFromUrl(k,j,false)if not l or string.sub(l,1,
8)~=h then return nil end if not pcall(ae.writefile,j,l)then return nil end end local l,m=pcall(getfenv().getcustomasset
,j)return if l and type(m)=='string'then m else nil end local function j(k:number):string return af.join(ak,'avatar_'..
tostring(k)..'.png')end local function k(l:string):string?local m,n=pcall(function()return ag.httpService:JSONDecode(l)
end)if not m or type(n)~='table'then return nil end local o=(n::ThumbnailResponse).data if type(o)~='table'then return
nil end local p=o[1]if type(p)~='table'then return nil end local q=p::ThumbnailEntry if q.state=='Completed'and type(q.
imageUrl)=='string'then return q.imageUrl end return nil end local function l(m:number):string?local n:string?for o=1,4
do local p=b:getAssetContentFromUrl(string.format(e,m,d,d),'avatar:'..tostring(m),o>1)if p then local q=k(p)if q then n=
q break end end task.wait(0.3)end if not n then return nil end return i(j(m),n)end function ai.preload(m:PreloadCallback
?):(boolean,number)local n=getfenv()if type(n.getcustomasset)~='function'or typeof(ae.isfile)~='function'then if m then
task.defer(m,g)end return false,g end local o=ai.rewrites table.clear(o)local function p()if not m then return end local
q=0 for r in f do if not o[r]then q+=1 end end m(q)end local q,r,s=0,0,true for t,u in f do local v,w:string?=(af.join(
ak,tostring(t)..'.png'))if ae.isfile(v)then local x,y=pcall(n.getcustomasset,v)w=if x and type(y)=='string'then y else
nil end if w then o[t]=w else r+=1 q+=1 task.spawn(function()local x=i(v,u)if x then o[t]=x if ai.onCached then pcall(ai
.onCached,t)end end q-=1 if q==0 and not s then p()end end)end end s=false if q==0 then p()end return r==0,r end
function ai.avatar(m:unknown,n:AvatarCallback?):string if type(m)~='number'then return''end if typeof(ae.isfile)~=
'function'then return''end local o=j(m)if ae.isfile(o)then local p,q=pcall(getfenv().getcustomasset,o)if p and type(q)==
'string'then return q end end if n then task.spawn(function()local p=l(m)if p then n(p)end end)end return''end return ai
end)()end,[45]=function()local aa,ab,ac=a(45)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.
Parent.log),{}export type LocaleToken={[any]:string}export type Translator=(source:string,localeId:string)->string?
export type TranslationTables={[string]:{[string]:string}}ag.strings={}::TranslationTables ag.current='en'ag.translator=
nil::Translator?local ah={}local function ai(aj:string):string return string.match(aj,'^(%a+)')or aj end function ag.t(
aj:unknown):unknown if type(aj)~='string'or aj==''then return aj end return{[ah]=aj}end function ag.isToken(aj:unknown):
boolean return type(aj)=='table'and type((aj::{[any]:unknown})[ah])=='string'end function ag.sourceOf(aj:LocaleToken):
string return aj[ah]end function ag.resolve(aj:unknown):any if type(aj)~='string'then return aj end if ag.translator
then local ak,b=pcall(ag.translator,aj,ag.current)if ak and type(b)=='string'and b~=''then return b end end local ak=ag.
strings[ag.current]if ak and ak[aj]then return ak[aj]end local b=ag.strings[ai(ag.current)]if b and b[aj]then return b[
aj]end return aj end function ag.register(aj:TranslationTables?)if type(aj)~='table'then return end for ak,b in aj do if
type(ak)=='string'and type(b)=='table'then ak=string.lower(ak)local c=ag.strings[ak]if not c then c={}ag.strings[ak]=c
end for d,e in b do if type(d)=='string'and type(e)=='string'then c[d]=e else af.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`
)end end end end end function ag.setActive(aj:string?):string ag.current=if type(aj)=='string'and aj~=''then string.
lower(aj)else'en'return ag.current end function ag.detect():string local aj=ae.localizationService.RobloxLocaleId if
type(aj)=='string'and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[46]=function()local aa,ab
,ac=a(46)local ad return(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean
local function ag():boolean return ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.
setSecureModeSource(aj:SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate
(aj:SuppressPredicate?)ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then
return true end return ah()end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()
then return end print(...)end return af end)()end,[47]=function()local aa,ab,ac=a(47)local ad return(function(...)
local function ae<T>(af:T):T local ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end function ag.
MoveToTop(ah)ah.tab:_moveElement(ah,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.elements)end
function ag.MoveUp(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end end function ag.
MoveDown(ah)local ai=table.find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return af end return
ae end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(function(...)local ae={}ae.__index=ae export type
RequestFn=(...any)->any function ae.getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or af.
http_request or(af.http and af.http.request)or(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end return
ae end)()end,[49]=function()local aa,ab,ac=a(49)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag
=ae.textService,{}ag.__index=ag local ah=20 local function ai(aj,ak,b)local c=Instance.new'GetTextBoundsParams'c.Text=b
c.Font=aj c.Size=ak c.Width=math.huge local d,e=pcall(af.GetTextBoundsAsync,af,c)return if d then e else Vector2.new(ak*
0.6,ak)end local aj={}local function ak(b,c)local d=tostring(b.Family)..'|'..tostring(b.Weight)..'|'..tostring(b.Style)
..'|'..tostring(c)local e=aj[d]if e then return e end local f,g={},0 for h=0,9 do local i=math.ceil(ai(b,c,tostring(h)).
X)f[h]=i if i>g then g=i end end e={advance=f,maxWidth=g}aj[d]=e return e end function ag.new(b,c,d)d=d or{}local e=
setmetatable({window=b,container=c,textSize=d.textSize or 16,transparency=d.transparency or 1,duration=d.duration or
0.55,slots={},length=0},ag)e.roll=TweenInfo.new(e.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)e.zIndex=math
.max(c.ZIndex+1,6)e.height=math.ceil(e.textSize)local f=ak(b.theme.Font,e.textSize)e.advance=f.advance e.maxWidth=f.
maxWidth b:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.
Center,HorizontalAlignment=d.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
UDim.new(0,0),Parent=c})return e end function ag._reel(b,c)local d=b.slots[c]if d.reel then return d.reel end local e=b.
window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(b.maxWidth,b.height),BackgroundTransparency=1,BorderSizePixel=0
,ClipsDescendants=true,ZIndex=b.zIndex,Parent=b.container})local f=b.window:Create('Frame',{Size=UDim2.fromOffset(b.
maxWidth,b.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,BorderSizePixel
=0,ZIndex=b.zIndex,Parent=e})for g=0,ah-1 do b.window:Create('TextLabel',{Text=tostring(g%10),Position=UDim2.fromOffset(
0,g*b.height),Size=UDim2.fromOffset(b.maxWidth,b.height),BackgroundTransparency=1,BorderSizePixel=0,TextSize=b.textSize,
TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=b.transparency,
ZIndex=b.zIndex,Parent=f},{TextColor3='ContentColor',FontFace='Font'})end local g={cell=e,strip=f,digit=0,target=0,
stripTween=nil,sizeTween=nil}d.reel=g return g end function ag._static(b,c)local d=b.slots[c]if d.static then return d.
static end local e=b.window:Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(0,b.height),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=b.textSize,TextXAlignment=Enum.TextXAlignment.Center
,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=b.transparency,ZIndex=b.zIndex,Parent=b.container},{
TextColor3='ContentColor',FontFace='Font'})d.static=e return e end local function b(c)if c.stripTween then c.stripTween:
Cancel()c.stripTween=nil end if c.sizeTween then c.sizeTween:Cancel()c.sizeTween=nil end end function ag._reelSnap(c,d,e
)b(d)d.cell.Size=UDim2.fromOffset(c.advance[e],c.height)d.strip.Position=UDim2.new(0.5,0,0,-e*c.height)d.digit=e d.
target=e end function ag._reelRoll(c,d,e,f)if d.stripTween or d.sizeTween then c:_reelSnap(d,d.target)end local g=d.
digit if g==e then return end local h,i if f then h=g i=g+(e-g)%10 else h=g+10 i=h-(g-e)%10 end d.strip.Position=UDim2.
new(0.5,0,0,-h*c.height)d.target=e local j,k=ae.tweenService:Create(d.strip,c.roll,{Position=UDim2.new(0.5,0,0,-i*c.
height)}),ae.tweenService:Create(d.cell,c.roll,{Size=UDim2.fromOffset(c.advance[e],c.height)})d.stripTween=j d.sizeTween
=k j.Completed:Connect(function(l)if l==Enum.PlaybackState.Completed and d.stripTween==j then c:_reelSnap(d,e)end end)j:
Play()k:Play()d.digit=e end function ag._putDigit(c,d,e,f,g)local h=c:_reel(d)local i=not h.cell.Visible h.cell.Visible=
true h.cell.LayoutOrder=-d if c.slots[d].static then c.slots[d].static.Visible=false end if g and not i then c:
_reelRoll(h,e,f)else c:_reelSnap(h,e)end end function ag._putStatic(c,d,e)local f=c:_static(d)f.Text=e f.Visible=true f.
LayoutOrder=-d if c.slots[d].reel then c.slots[d].reel.cell.Visible=false end end function ag._hide(c,d)local e=c.slots[
d]if not e then return end if e.reel then e.reel.cell.Visible=false end if e.static then e.static.Visible=false end end
function ag._render(c,d,e,f)d=tostring(d)if d==c._lastText then return end c._lastText=d local g={}for h,i in utf8.
codes(d)do table.insert(g,utf8.char(i))end local h=#g for i=0,math.max(h,c.length)-1 do c.slots[i]=c.slots[i]or{}if i<h
then local j=g[h-i]if j:match'%d'then c:_putDigit(i,tonumber(j),f,e)else c:_putStatic(i,j)end else c:_hide(i)end end c.
length=h end function ag.to(c,d,e)c:_render(d,true,e)end function ag.snap(c,d)c:_render(d,false,true)end function ag.
reveal(c,d,e,f)c.transparency=d for g,h in c.slots do if h.static and h.static.Visible then c.window:_reveal(h.static,{
TextTransparency=d},e,f)end if h.reel then for i,j in h.reel.strip:GetChildren()do if j:IsA'TextLabel'then c.window:
_reveal(j,{TextTransparency=d},e,f)end end end end end return ag end)()end,[50]=function()local aa,ab,ac=a(50)local ad
return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:GuiObject}?}local function ae(af:OrderedElement
,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.main.LayoutOrder=ag+1 end end return ae end)()end,
[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local ae={}function ae.join(af:string,ag:string?):string
if not ag or ag==''then return af end return af..'/'..ag end local function af(ag:string):string local ah repeat ah=ag
ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.sanitizeFolder(ag:unknown):string local ah=tostring(ag):
gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:
unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub('[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:
unknown):string return tostring(ag):match'[^/\\]+$'or tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):
string if ah and ah~=''then local ai=tostring(ag)if ai:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local
ai=tostring(ag):match'^(.+)%.%w+$'return ai or tostring(ag)end return ae end)()end,[52]=function()local aa,ab,ac=a(52)
local ad return(function(...)local ae,af,ag={},ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.
getPath=af.getPath ae.save=af.save ae.load=af.load ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.
getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[
53]=function()local aa,ab,ac=a(53)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.
Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}
type PersistedControl={value:unknown,flag:string?,_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,
_deserialize:((PersistedControl,unknown)->())?,Set:(PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:
PersistedControl},configuration:{fileName:string?,customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[
string]:unknown}?,_loadedConfigPath:string?}function ak.getPath(b:ConfigWindow,c:unknown?):(string,string)return ai.
getConfigPath(b,c)end function ak.save(b:ConfigWindow,c:unknown?):boolean local d,e=ak.getPath(b,c)local f:{[string]:
unknown}={}for g,h in b.controls do local i,j=pcall(function()local i=h._serialize if i then return i(h)end return h.
value end)if i then f[g]=j else ag.warn("Rayfield: Failed to serialize flag '"..tostring(g).."' - "..tostring(j))end end
local g=b._loadedConfig if g and b._loadedConfigPath==e then for h,i in g do if b.controls[h]==nil then f[h]=i end end
end local h,i=pcall(ae.httpService.JSONEncode,ae.httpService,f)if not h then ag.warn(
'Rayfield: Failed to encode configuration - '..tostring(i))return false end local j,k=pcall(function()aj.write(d,e,i)end
)if not j then ag.warn('Rayfield: Failed to save configuration - '..tostring(k))return false end return true end
local function b(c:string):({[string]:unknown}?,string?)if not af.isfile(c)then return nil,nil end local d,e=pcall(af.
readfile,c)if not d or type(e)~='string'then ag.warn'Rayfield: Failed to read configuration file'return nil,nil end
local f,g=pcall(ae.httpService.JSONDecode,ae.httpService,e)if not f or type(g)~='table'then return nil,e end return g::{
[string]:unknown},e end local function c(d:string):string local e=ah.stripExtension(d,'.rfld')local f,g=e..
' (Incorrect Format).rfld',2 while g<=100 and af.isfile(f)do f=e..' (Incorrect Format '..g..').rfld'g+=1 end return f
end function ak.load(d:ConfigWindow,e:unknown?):boolean local f,g=ak.getPath(d,e)if typeof(af.isfile)~='function'then
return false end local h,i=b(g)if not h and af.isfile(g)then local j,k=b(aj.tempPathFor(g))if j and k then h=j pcall(aj.
write,f,g,k)end end if not h then if i then ag.warn
[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local j=c(g)pcall(function()af.
ensureDir(f)af.writefile(j,i)af.delfile(g)end)end return false end local j,k=h::{[string]:unknown},d._loading d._loading
=true local l,m=pcall(function()for l,m in d.controls do ak.applyTo(m,j[l])end end)d._loading=k if not l then ag.warn(
'Rayfield: Failed to apply configuration - '..tostring(m))end d._loadedConfig=j d._loadedConfigPath=g return true end
function ak.applyTo(d:PersistedControl,e:unknown)if e==nil and not d._canBeNil then return end local f,g=pcall(function(
)local f=d._deserialize if f then f(d,e)else d:Set(e)end end)if not f then ag.warn("Rayfield: Failed to restore flag '"
..tostring(d.flag).."' - "..tostring(g))end end function ak.list(d:ConfigWindow):{string}local e,f:{string}=ak.getPath(d
),{}local g,h=pcall(af.listfiles,e)if not g or type(h)~='table'then return f end for i,j in h do local k=ah.basename(j)
if k:sub(-5)=='.rfld'then local l=ah.stripExtension(k,'.rfld')if l and l~=''and not l:find' %(Incorrect Format[^%)]*%)$'
then table.insert(f,l)end end end table.sort(f)return f end function ak.delete(d:ConfigWindow,e:unknown):boolean if
type(e)~='string'or e==''then return false end local f,g=ak.getPath(d,e)if typeof(af.isfile)~='function'or not af.
isfile(g)then return false end pcall(af.delfile,aj.tempPathFor(g))return(pcall(af.delfile,g))end return ak end)()end,[54
]=function()local aa,ab,ac=a(54)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.path),{
}type ConfigWindow={configuration:{fileName:string?,customFolder:string?},name:string}function ag.getConfigPath(ah:
ConfigWindow,ai:unknown?):(string,string)local aj=ae.fileSystemManager:getPath'Configurations'if ah.configuration.
customFolder then aj=af.join(aj,af.sanitizeFolder(ah.configuration.customFolder))end local ak=ai or ah.configuration.
fileName or ah.name local b=af.sanitizeFile(ak)if b==''then b=af.sanitizeFile(ah.name)end if b==''then b='Configuration'
end return aj,af.join(aj,b..'.rfld')end function ag.getSettingsPath():(string,string)local ah=ae.fileSystemManager:
getPath'Settings'return ah,af.join(ah,'rayfield.rfld')end return ag end)()end,[55]=function()local aa,ab,ac=a(55)local
ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.
persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.enums),{}type SettingsWindow={settings:{toggleKeybind:
EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:boolean,haptics:boolean}}type DecodedSettings={
toggleKeybind:{[number]:unknown}?,mouseOverride:unknown?,keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?}
function aj.getSettingsPath():(string,string)return ag.getSettingsPath()end function aj.saveSettings(ak:SettingsWindow):
boolean local b,c=aj.getSettingsPath()local d:{[string]:unknown}={toggleKeybind={tostring(ak.settings.toggleKeybind.
EnumType),ak.settings.toggleKeybind.Value}::{unknown},mouseOverride=ak.settings.mouseOverride,keepOnScreen=ak.settings.
keepOnScreen,welcomeToast=ak.settings.welcomeToast,haptics=ak.settings.haptics}local e,f=pcall(ae.httpService.JSONEncode
,ae.httpService,d)if not e then return false end local g=pcall(ah.write,b,c,f)if not g then return false end return true
end local function ak(b:string):(DecodedSettings?,string?)local c=false pcall(function()c=af.isfile(b)end)if not c then
return nil,nil end local d,e=pcall(af.readfile,b)if not d or type(e)~='string'then return nil,nil end local f,g=pcall(ae
.httpService.JSONDecode,ae.httpService,e)if not f or type(g)~='table'then return nil,e end return g::DecodedSettings,e
end function aj.loadSettings(b:SettingsWindow):boolean local c,d=aj.getSettingsPath()local e=ak(d)if not e then local f,
g=ak(ah.tempPathFor(d))if f and g then e=f pcall(ah.write,c,d,g)end end if not e then return false end if e.
toggleKeybind then pcall(function()local f=tostring(e.toggleKeybind[1]):gsub('^Enum%.','')local g=(Enum::any)[f]if g
then local h=ai.itemFromValue(g,e.toggleKeybind[2])if h then b.settings.toggleKeybind=h end end end)end if type(e.
mouseOverride)=='boolean'then b.settings.mouseOverride=e.mouseOverride end if type(e.keepOnScreen)=='boolean'then b.
settings.keepOnScreen=e.keepOnScreen end if type(e.welcomeToast)=='boolean'then b.settings.welcomeToast=e.welcomeToast
end if type(e.haptics)=='boolean'then b.settings.haptics=e.haptics end return true end return aj end)()end,[56]=function
()local aa,ab,ac=a(56)local ad return(function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function af.
tempPathFor(ah:string):string return ah..ag end function af.write(ah:string,ai:string,aj:string)local ak=af.tempPathFor(
ai)ae.ensureDir(ah)ae.writefile(ak,aj)if ae.readfile(ak)~=aj then error'parked copy did not write cleanly'end ae.
writefile(ai,aj)pcall(ae.delfile,ak)end return af end)()end,[57]=function()local aa,ab,ac=a(57)local ad return(function(
...)local ae=ac(ab.Parent.services)export type RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:Workspace,
runService:RunService,userInputService:UserInputService,guiService:GuiService,localPlayer:Player?,tweenService:
TweenService,httpService:HttpService,textService:TextService,replicatedStorage:ReplicatedStorage,localizationService:
LocalizationService,guiContainer:Instance}local af={}::RuntimeState af.secureMode=(function()if typeof(getgenv)~=
'function'then return false end local ag,ah=pcall(function()return getgenv().RAYFIELD_SECURE end)return ag and ah==true
end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.workspace=ae.getService'Workspace'::Workspace af.runService=ae.
getService'RunService'::RunService af.userInputService=ae.getService'UserInputService'::UserInputService af.guiService=
ae.getService'GuiService'::GuiService af.localPlayer=(ae.getService'Players'::Players).LocalPlayer af.tweenService=ae.
getService'TweenService'::TweenService af.httpService=ae.getService'HttpService'::HttpService af.textService=ae.
getService'TextService'::TextService af.replicatedStorage=ae.getService'ReplicatedStorage'::ReplicatedStorage af.
localizationService=ae.getService'LocalizationService'::LocalizationService af.guiContainer=(function():Instance if af.
runService:IsStudio()then return(af.localPlayer::Player).PlayerGui end if typeof(gethui)=='function'then local ag,ah=
pcall(gethui)if ag and ah then return ah end end return af.coreGui end)()return af end)()end,[58]=function()local aa,ab,
ac=a(58)local ad return(function(...)local ae={}function ae.getService(af)local ag=game:GetService(af)return if cloneref
then cloneref(ag)else ag end return ae end)()end,[59]=function()local aa,ab,ac=a(59)local ad return(function(...)local
ae=ac(ab.Parent.variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{},{},0,1024 local function ak(b:
GetTextBoundsParams):unknown local c,d=pcall(function()return af:GetTextBoundsAsync(b)end)return if c then d else nil
end local function b(c:unknown,d:'X'|'Y'):number?if typeof(c)=='Vector2'then return if d=='X'then c.X else c.Y end if
type(c)=='table'and type((c::any)[d])=='number'then return(c::any)[d]end return nil end function ag.textWidth(c:Font,d:
number,e:any):number e=tostring(e)local f=tostring(c.Family)..'|'..tostring(c.Weight)..'|'..tostring(c.Style)..'|'..
tostring(d)..'|'..e local g=ah[f]if g then return g end local h=Instance.new'GetTextBoundsParams'h.Text=e h.Font=c h.
Size=d h.Width=math.huge local i=b(ak(h),'X')if not i then local j=utf8.len(e)or#e return math.ceil(d*0.55*j)end local j
=math.ceil(i)if ai>=aj then ah={}ai=0 end ah[f]=j ai+=1 return j end function ag.textHeight(c:Font,d:number,e:any,f:
number):number local g=Instance.new'GetTextBoundsParams'g.Text=tostring(e)g.Font=c g.Size=d g.Width=f local h=b(ak(g),
'Y')return if h then math.ceil(h)else d end return ag end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(
function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.constants),ac(ab.Parent.log),ac(ab.Parent.
filesystemManager),ac(ab.Parent.assetResolver),ac(ab.Parent.fontManager)type RuntimeState=ae.RuntimeState type
FileSystemManager=ah.FileSystemManager type AssetResolver=ai.AssetResolver type FontManager=aj.FontManager export type
VariablesState=RuntimeState&{fallbackFont:Font,fileSystemManager:FileSystemManager,assetResolver:AssetResolver,
fontManager:FontManager,setFallbackFont:(font:Enum.Font|Font)->(),brandFont:(weight:Enum.FontWeight?)->Font}local ak=
table.clone(ae)::VariablesState ag.setSecureModeSource(function()return ak.secureMode end)ak.fallbackFont=Font.fromEnum(
Enum.Font.BuilderSans)ak.fileSystemManager=ah.new()ak.assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.
RoProxyDownloadUrl)::AssetResolver ak.fontManager=aj.new(ak.fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.
AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,skipCache=false,fallbackFont=ak.fallbackFont})::FontManager
function ak.setFallbackFont(b:Enum.Font|Font)if typeof(b)=='EnumItem'then b=Font.fromEnum(b)end if typeof(b)=='Font'then
ak.fallbackFont=b ak.fontManager.defaultOptions.fallbackFont=b end end function ak.brandFont(b:Enum.FontWeight?):Font if
ak.secureMode then return Font.new(ak.fallbackFont.Family,b)end return Font.new(af.fontAsset,b)end return ak end)()end,[
61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae,af,ag,ah,ai,aj,ak,b,c,d={},Vector2.new(475,500),
Vector2.new(300,285),0.86,0.7,24,28,80,1.95,200 ae.defaultSize=af ae.minSize=ag local function e(f:number):number return
math.clamp((af.Y-f)/(af.Y-ag.Y),0,1)end function ae.fit(f:Vector2?):UDim2 if not f or f.X<d or f.Y<d then return UDim2.
fromOffset(af.X,af.Y)end local g,h=math.min(f.X*ah,f.X-aj),math.min(f.Y*ai,f.Y-ak)local i=math.floor(math.min(math.
clamp(h,ag.Y,af.Y),h))local j=e(i)local k=math.max(af.X+b*j,ag.X)return UDim2.fromOffset(math.floor(math.min(k,g,i*c)),i
)end return ae end)()end},{{1,2,{'Rayfield'},{{24,1,{'themes'},{{27,2,{'default'}},{25,2,{'amethyst'}},{29,2,{'frost'}},
{28,2,{'ember'}},{26,2,{'cobalt'}},{30,2,{'rose'}}}},{32,1,{'utility'},{{44,2,{'imageCache'}},{45,2,{'locale'}},{38,2,{
'filesystem'}},{47,2,{'moveable'}},{56,2,{'persistenceWrite'}},{61,2,{'windowSizing'}},{51,2,{'path'}},{46,2,{'log'}},{
41,2,{'fontManager'}},{42,2,{'functions'}},{37,2,{'enums'}},{55,2,{'persistenceSettings'}},{58,2,{'services'}},{34,2,{
'assetResolver'}},{36,2,{'constants'}},{43,2,{'image'}},{39,2,{'filesystemManager'}},{59,2,{'textMetrics'}},{33,2,{
'HapticEngine'}},{49,2,{'odometer'}},{54,2,{'persistencePaths'}},{53,2,{'persistenceConfig'}},{60,2,{'variables'}},{52,2
,{'persistence'}},{50,2,{'ordering'}},{57,2,{'runtime'}},{35,2,{'colors'}},{48,2,{'network'}},{40,2,{'flagNames'}}}},{31
,2,{'types'}},{2,1,{'components'},{{5,2,{'chrome'}},{17,2,{'slider'}},{3,2,{'action'}},{7,2,{'descriptor'}},{10,2,{
'group'}},{8,2,{'drag'}},{13,2,{'notification'}},{6,2,{'colorpicker'}},{23,2,{'window'}},{4,2,{'button'}},{22,2,{
'toggle'}},{21,2,{'toast'}},{15,2,{'search'}},{14,2,{'popup'}},{20,2,{'tag'}},{19,2,{'tab'}},{9,2,{'dropdown'}},{18,2,{
'stat'}},{11,2,{'input'}},{16,2,{'section'}},{12,2,{'keybind'}}}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error
,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local k,l,m,n,o,p,q=aj.insert,aj.
remove,aj.freeze or function(k)return k end,b.wrap,ae.sub,ae.match,ae.gmatch if i and o(i,1,4)=='Lune'then local r,s=f(e
,'@lune/task')if r and s then af=s end end local r=af and af.defer local s,t,u,v,w,x,y,z,A=r or function(s,...)n(s)(...)
end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local B,C={
GetFullName={{},function(B)local C,D=B.Name,B.Parent while D do C=D.Name..'.'..C D=D.Parent end return C end},
GetChildren={{},function(B)local C={}for D in ai,A[B]do k(C,D)end return C end},GetDescendants={{},function(B)local C={}
for D in ai,A[B]do k(C,D)for E,F in ai,D:GetDescendants()do k(C,F)end end return C end},FindFirstChild={{'string',
'boolean?'},function(B,C,D)local E=A[B]for F in ai,E do if F.Name==C then return F end end if D then for F in ai,E do
return F:FindFirstChild(C,true)end end end},FindFirstAncestor={{'string'},function(B,C)local D=B.Parent while D do if D.
Name==C then return D end D=D.Parent end end},WaitForChild={{'string','number?'},function(B,C)return B:FindFirstChild(C)
end}},{}for D,E in ai,B do local F,G,H=E[1],E[2],{}for I,J in ai,F do local K,L=p(J,'^([^%?]+)(%??)')H[I]={K,L}end C[D]=
function(I,...)if not A[I]then ah("Expected ':' not '.' calling member function "..D,2)end local J={...}for K,L in ai,H
do local M=J[K]local N,O,P=d(M),L[1],L[2]if M==nil and not P then ah('Argument '..M..' missing or nil',3)end if O~='any'
and N~=O and not(N=='nil'and P)then ah('Argument '..K..' expects type "'..O..'", got "'..N..'"',2)end end return G(I,...
)end end local function D(E,F,G)local H,I=(ag({},{__mode='k'}))local function J(K)ah(K..
' is not a valid (virtual) member of '..E..' "'..F..'"',3)end local function K(L)ah(
'Unable to assign (virtual) property '..L..'. Property is read only',3)end local L,M={},{}M.__metatable=false M.__index=
function(N,O)if O=='ClassName'then return E elseif O=='Name'then return F elseif O=='Parent'then return G elseif E==
'StringValue'and O=='Value'then return I else local P=C[O]if P then return P end end for P in ai,H do if P.Name==O then
return P end end J(O)end M.__newindex=function(N,O,P)if O=='ClassName'then K(O)elseif O=='Name'then F=P elseif O==
'Parent'then if P==L then return end if G~=nil then A[G][L]=nil end G=P if P~=nil then A[P][L]=true end elseif E==
'StringValue'and O=='Value'then I=P else J(O)end end M.__tostring=function()return F end ag(L,M)A[L]=H if G~=nil then A[
G][L]=true end return L end local function E(F,G)local H,I,J,K=F[1],F[2],F[3],F[4]local L=t[I]local M=J and l(J,1)or L
local N=D(L,M,G)u[H]=N if J then for O,P in ai,J do N[O]=P end end if K then for O,P in ai,K do E(P,N)end end return N
end local F=D('Folder','['..ad..']')for G,H in ai,ab do E(H,F)end for G,H in ai,aa do local I=u[G]v[I]=H w[I]=G local J=
I.ClassName if J=='LocalScript'or J=='Script'then k(y,I)end end local function G(H)local I,J=H.ClassName,x[H]if J and I
=='ModuleScript'then return ak(J)end local K=v[H]local function L(M)M=g(M)local N,O,P=H:GetFullName(),p(M,
'[^:]+:(%d+): (.+)')if not O or not j then return N..':*: '..(P or M)end O=h(O)local Q=w[H]local R=j[Q]local S=O-R+1 if
S<0 then S='?'end return N..':'..S..': '..P end if I=='LocalScript'or I=='Script'then local M,N=f(K)if not M then ah(L(N
),0)end else local M={f(K)}local N=l(M,1)if not N then local O=l(M,1)ah(L(O),0)end x[H]=M return ak(M)end end function a
(H)local I=u[H]local function J(K,...)local L={f(K,...)}local M=l(L,1)if not M then ah(L[1],3)end return ak(L)end local
K=m(ag({},{__index=z,__newindex=function(K,L,M)z[L]=M end,__len=function()return#z end,__iter=function()return ai,z end}
))local L,M=m{version=ac,envname=ad,shared=K,script=c,require=e},I local function N(O,...)local P,Q,R=d(O),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if P=='table'and A[O]then if O.
ClassName~='ModuleScript'then ah(Q,2)elseif O==I then ah(R,2)end return G(O)elseif P=='string'and o(O,1,1)~='@'then if#O
==0 then ah('Attempted to call require with empty string',2)end local S=I if o(O,1,1)=='/'then S=F elseif o(O,1,2)=='./'
then O=o(O,3)end local T for U in q(O,'([^/]*)/?')do local V=U if U=='..'then V='Parent'end if V~=''then local W=S:
FindFirstChild(V)if not W then local X=S.Parent if X then W=X:FindFirstChild(V)end end if W then S=W elseif U~=T and U~=
'init'and U~='init.server'and U~='init.client'then ah('Virtual script path "'..O..'" not found',2)end end T=U end if S.
ClassName~='ModuleScript'then ah(Q,2)elseif S==I then ah(R,2)end return G(S)end return J(e,O,...)end return L,M,N end
for H,I in ai,y do s(G,I)end return G(F:GetChildren()[1])
