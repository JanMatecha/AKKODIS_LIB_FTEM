within Hackaton2024.Source.DevelopmentModels;
model BatteryModelPB
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1) annotation(
    Placement(transformation(origin = {6, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {82, -34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack(cellData = cellData, SOC(start = 0.8, fixed = true)) annotation(
    Placement(transformation(origin = {4, -18}, extent = {{-10, -10}, {10, 10}})));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData(Qnom = 360, OCVmax = 1, OCVmin = 0.5, Ri = 0) annotation(
    Placement(transformation(origin = {-86, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Batteries.Utilities.CCCVcharger cccvCharger(I = -1, startTime = 100, Vend = 1)  annotation(
    Placement(transformation(origin = {4, -64}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack cellStack1(cellData = cellData1, SOC(start = 0.5, final fixed = true)) annotation(
    Placement(transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}})));
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData1(Qnom = 3.6e5, OCVmax = 10, OCVmin = 1, Ri = 0)  annotation(
    Placement(transformation(origin = {80, -84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1e3)  annotation(
    Placement(transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch annotation(
    Placement(transformation(origin = {-54, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1(Goff = 1e-7)  annotation(
    Placement(transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  BooleanPulseLimited booleanPulseLimited1(startTime = 700, dutyCycle = 0.3, period = 1000, nPulses = 15)  annotation(
    Placement(transformation(origin = {-78, -40}, extent = {{-10, -10}, {10, 10}})));
  BooleanPulseSuperpolated booleanPulseSuperpolated(startTime = 100, dutyCycleShort = 0.5, periodShort = 100, nPulsesShort = 5000, dutyCycleLong = 0.49, periodLong = 1000, nPulsesLong = 15)  annotation(
    Placement(transformation(origin = {-24, -4}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(ground.p, resistor.p) annotation(
    Line(points = {{82, -24}, {82, 12}, {16, 12}}, color = {0, 0, 255}));
  connect(cellStack.n, resistor.p) annotation(
    Line(points = {{14, -18}, {30, -18}, {30, 12}, {16, 12}}, color = {0, 0, 255}));
  connect(cellStack1.n, cccvCharger.p) annotation(
    Line(points = {{10, -90}, {24, -90}, {24, -64}, {14, -64}}, color = {0, 0, 255}));
  connect(cellStack1.p, resistor1.n) annotation(
    Line(points = {{-10, -90}, {-20, -90}}, color = {0, 0, 255}));
  connect(resistor1.p, cccvCharger.n) annotation(
    Line(points = {{-40, -90}, {-52, -90}, {-52, -64}, {-6, -64}}, color = {0, 0, 255}));
  connect(switch.p, resistor.n) annotation(
    Line(points = {{-54, 6}, {-54, 12}, {-4, 12}}, color = {0, 0, 255}));
  connect(switch.n, cellStack.p) annotation(
    Line(points = {{-54, -14}, {-54, -18}, {-6, -18}}, color = {0, 0, 255}));
  connect(cccvCharger.n, switch1.p) annotation(
    Line(points = {{-6, -64}, {-40, -64}, {-40, -50}}, color = {0, 0, 255}));
  connect(switch1.n, cellStack.p) annotation(
    Line(points = {{-40, -30}, {-40, -18}, {-6, -18}}, color = {0, 0, 255}));
  connect(cellStack.n, cccvCharger.p) annotation(
    Line(points = {{14, -18}, {24, -18}, {24, -64}, {14, -64}}, color = {0, 0, 255}));
  connect(booleanPulseLimited1.y, switch1.control) annotation(
    Line(points = {{-74, -40}, {-52, -40}}, color = {255, 0, 255}));
  connect(booleanPulseSuperpolated.y, switch.control) annotation(
    Line(points = {{-28, -4}, {-42, -4}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram);
end BatteryModelPB;
