local function BuildPageNames()
  pagenames={"Setup"}
  table.insert(pagenames,"Lights")
  table.insert(pagenames,"Switches")
  return pagenames
end


for ix,name in ipairs( BuildPageNames()) do
  table.insert(pages, {name = pagenames[ix]})
end