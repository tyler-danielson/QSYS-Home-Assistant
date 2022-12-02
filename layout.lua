layout   = {}
graphics = {}
-- Position Function

-- Page Names Function
PageNames={"Setup"}
table.insert(PageNames,"Lights")


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

--*********************
--* Activu Logo *
--*********************
--local activuLogo = "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"
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
  -- Groupbox

  -- Text
  table.insert(graphics,{Type="Text",Text="Home Assistant URL:",Position={5,5},Size={185,16},FontSize=11})
  table.insert(graphics,{Type="Text",Text="HA API Key:",Position={5,50},Size={185,16},FontSize=11})

else if CurrentPage =="Lights"then
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
      Choices = {"light.office","light.hue_play_1","light.hue_play_2","light.hue_play_3"},
      Position = {75,posY},
      Size = {200,20},
      Font = "Roboto",
      --TextColor = Colors.Yellow
    }
    posY = posY + 25
  end
end
end