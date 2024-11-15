within Hackaton2024.Source;
model ModulElectric
  Modelica.Electrical.Analog.Basic.Resistor HeatingTube(R = 1, useHeatPort = true) annotation(
    Placement(transformation(origin = {6, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {88, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack(cellData = cellData, SOC(start = 1, fixed = true)) annotation(
    Placement(transformation(origin = {6, -8}, extent = {{-10, -10}, {10, 10}})));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData(Qnom = 36000, OCVmax = 36, OCVmin = 34, Ri = 0) annotation(
    Placement(transformation(origin = {48, -4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Batteries.Utilities.CCCVcharger cccvCharger(I = -20, startTime = 100, Vend = 36)  annotation(
    Placement(transformation(origin = {4, -64}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack1(cellData = cellData1, SOC(start = 0.5, final fixed = true)) annotation(
    Placement(transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}})));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData1(Qnom = 3.6e5, OCVmax = 10, OCVmin = 1, Ri = 0)  annotation(
    Placement(transformation(origin = {48, -84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1e3)  annotation(
    Placement(transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation(
    Placement(transformation(origin = {-54, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1(Goff = 1e-7)  annotation(
    Placement(transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  BooleanPulseLimited booleanPulseLimited1(startTime = 700, dutyCycle = 0.3, period = 1000, nPulses = 15)  annotation(
    Placement(transformation(origin = {-72, -40}, extent = {{-10, -10}, {10, 10}})));
  BooleanPulseSuperpolated booleanPulseSuperpolated(startTime = 100, dutyCycleShort = 0.5, periodShort = 100, nPulsesShort = 5000, dutyCycleLong = 0.49, periodLong = 1000, nPulsesLong = 15)  annotation(
    Placement(transformation(origin = {-24, 16}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor Converter(R = 0.45, useHeatPort = false)  annotation(
    Placement(transformation(origin = {-42, 38}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor ConverterLosses(R = 0.05, useHeatPort = true)  annotation(
    Placement(transformation(origin = {-18, 38}, extent = {{10, 10}, {-10, -10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ConverterHeat annotation(
    Placement(transformation(origin = {-18, 60}, extent = {{-4, -4}, {4, 4}}), iconTransformation(origin = {-30, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TubeHeat annotation(
    Placement(transformation(origin = {6, 60}, extent = {{-4, -4}, {4, 4}}), iconTransformation(origin = {30, 84}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ground.p, HeatingTube.p) annotation(
    Line(points = {{88, 12}, {88, 38}, {16, 38}}, color = {0, 0, 255}));
  connect(cellStack.n, HeatingTube.p) annotation(
    Line(points = {{16, -8}, {30, -8}, {30, 38}, {16, 38}}, color = {0, 0, 255}));
  connect(cellStack1.n, cccvCharger.p) annotation(
    Line(points = {{10, -90}, {24, -90}, {24, -64}, {14, -64}}, color = {0, 0, 255}));
  connect(cellStack1.p, resistor1.n) annotation(
    Line(points = {{-10, -90}, {-20, -90}}, color = {0, 0, 255}));
  connect(resistor1.p, cccvCharger.n) annotation(
    Line(points = {{-40, -90}, {-52, -90}, {-52, -64}, {-6, -64}}, color = {0, 0, 255}));
  connect(switch.n, cellStack.p) annotation(
    Line(points = {{-54, 6}, {-54, -8}, {-4, -8}}, color = {0, 0, 255}));
  connect(cccvCharger.n, switch1.p) annotation(
    Line(points = {{-6, -64}, {-40, -64}, {-40, -50}}, color = {0, 0, 255}));
  connect(switch1.n, cellStack.p) annotation(
    Line(points = {{-40, -30}, {-40, -8}, {-4, -8}}, color = {0, 0, 255}));
  connect(cellStack.n, cccvCharger.p) annotation(
    Line(points = {{16, -8}, {24, -8}, {24, -64}, {14, -64}}, color = {0, 0, 255}));
  connect(booleanPulseLimited1.y, switch1.control) annotation(
    Line(points = {{-68, -40}, {-52, -40}}, color = {255, 0, 255}));
  connect(booleanPulseSuperpolated.y, switch.control) annotation(
    Line(points = {{-28, 16.2}, {-35, 16.2}, {-35, 16}, {-42, 16}}, color = {255, 0, 255}));
  connect(switch.p, Converter.n) annotation(
    Line(points = {{-54, 26}, {-54, 38}, {-52, 38}}, color = {0, 0, 255}));
  connect(Converter.p, ConverterLosses.n) annotation(
    Line(points = {{-32, 38}, {-28, 38}}, color = {0, 0, 255}));
  connect(ConverterLosses.p, HeatingTube.n) annotation(
    Line(points = {{-8, 38}, {-4, 38}}, color = {0, 0, 255}));
  connect(ConverterLosses.heatPort, ConverterHeat) annotation(
    Line(points = {{-18, 48}, {-18, 60}}, color = {191, 0, 0}));
  connect(HeatingTube.heatPort, TubeHeat) annotation(
    Line(points = {{6, 48}, {6, 60}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Rectangle(origin = {-16, -63}, extent = {{-82, 37}, {82, -37}}), Text(origin = {-72, -96}, extent = {{-18, 2}, {18, -2}}, textString = "Charger circuit")}),
  Icon(graphics = {Rectangle(origin = {0, 18}, lineColor = {85, 0, 255}, lineThickness = 3, extent = {{-60, 56}, {60, -56}}), Text(origin = {5, -60}, textColor = {85, 0, 255}, extent = {{-339, 20}, {339, -20}}, textString = "%name")}));
end ModulElectric;
