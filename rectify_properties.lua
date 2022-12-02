if props.plugin_show_debug.Value == false then 
  props["Debug Print"].IsHidden = true 
end

--props['3x1'..' Template Btn '..1].IsHidden = true

--props['Template 1'].IsHidden = props['Array Config'].Value ~= "3x1"
--props['Template 1'].Value = props['Array Config'].Value

--table.insert(props,#props,{Name="Template 1",Type="enum",Choices=TemplateOptions,Value="2x1"})