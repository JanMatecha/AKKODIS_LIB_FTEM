within Hackaton2024;

model CoffeeMaker_FINAL
  "Model of the coffee maker with all the domains combined."
  Source.ModulElectric modulElectric annotation(
    Placement(transformation(origin = {-55, -43}, extent = {{-11, -11}, {11, 11}})));
  Source.HeatSink HeatSink annotation(
    Placement(transformation(origin = {-82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Source.CoffeHeater coffeeHeater annotation(
    Placement(transformation(origin = {-26, 8}, extent = {{-10, -10}, {10, 10}})));
  Source.Evaporator evaporator annotation(
    Placement(transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}})));
  Source.FluidSystem_ExportCorrect fluidSystem_ExportCorrect annotation(
    Placement(transformation(origin = {70, 14}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(modulElectric.TubeHeat, coffeeHeater.ElectricHeater) annotation(
    Line(points = {{-51.7, -33.76}, {-51.7, 8.24}, {-37.7, 8.24}}, color = {191, 0, 0}));
  connect(modulElectric.ConverterHeat, HeatSink.heatIn) annotation(
    Line(points = {{-58.3, -33.76}, {-58.3, -11.76}, {-82.3, -11.76}, {-82.3, 2.74}}, color = {191, 0, 0}));
  connect(coffeeHeater.WaterPipeWall, evaporator.port_a) annotation(
    Line(points = {{-14, 8}, {9, 8}, {9, 7}}, color = {191, 0, 0}));
  connect(evaporator.massFlow, fluidSystem_ExportCorrect.MassflowIn) annotation(
    Line(points = {{32, 20}, {58, 20}}, color = {0, 0, 127}));
  connect(fluidSystem_ExportCorrect.PressureDiff, evaporator.pressureDifferenceFlow) annotation(
    Line(points = {{58, 8}, {32, 8}}, color = {0, 0, 127}));
annotation (
    experiment(StartTime=0,StopTime=1000),
    Diagram,
    Documentation(info="<html>
<p>
This model demonstrates the final model of the coffee maker, using all developed domains. Duty cycle is guided by the 'modulElectric', which produces heat neccessary for the run of the maschine. Heat flow passes through the 'CoffeeHeater' and is then used in the 'Evaporator', in order to create the final massflow of the water. The module 'FluidSystem_ExportCorrect' then simulates the flow of heated water itself.
</p>
<p>
Right now is the model not feasible due to the (near) singularity of the matrix generated, for the running model, see 'test_spojeni_simplified_02'.
</p>
</html>"));
end CoffeeMaker_FINAL;
