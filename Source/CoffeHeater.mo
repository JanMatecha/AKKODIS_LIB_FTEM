within Hackaton2024.Source;
model CoffeHeater
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor HeatSourceShell(C = 10.3, T(fixed = true)) annotation(
    Placement(transformation(origin = {-54, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor ConductionBridge(C = 1.09, T(fixed = true)) annotation(
    Placement(transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor WaterPipeShell(C = 12.4, T(fixed = true)) annotation(
    Placement(transformation(origin = {82, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor CondSourceShell2Bridge(G = 5.03) annotation(
    Placement(transformation(origin = {-18, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor CondBridge2PipeShell(G = 1.13e1) annotation(
    Placement(transformation(origin = {46, -8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature SurroundingAir(T = 293.15) annotation(
    Placement(transformation(origin = {2, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ConvectionHSourceShell2Air(G = 1.88e-2) annotation(
    Placement(transformation(origin = {-78, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ConvectionBridge2Air(G = 1.2e-3) annotation(
    Placement(transformation(origin = {2, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ConvectionWaterPipe2Air(G = 2.26e-2) annotation(
    Placement(transformation(origin = {68, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Cond2WaterPipeWall(G = 2.14e3)  annotation(
    Placement(transformation(origin = {82, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ElectricHeater annotation(
    Placement(transformation(origin = {-54, -106}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-112, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b WaterPipeWall annotation(
    Placement(transformation(origin = {82, -106}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {112, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(HeatSourceShell.port, CondSourceShell2Bridge.port_a) annotation(
    Line(points = {{-54, -8}, {-28, -8}}, color = {191, 0, 0}));
  connect(CondSourceShell2Bridge.port_b, ConductionBridge.port) annotation(
    Line(points = {{-8, -8}, {12, -8}}, color = {191, 0, 0}));
  connect(ConductionBridge.port, CondBridge2PipeShell.port_a) annotation(
    Line(points = {{12, -8}, {36, -8}}, color = {191, 0, 0}));
  connect(CondBridge2PipeShell.port_b, WaterPipeShell.port) annotation(
    Line(points = {{56, -8}, {82, -8}}, color = {191, 0, 0}));
  connect(HeatSourceShell.port, ConvectionHSourceShell2Air.port_a) annotation(
    Line(points = {{-54, -8}, {-78, -8}, {-78, 22}}, color = {191, 0, 0}));
  connect(ConvectionHSourceShell2Air.port_b, SurroundingAir.port) annotation(
    Line(points = {{-78, 42}, {-78, 60}, {2, 60}, {2, 76}}, color = {191, 0, 0}));
  connect(ConvectionBridge2Air.port_a, ConductionBridge.port) annotation(
    Line(points = {{2, 24}, {2, -8}, {12, -8}}, color = {191, 0, 0}));
  connect(ConvectionBridge2Air.port_b, SurroundingAir.port) annotation(
    Line(points = {{2, 44}, {2, 76}}, color = {191, 0, 0}));
  connect(WaterPipeShell.port, ConvectionWaterPipe2Air.port_a) annotation(
    Line(points = {{82, -8}, {68, -8}, {68, 26}}, color = {191, 0, 0}));
  connect(ConvectionWaterPipe2Air.port_b, SurroundingAir.port) annotation(
    Line(points = {{68, 46}, {68.5, 46}, {68.5, 60}, {2, 60}, {2, 76}}, color = {191, 0, 0}));
  connect(Cond2WaterPipeWall.port_a, WaterPipeShell.port) annotation(
    Line(points = {{82, -32}, {82, -8}}, color = {191, 0, 0}));
  connect(Cond2WaterPipeWall.port_b, WaterPipeWall) annotation(
    Line(points = {{82, -52}, {82, -106}}, color = {191, 0, 0}));
  connect(HeatSourceShell.port, ElectricHeater) annotation(
    Line(points = {{-54, -8}, {-54, -106}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  Icon(graphics = {Rectangle(lineThickness = 3, extent = {{-100, 100}, {100, -100}}), Text(origin = {1, -150}, extent = {{-545, 28}, {545, -28}}, textString = "%name")}));
end CoffeHeater;
