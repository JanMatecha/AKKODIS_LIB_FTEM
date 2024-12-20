within Hackaton2024;

model CoffeeMakerSimplified_02
  Source.ModulElectric modulElectric annotation(
    Placement(transformation(origin = {-55, -43}, extent = {{-11, -11}, {11, 11}})));
  Source.HeatSink HeatSink annotation(
    Placement(transformation(origin = {-82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Source.CoffeeHeater coffeeHeater annotation(
    Placement(transformation(origin = {-26, 8}, extent = {{-10, -10}, {10, 10}})));
  Source.Evaporator evaporator annotation(
    Placement(transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1000) "value of pressure loss in the fluid part of the machine" annotation(
    Placement(transformation(origin = {70, -10}, extent = {{14, -10}, {-14, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue massFlow "mass flow produced by the machine" annotation(
    Placement(transformation(origin = {74, 42}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(modulElectric.TubeHeat, coffeeHeater.ElectricHeater) annotation(
    Line(points = {{-51.7, -33.76}, {-51.7, 8.24}, {-37.7, 8.24}}, color = {191, 0, 0}));
  connect(modulElectric.ConverterHeat, HeatSink.heatIn) annotation(
    Line(points = {{-58.3, -33.76}, {-58.3, -11.76}, {-82.3, -11.76}, {-82.3, 2.74}}, color = {191, 0, 0}));
  connect(coffeeHeater.WaterPipeWall, evaporator.port_a) annotation(
    Line(points = {{-14, 8}, {9, 8}, {9, 7}}, color = {191, 0, 0}));
  connect(realExpression.y, evaporator.pressureDifferenceFlow) annotation(
    Line(points = {{55, -10}, {46, -10}, {46, 8}, {32, 8}}, color = {0, 0, 127}));
  connect(evaporator.massFlow, massFlow.numberPort) annotation(
    Line(points = {{32, 20}, {44, 20}, {44, 42}, {62.5, 42}}, color = {0, 0, 127}));
  annotation(experiment(StartTime=0,StopTime=1000));
annotation(
    Diagram,
    Documentation(info="<html>
<p>
This model demonstrates the heat path through the coffee machine. Duty cycle is guided by the 'modulElectric', which produces heat neccessary for the run of the maschine. Heat flow passes through the 'CoffeeHeater' and is then used in the 'evaporator', output of which is an value of mass flow for heated water. 
</p>
</html>"));
end CoffeeMakerSimplified_02;
