within Hackaton2024.Source.DevelopmentModels;

model CoffeeMakerSimplified_01
  "Simplified model of the coffee machine, in order to test only the heat portion of the machine."
  Source.ModulElectric modulElectric annotation(
    Placement(transformation(origin = {-55, -43}, extent = {{-11, -11}, {11, 11}})));
  Source.HeatSink HeatSink annotation(
    Placement(transformation(origin = {-82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Source.CoffeHeater coffeeHeater annotation(
    Placement(transformation(origin = {-26, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 100)  annotation(
    Placement(transformation(origin = {20, 28}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(modulElectric.TubeHeat, coffeeHeater.ElectricHeater) annotation(
    Line(points = {{-51.7, -33.76}, {-51.7, 8.24}, {-37.7, 8.24}}, color = {191, 0, 0}));
  connect(modulElectric.ConverterHeat, HeatSink.heatIn) annotation(
    Line(points = {{-58.3, -33.76}, {-58.3, -11.76}, {-82.3, -11.76}, {-82.3, 2.74}}, color = {191, 0, 0}));
  connect(coffeeHeater.WaterPipeWall, heatCapacitor.port) annotation(
    Line(points = {{-14, 8}, {22, 8}, {22, 18}, {20, 18}}, color = {191, 0, 0}));
  annotation(experiment(StartTime=0,StopTime=1000));
annotation(
    Diagram,
    Documentation(info="<html>
<p>
This model demonstrates the heat path through the coffee machine. Duty cycle is guided by the 'modulElectric', which produces heat neccessary for the run of the machine. Heat flow passes through the 'CoffeeHeater' and is then absorbed into the heat mass, which represents water evaporator in the full machine.
</p>
</html>"));
end CoffeeMakerSimplified_01;
