within Hackaton2024.Source;

block HeatSink
  import Modelica.Units.SI;
  type Temperature = Real(unit = "K");
  type HeatCapacity = Real(unit = "J/K");
  type ThermalCoefficient = Real(unit = "W/K");
  type HeatTransferCoeff = Real(unit = "W/(m2.K)");
  parameter Temperature ambient_temperature = 293.15 "Ambient temperature";
  parameter Temperature t_init_cooler = ambient_temperature "Initial temperature of heat sink";
  parameter HeatCapacity C_cooler = 10 "Heat capacity of the heat sink";
  parameter ThermalCoefficient Gc = 10 "Convective heat transfer coefficient (heat sink-ambient)";
  //  parameter ThermalCoefficient G_in=50 ;
  parameter HeatTransferCoeff alpha = 1 "Conductive heat transfer coefficient (interface-heat sink)";
  parameter SI.Area A = 5 "Area of conductive heat transfer (interface-heat sink)";
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {32, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cooler(C = C_cooler, T(fixed = true, start = t_init_cooler)) annotation(
    Placement(transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = Gc) annotation(
    Placement(transformation(origin = {6, 62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatIn annotation(
    Placement(transformation(origin = {-86, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-75, -1}, extent = {{-17, -17}, {17, 17}})));
  Conduction conduction1(alpha = alpha, A = A) annotation(
    Placement(transformation(origin = {-48, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = ambient_temperature) annotation(
    Placement(transformation(origin = {78, 10}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(const.y, convection.Gc) annotation(
    Line(points = {{17, 62}, {32, 62}, {32, 20}}, color = {0, 0, 127}));
  connect(cooler.port, convection.solid) annotation(
    Line(points = {{-16, 22}, {-16, 10}, {22, 10}}, color = {191, 0, 0}));
  connect(conduction1.port_b, cooler.port) annotation(
    Line(points = {{-38, 4}, {-16, 4}, {-16, 22}}, color = {191, 0, 0}));
  connect(heatIn, conduction1.port_a) annotation(
    Line(points = {{-86, 4}, {-58, 4}}, color = {191, 0, 0}));
  connect(convection.fluid, fixedTemperature.port) annotation(
    Line(points = {{42, 10}, {68, 10}}, color = {191, 0, 0}));
  annotation(
    Icon(graphics = {Rectangle(origin = {2, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}), Text(origin = {-2, 104}, extent = {{-316, 12}, {316, -12}}, textString = "%name")}),
    uses(Modelica(version = "4.0.0")),
    Diagram);
  annotation(
    Documentation(info="<html>
<p>
Model of the heat sink, consisting of thermal mass connected to the fixed temperature element using convection.
</p>
</html>"));
end HeatSink;
