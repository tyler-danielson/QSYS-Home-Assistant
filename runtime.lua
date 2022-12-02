URL = Controls.URL
API_KEY = Controls.API_KEY
LIGHT = Controls.light
LIGHT_ID = Controls.light_id
tick = 0
TIMER = Timer.New()

function done(tbl, code, d, e)
  --print( string.format("Response Code: %i\t\tErrors: %s\rData: %s",code, e or "None", d))
end

function StateUpdate(tbl, code, d, e)
  local data = qsc_json.decode(d)
  populateOptions(data)
  for k,o in ipairs(data) do
    print(k,o)
    for key,object in ipairs(LIGHT) do
      local control = LIGHT_ID[key]
      if o.entity_id == control.String and control.String ~= nil then
        if o.attributes.rgb_color ~= nil then
          local color = o.attributes.rgb_color
          object.Color = RGBtoHex(color)
        else
          object.Color = ""
        end
        if o.state == "on" then object.Boolean = true else object.Boolean = false end
      end
    end
  end
end


function populateOptions(data)
  lightTable = {}
  for key,object in ipairs(data) do
    print(key,object)
    if string.sub(object.entity_id, 1, 6) == "light." then
      table.insert(lightTable,object.entity_id)
    end
  end
  for key,object in ipairs(LIGHT_ID) do
    object.Choices = lightTable
  end
end

function Upload(id,setState)
  ACCESS_TOKEN = API_KEY.String
  HttpClient.Upload {
    Url = "http://"..URL.String..":8123/api/services/light/"..setState,
    Method = "POST", -- Can be either POST, PUT, or PATCH. For PATCH, set Custom here, then define below
    Data = '{"entity_id":"'..id..'"}', -- This can be anything
    Auth = "basic",
    Headers = {
      ["Authorization"] = "Bearer "..ACCESS_TOKEN,
      ["Content-Type"] = "application/json"
    },
    EventHandler = done --(done) The function to call upon response
  }
  Timer.CallAfter(GetStates, 0.5)
end

function GetStates()
  ACCESS_TOKEN = API_KEY.String
  HttpClient.Download { 
    Url = "http://"..URL.String..":8123/api/states",
    Timeout = 30,
    Auth = "basic",
    Headers = {
      ["Authorization"] = "Bearer "..ACCESS_TOKEN,
      ["Content-Type"] = "application/json"
    },
    EventHandler = StateUpdate
  }
  tick = 0
end

function updateStates()
  tick = tick + 1
  if tick > 15 then 
    GetStates()
  end
end


for key,object in ipairs(LIGHT) do
  object.EventHandler = function()

    local setState = "turn_off"
    if object.Boolean then setState = "turn_on" end
    Upload(LIGHT_ID[key].String,setState)
  end
end

function RGBtoHex(rgb)
  local hexadecimal = '#'
	for key, value in pairs(rgb) do
		local hex = ''
		while(value > 0)do
			local index = math.fmod(value, 16) + 1
			value = math.floor(value / 16)
			hex = string.sub('0123456789ABCDEF', index, index) .. hex			
		end
		if(string.len(hex) == 0)then
			hex = '00'
		elseif(string.len(hex) == 1)then
			hex = '0' .. hex
		end
		hexadecimal = hexadecimal .. hex
	end
  --print(hexadecimal)
	return hexadecimal
end

TIMER.EventHandler = updateStates
TIMER:Start(1)