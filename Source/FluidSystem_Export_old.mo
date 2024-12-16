within Hackaton2024.Source;
model FluidSystem_Export_old
  Modelica.Fluid.Vessels.OpenTank CoffeeMug(height(displayUnit = "mm") = 0.08, crossArea = 0.025, level_start(displayUnit = "mm") = 0, redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, nPorts = 1, use_portsData = false) annotation(
    Placement(transformation(origin = {204, 64}, extent = {{-20, -20}, {20, 20}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {210, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice Basket(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.05, use_zeta = true, allowFlowReversal = true, zeta = 0.3) annotation(
    Placement(transformation(origin = {108, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Temperature HeatTemperature(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {34, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe PipeB(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.01, length(displayUnit = "mm") = 0.15, height_ab(displayUnit = "mm") = 0.05) annotation(
    Placement(transformation(origin = {44, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe DripPlate(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.002, length(displayUnit = "mm") = 0.0034, allowFlowReversal = true, nParallel = 16, isCircular = true, height_ab(displayUnit = "mm") = -0.001) annotation(
    Placement(transformation(origin = {80, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe OutputPlate(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.05, length(displayUnit = "mm") = 0.08, allowFlowReversal = false, height_ab = -80) annotation(
    Placement(transformation(origin = {138, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.VolumeFlowRate VolumeFlow(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {204, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort BrewTemperature(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {204, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe PipeA(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.01, length(displayUnit = "mm") = 0.15, height_ab(displayUnit = "mm") = -0.15) annotation(
    Placement(transformation(origin = {-118, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, dp_nominal = 1e4, m_flow_nominal = 0.2, checkValve = true, p_nominal = 1e5) annotation(
    Placement(transformation(origin = {-78, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(transformation(origin = {-96, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, checkValve = true, dp_nominal = 1e4, m_flow_nominal = 0.2, p_nominal = 1e5) annotation(
    Placement(transformation(origin = {5, -47}, extent = {{-11, -11}, {11, 11}})));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(transformation(origin = {-2, -18}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe U_Pipe(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.008, height_ab = 0, length(displayUnit = "mm") = 0.1) annotation(
    Placement(transformation(origin = {-42, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T Inlet(nPorts = 1, redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, m_flow = 0.00025, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-162, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure pressure_inlet(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {-128, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure pressure_outlet(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {166, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
    Placement(transformation(origin = {-44, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
Modelica.Blocks.Interfaces.RealOutput pressure_diff annotation(
    Placement(transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-273, -51}, extent = {{23, -23}, {-23, 23}}, rotation = -0)));
Modelica.Blocks.Interfaces.RealInput Massflow_in annotation(
    Placement(transformation(origin = {-234, -40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-273, 61}, extent = {{23, -23}, {-23, 23}}, rotation = -0)));
equation
  connect(PipeB.port_b, DripPlate.port_a) annotation(
    Line(points = {{54, -46}, {70, -46}}, color = {0, 127, 255}));
  connect(OutputPlate.port_b, VolumeFlow.port_a) annotation(
    Line(points = {{148, -46}, {204, -46}, {204, -26}}, color = {0, 127, 255}));
  connect(VolumeFlow.port_b, BrewTemperature.port_a) annotation(
    Line(points = {{204, -6}, {204, 10}}, color = {0, 127, 255}));
  connect(BrewTemperature.port_b, CoffeeMug.ports[1]) annotation(
    Line(points = {{204, 30}, {204, 44}}, color = {0, 127, 255}));
  connect(HeatTemperature.port, PipeB.port_a) annotation(
    Line(points = {{34, -2}, {34, -46}}, color = {0, 127, 255}));
  connect(PipeA.port_b, valveCompressible.port_a) annotation(
    Line(points = {{-108, -44}, {-88, -44}, {-88, -46}}, color = {0, 127, 255}));
  connect(const.y, valveCompressible.opening) annotation(
    Line(points = {{-85, -18}, {-85, -38}, {-78, -38}}, color = {0, 0, 127}));
  connect(valveCompressible1.port_b, PipeB.port_a) annotation(
    Line(points = {{16, -47}, {16, -46}, {34, -46}}, color = {0, 127, 255}));
  connect(const1.y, valveCompressible1.opening) annotation(
    Line(points = {{-13, -18}, {-18, -18}, {-18, -38}, {5, -38}}, color = {0, 0, 127}));
  connect(DripPlate.port_b, Basket.port_a) annotation(
    Line(points = {{90, -46}, {98, -46}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, U_Pipe.port_a) annotation(
    Line(points = {{-68, -46}, {-52, -46}}, color = {0, 127, 255}));
  connect(U_Pipe.port_b, valveCompressible1.port_a) annotation(
    Line(points = {{-32, -46}, {-6, -46}}, color = {0, 127, 255}));
  connect(Inlet.ports[1], PipeA.port_a) annotation(
    Line(points = {{-152, -44}, {-128, -44}}, color = {0, 127, 255}));
  connect(Basket.port_b, OutputPlate.port_a) annotation(
    Line(points = {{118, -46}, {128, -46}}, color = {0, 127, 255}));
  connect(pressure_inlet.port, PipeA.port_a) annotation(
    Line(points = {{-128, 14}, {-128, -44}}, color = {0, 127, 255}));
  connect(pressure_outlet.port, BrewTemperature.port_b) annotation(
    Line(points = {{166, 30}, {204, 30}}, color = {0, 127, 255}));
connect(pressure_outlet.p, add.u2) annotation(
    Line(points = {{156, 40}, {-38, 40}, {-38, 54}}, color = {0, 0, 127}));
connect(pressure_inlet.p, add.u1) annotation(
    Line(points = {{-116, 24}, {-50, 24}, {-50, 54}}, color = {0, 0, 127}));
connect(add.y, pressure_diff) annotation(
    Line(points = {{-44, 78}, {0, 78}, {0, 90}}, color = {0, 0, 127}));
connect(Massflow_in, Inlet.m_flow_in) annotation(
    Line(points = {{-234, -40}, {-172, -40}, {-172, -36}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-250, -100}, {250, 100}})),
    Icon(coordinateSystem(extent = {{-250, -100}, {250, 100}}), graphics = {Rectangle(origin = {-144, 0}, fillColor = {236, 0, 4}, fillPattern = FillPattern.CrossDiag, extent = {{-106, 100}, {106, -100}}), Text(origin = {-142, -148}, extent = {{-750, 38}, {750, -38}}, textString = "%name")}));
end FluidSystem_Export_old;
