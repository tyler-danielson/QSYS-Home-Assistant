local catCount = 5--props["Category Count"].Value
local sourceCount=catCount*10
local templateCount = 10

ctrls={
  {Name="RefreshWalls",ControlType="Button",ButtonType="Trigger",Count=1,UserPin=true,PinStyle="Input"},
  {Name="SourceDefinition",ControlType="Text",TextBoxType="ComboBox",Count=sourceCount,UserPin=true,PinStyle="Both"},
  {Name="templateSelectIndex",ControlType="Knob",ControlUnit="Integer",Min=1,Max=templateCount,UserPin=false},
  {Name="light_id",ControlType="Text",Count=10,UserPin=true,PinStyle="Both"},
  {Name="light",ControlType="Button",ButtonType="Toggle",Count=10,UserPin=true,PinStyle="Both"},
  {Name="URL",ControlType="Text",Count=1,UserPin=true,PinStyle="Both"},
  {Name="API_KEY",ControlType="Text",Count=1,UserPin=true,PinStyle="Both"},
}
