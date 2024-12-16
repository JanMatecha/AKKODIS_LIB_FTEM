within Hackaton2024.Source;
model FluidSystem_ExportCorrect
  Modelica.Fluid.Vessels.OpenTank CoffeeMug(height(displayUnit = "mm") = 0.08, crossArea = 0.025, level_start(displayUnit = "mm") = 0, redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, nPorts = 1, use_portsData = false) annotation(
    Placement(transformation(origin = {204, 64}, extent = {{-20, -20}, {20, 20}})));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {82, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice Basket(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.05, use_zeta = true, allowFlowReversal = true, zeta = 0.3) annotation(
    Placement(transformation(origin = {132, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Temperature HeatTemperature(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {-22, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe PipeB(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.01, length(displayUnit = "mm") = 0.15, height_ab(displayUnit = "mm") = 0.05) annotation(
    Placement(transformation(origin = {-12, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe DripPlate(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.002, length(displayUnit = "mm") = 0.002, allowFlowReversal = true, nParallel = 16, isCircular = true, height_ab(displayUnit = "mm") = -0.001) annotation(
    Placement(transformation(origin = {24, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.StaticPipe Output(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.002, length(displayUnit = "mm") = 0.001, allowFlowReversal = false, roughness = 2e-4) annotation(
    Placement(transformation(origin = {186, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.VolumeFlowRate VolumeFlow(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {204, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort BrewTemperature(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {204, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe PipeA(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.01, length(displayUnit = "mm") = 0.15, height_ab(displayUnit = "mm") = -0.15) annotation(
    Placement(transformation(origin = {-174, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, dp_nominal = 1e4, m_flow_nominal = 0.2, checkValve = true, p_nominal = 1e5) annotation(
    Placement(transformation(origin = {-134, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(transformation(origin = {-150, -4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveCompressible valveCompressible1(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, checkValve = true, dp_nominal = 1e4, m_flow_nominal = 0.2, p_nominal = 1e5) annotation(
    Placement(transformation(origin = {-51, -47}, extent = {{-11, -11}, {11, 11}})));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(transformation(origin = {-58, -4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Fluid.Pipes.StaticPipe U_Pipe(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, diameter(displayUnit = "mm") = 0.008, height_ab = 0, length(displayUnit = "mm") = 0.1) annotation(
    Placement(transformation(origin = {-98, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_T Inlet(nPorts = 1, redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, m_flow = 0.00025, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-218, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure pressure_inlet(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {-184, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure pressure_outlet(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater) annotation(
    Placement(transformation(origin = {152, 40}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Interfaces.RealInput MassflowIn annotation(
    Placement(transformation(origin = {-238, 14}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-117, 61}, extent = {{17, -17}, {-17, 17}}, rotation = -0)));
Modelica.Blocks.Interfaces.RealOutput PressureDiff annotation(
    Placement(transformation(origin = {-10, 84}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-117, -59}, extent = {{17, -17}, {-17, 17}})));
Modelica.Blocks.Math.Add PressureDiffer(k2 = -1)  annotation(
    Placement(transformation(origin = {-24, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(PipeB.port_b, DripPlate.port_a) annotation(
    Line(points = {{-2, -46}, {14, -46}}, color = {0, 127, 255}));
  connect(Output.port_b, VolumeFlow.port_a) annotation(
    Line(points = {{196, -44}, {204, -44}, {204, -26}}, color = {0, 127, 255}));
  connect(VolumeFlow.port_b, BrewTemperature.port_a) annotation(
    Line(points = {{204, -6}, {204, 10}}, color = {0, 127, 255}));
  connect(BrewTemperature.port_b, CoffeeMug.ports[1]) annotation(
    Line(points = {{204, 30}, {204, 44}}, color = {0, 127, 255}));
  connect(HeatTemperature.port, PipeB.port_a) annotation(
    Line(points = {{-22, -2}, {-22, -46}}, color = {0, 127, 255}));
  connect(PipeA.port_b, valveCompressible.port_a) annotation(
    Line(points = {{-164, -44}, {-144, -44}, {-144, -46}}, color = {0, 127, 255}));
  connect(const.y, valveCompressible.opening) annotation(
    Line(points = {{-139, -4}, {-139, -38}, {-134, -38}}, color = {0, 0, 127}));
  connect(valveCompressible1.port_b, PipeB.port_a) annotation(
    Line(points = {{-40, -47}, {-40, -46}, {-22, -46}}, color = {0, 127, 255}));
  connect(const1.y, valveCompressible1.opening) annotation(
    Line(points = {{-69, -4}, {-74, -4}, {-74, -38}, {-51, -38}}, color = {0, 0, 127}));
  connect(DripPlate.port_b, Basket.port_a) annotation(
    Line(points = {{34, -46}, {122, -46}, {122, -60}}, color = {0, 127, 255}));
  connect(valveCompressible.port_b, U_Pipe.port_a) annotation(
    Line(points = {{-124, -46}, {-108, -46}}, color = {0, 127, 255}));
  connect(U_Pipe.port_b, valveCompressible1.port_a) annotation(
    Line(points = {{-88, -46}, {-62, -46}}, color = {0, 127, 255}));
  connect(Inlet.ports[1], PipeA.port_a) annotation(
    Line(points = {{-208, -44}, {-184, -44}}, color = {0, 127, 255}));
  connect(Basket.port_b, Output.port_a) annotation(
    Line(points = {{142, -60}, {176, -60}, {176, -44}}, color = {0, 127, 255}));
  connect(pressure_inlet.port, PipeA.port_a) annotation(
    Line(points = {{-184, 20}, {-184, -44}}, color = {0, 127, 255}));
  connect(pressure_outlet.port, BrewTemperature.port_b) annotation(
    Line(points = {{152, 30}, {204, 30}}, color = {0, 127, 255}));
connect(pressure_outlet.p, PressureDiffer.u2) annotation(
    Line(points = {{164, 40}, {-18, 40}, {-18, 46}}, color = {0, 0, 127}));
connect(pressure_inlet.p, PressureDiffer.u1) annotation(
    Line(points = {{-172, 30}, {-30, 30}, {-30, 46}}, color = {0, 0, 127}));
connect(PressureDiffer.y, PressureDiff) annotation(
    Line(points = {{-24, 70}, {-10, 70}, {-10, 84}}, color = {0, 0, 127}));
connect(MassflowIn, Inlet.m_flow_in) annotation(
    Line(points = {{-238, 14}, {-228, 14}, {-228, -36}}, color = {0, 0, 127}));
  annotation(
    Diagram,
  Icon(graphics = {Rectangle(origin = {6, 0}, fillColor = {236, 0, 4}, fillPattern = FillPattern.CrossDiag, extent = {{-106, 100}, {106, -100}}), Text(origin = {2, -142}, extent = {{-526, 24}, {526, -24}}, textString = "%name")}));
end FluidSystem_ExportCorrect;
