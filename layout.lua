layout   = {}
graphics = {}
-- Position Function

-- Page Names Function
PageNames={"Setup"}
table.insert(PageNames,"Lights")
table.insert(PageNames,"Switches")


-- Color Lookup Table
local Colors = {
  White = {255, 255, 255},
  Black = {0, 0, 0},
  Red = {255, 0, 0},
  Green = {0, 255, 0},
  Yellow = {239,156,0},
  DarkGrey = {105,105,105}
}


CurrentArray = {}


-- Local Variables
--local CurrentPage=BuildPageNames()[props["page_index"].Value]
local CurrentPage = PageNames[props["page_index"].Value]

if CurrentPage=="Setup" then
  -- Version Number
  table.insert(graphics,{Type="Label",Text=string.format("Version %s",PluginInfo.Version),FontSize=9,Position={204,334},Size={76,12},HTextAlign="Right"})
  -- Logo
 -- table.insert(graphics,{Type="Image",Image=activuLogo,Position={4,4},Size={185,60}})
  -- Controls
  layout["URL"]={PrettyName="HA URL",Style="Text",Position={5,25},Size={185,16}}
  layout["API_KEY"]={PrettyName="HA API Key",Style="Text",Position={5,70},Size={185,16}}
  layout["GetServices"] = {Type= "Button",Legend="RELOAD",Position={5,100},Size={50,16}}
  -- Groupbox

  -- Text
  table.insert(graphics,{Type="Text",Text="Home Assistant URL:",Position={5,5},Size={185,16},FontSize=11})
  table.insert(graphics,{Type="Text",Text="HA API Key:",Position={5,50},Size={185,16},FontSize=11})

elseif CurrentPage =="Lights"then
  table.insert(graphics,{Type="Label",Text=string.format("Version %s",PluginInfo.Version),FontSize=9,Position={204,334},Size={76,12},HTextAlign="Right"})
  local posY = 20
  for i = 1,10 do
    layout["light "..i] = {
      Type = "Button",
      PrettyName = "Lights~Buttons~Light "..i,
      --Legend = "LAYOUT "..i,
      Fill = {105,105,105},
      StrokeWidth = 1,
      CornerRadius = 2,
      --StrokeColor = Colors.Blue,
      Position = {5,posY},
      Size = {50,20},
      Font = "Roboto",
      --TextColor = Colors.Yellow
    }
    layout["light_id "..i] = {
      Type = "Text",
      Style = "ComboBox",
      PrettyName = "Lights~IDs~Light ID "..i,
      --Legend = "LAYOUT "..i,
      Fill = {105,105,105},
      StrokeWidth = 1,
      CornerRadius = 2,
      Position = {75,posY},
      Size = {200,20},
      Font = "Roboto",
      --TextColor = Colors.Yellow
    }
    posY = posY + 25
  end
elseif CurrentPage =="Switches"then
  table.insert(graphics,{Type="Label",Text=string.format("Version %s",PluginInfo.Version),FontSize=9,Position={204,334},Size={76,12},HTextAlign="Right"})
  local posY = 20
  for i = 1,10 do
    layout["switch "..i] = {
      Type = "Button",
      PrettyName = "Switches~Buttons~Light "..i,
      --Legend = "LAYOUT "..i,
      Fill = {105,105,105},
      StrokeWidth = 1,
      CornerRadius = 2,
      --StrokeColor = Colors.Blue,
      Position = {5,posY},
      Size = {50,20},
      Font = "Roboto",
      --TextColor = Colors.Yellow
    }
    layout["switch_id "..i] = {
      Type = "Text",
      Style = "ComboBox",
      PrettyName = "Switches~IDs~Light ID "..i,
      --Legend = "LAYOUT "..i,
      Fill = {105,105,105},
      StrokeWidth = 1,
      CornerRadius = 2,
      Position = {75,posY},
      Size = {200,20},
      Font = "Roboto",
      --TextColor = Colors.Yellow
    }
    posY = posY + 25
  end
end
