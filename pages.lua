local function BuildPageNames()
  pagenames={"Setup"}
  table.insert(pagenames,"Lights")
  return pagenames
end


for ix,name in ipairs( BuildPageNames()) do
  table.insert(pages, {name = pagenames[ix]})
end