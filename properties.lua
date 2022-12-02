--table.insert(ArrayOptions,"Other")

props={
  {Name="Category Count",Type="integer",Min=1,Max=4,Value=4},
  {Name="Sources Per Page",Type="enum",Choices={"5","10"},Value="10"},
  {Name="Debug Print",Type="enum",Choices={"None","Tx/Rx","Tx","Rx","Function Calls","All"},Value="None"},
}
