within Hackaton2024.Source.DevelopmentModels;
model Buck_converter
  Modelica.Electrical.Analog.Semiconductors.Diode D0 annotation(
    Placement(transformation(origin = {-66, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Inductor L1(L = 0.001, i(start = 0, fixed = true)) annotation(
    Placement(transformation(origin = {-48, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C = 5e-3, v(start = 0, fixed = true)) annotation(
    Placement(transformation(origin = {-24, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Rload(R = 2, useHeatPort = true) annotation(
    Placement(transformation(origin = {6, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {-118, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor A1_load annotation(
    Placement(transformation(origin = {-8, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V1_load annotation(
    Placement(transformation(origin = {36, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.ControlledIdealOpeningSwitch switch(level = 24, Ron = 0.2, useHeatPort = true)  annotation(
    Placement(transformation(origin = {-94, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(transformation(origin = {-190, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Interfaces.NegativePin battery_negative annotation(
    Placement(transformation(origin = {-118, 44}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-120, 42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin battery_positive annotation(
    Placement(transformation(origin = {-118, 88}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-118, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b converter_heat annotation(
    Placement(transformation(origin = {-92, -38}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-120, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPipe_heat annotation(
    Placement(transformation(origin = {-12, -38}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-118, -84}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Rload.n, ground.p) annotation(
    Line(points = {{6, 50}, {6, 18}, {-118, 18}}, color = {0, 0, 255}));
  connect(Rload.p, A1_load.n) annotation(
    Line(points = {{6, 70}, {6, 88}, {2, 88}}, color = {0, 0, 255}));
  connect(A1_load.p, L1.n) annotation(
    Line(points = {{-18, 88}, {-38, 88}}, color = {0, 0, 255}));
  connect(C1.p, A1_load.p) annotation(
    Line(points = {{-24, 70}, {-24, 88}, {-18, 88}}, color = {0, 0, 255}));
  connect(C1.n, ground.p) annotation(
    Line(points = {{-24, 50}, {-24, 18}, {-118, 18}}, color = {0, 0, 255}));
  connect(V1_load.p, A1_load.n) annotation(
    Line(points = {{36, 70}, {36, 88}, {2, 88}}, color = {0, 0, 255}));
  connect(V1_load.n, ground.p) annotation(
    Line(points = {{36, 50}, {36, 18}, {-118, 18}}, color = {0, 0, 255}));
  connect(D0.n, L1.p) annotation(
    Line(points = {{-66, 70}, {-66, 88}, {-58, 88}}, color = {0, 0, 255}));
  connect(D0.p, ground.p) annotation(
    Line(points = {{-66, 50}, {-66, 18}, {-118, 18}}, color = {0, 0, 255}));
  connect(V1_load.v, signalVoltage.v) annotation(
    Line(points = {{26, 60}, {20, 60}, {20, -8}, {-160, -8}, {-160, 50}, {-178, 50}}, color = {0, 0, 127}));
  connect(signalVoltage.n, ground.p) annotation(
    Line(points = {{-190, 40}, {-190, 18}, {-118, 18}}, color = {0, 0, 255}));
  connect(signalVoltage.p, switch.control) annotation(
    Line(points = {{-190, 60}, {-190, 110}, {-94, 110}, {-94, 98}}, color = {0, 0, 255}));
  connect(switch.n, L1.p) annotation(
    Line(points = {{-84, 88}, {-58, 88}}, color = {0, 0, 255}));
  connect(battery_negative, ground.p) annotation(
    Line(points = {{-118, 44}, {-118, 18}}, color = {0, 0, 255}));
  connect(battery_positive, switch.p) annotation(
    Line(points = {{-118, 88}, {-104, 88}}, color = {0, 0, 255}));
  connect(converter_heat, switch.heatPort) annotation(
    Line(points = {{-92, -38}, {-94, -38}, {-94, 78}}, color = {191, 0, 0}));
  connect(heatPipe_heat, Rload.heatPort) annotation(
    Line(points = {{-12, -38}, {-12, 60}, {-4, 60}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram,
  Icon);
end Buck_converter;
