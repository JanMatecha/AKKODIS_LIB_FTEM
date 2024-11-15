within Hackaton2024.Source;
model Evaporator
  inner Modelica.Fluid.System system annotation(
 
    Placement(transformation(origin = {-68, 70}, extent = {{-10, -10}, {10, 10}})));
  import Modelica.Units.SI;
  parameter SI.Temperature inletWaterTemperature = 293.15; // Inlet temperature of water
  parameter SI.QualityFactor outletQuality = 0.2; // Desired steam quality (0.9=90%steam - fraction)
  parameter SI.Length h_diff = 0.025;
  
model LatentHeatCalc
    import Modelica.Units.SI;
    import Modelica.Media;
    import Modelica.Thermal.HeatTransfer.Interfaces; 
    
    outer Modelica.Fluid.System system "System wide properties";
    replaceable package Medium = Modelica.Media.Interfaces.PartialTwoPhaseMedium annotation (choicesAllMatching = true);
    // Parameters
    parameter SI.Temperature inletTemperatureLH; // Inlet temperature
    parameter SI.QualityFactor outletQualityLH;         // Desired steam quality (0.9=90%steam - fraction)
    parameter SI.Pressure pressure_ambient = system.p_ambient ;        // Pressure ambient
    //parameter SI.Pressure p_diffLH; //Pressure difference by height difference
    parameter SI.Length h_diffLH; //height difference to overcome
    parameter SI.Acceleration g = system.g;
    // Variables
    SI.Pressure p_diffTotal;
    SI.MassFlowRate massFlowRate; // Mass flow rate
    SI.Pressure p;
    SI.Temperature Tout;
    SI.HeatFlowRate heatFlow;         // Heat flow in
    SI.Enthalpy enthalpyIn ;//
    SI.Enthalpy enthalpyOut;
    SI.Density densityOut;      // Enthalpy of steam at outlet conditions
    Medium.SaturationProperties sat_out; //State vector out
    Medium.SpecificEnthalpy h_v=Medium.dewEnthalpy(sat_out); //Specific enthalpy of vapour
    Medium.SpecificEnthalpy h_l=Medium.bubbleEnthalpy(sat_out);     //Specific enthalpy of liquid
    Medium.Density rho_l=Medium.bubbleDensity(sat_out);	
    Medium.Density rho_v=Medium.dewDensity(sat_out);
    
    
    Modelica.Blocks.Interfaces.RealOutput T(unit="K") "temperature of medium on exit"
      annotation (Placement(transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    
    Modelica.Blocks.Interfaces.RealOutput massFlow(unit="kg/s") "massflow of media"
      annotation (Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
    
    
    Modelica.Blocks.Interfaces.RealInput heatFlowIn(unit="W") "heatFlow in media"
      annotation (Placement(transformation(origin = {-25, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {1, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      
    Modelica.Blocks.Interfaces.RealInput p_diffLH(unit="Pa") "pressure diff in flow of coffe machine"
      annotation (Placement(transformation(origin = {107, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {109, -50}, extent = {{-10, -10}, {10, 10}})));
    
            
    equation
    
    densityOut = (1-outletQualityLH)*h_v + outletQualityLH*h_l;
    
    p_diffTotal = p_diffLH + h_diffLH*densityOut*g/1000 ;
    
    p = pressure_ambient + p_diffTotal;
    
    heatFlow = heatFlowIn;
    
    enthalpyIn = Medium.specificEnthalpy_pTX(p, inletTemperatureLH, {0,1},1);
    
    sat_out = Medium.setSat_p(p);
    enthalpyOut = (1-outletQualityLH)*h_v + outletQualityLH*h_l;
    
    massFlowRate = heatFlow/(enthalpyOut-enthalpyIn);
    
    Tout = Medium.saturationTemperature_sat(sat_out);
    
    massFlow = massFlowRate;
    T = Tout;
    
    
end LatentHeatCalc;

 
 
  LatentHeatCalc latentHeatCalc(redeclare package Medium = Modelica.Media.Examples.TwoPhaseWater, inletTemperatureLH = inletWaterTemperature, outletQualityLH = outletQuality, h_diffLH = h_diff) annotation(
    Placement(transformation(origin = {6, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {20, -64}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {-24, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput massFlow "kg*s-1" annotation(
    Placement(transformation(origin = {110, 68}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 64}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(transformation(origin = {-106, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}})));
  input Modelica.Blocks.Interfaces.RealInput pressureDifferenceFlow "Pa" annotation(
    Placement(transformation(origin = {100, -56}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Max max annotation(
    Placement(transformation(origin = {-64, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const1(k = 293.15) annotation(
    Placement(transformation(origin = {-86, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Max max1 annotation(
    Placement(transformation(origin = {60, 34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(
    Placement(transformation(origin = {-8, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Max max2 annotation(
    Placement(transformation(origin = {46, -86}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
    Placement(transformation(origin = {-6, -86}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(prescribedTemperature.port, heatFlowSensor.port_b) annotation(
    Line(points = {{-14, -38}, {41, -38}, {41, -44}, {40, -44}, {40, -64}, {30, -64}}, color = {191, 0, 0}));
  connect(port_a, heatFlowSensor.port_a) annotation(
    Line(points = {{-106, -70}, {-36, -70}, {-36, -64}, {10, -64}}, color = {191, 0, 0}));
  connect(latentHeatCalc.T, max.u1) annotation(
    Line(points = {{6, 24}, {6, 38}, {-90, 38}, {-90, 0}, {-76, 0}}, color = {0, 0, 127}));
  connect(const1.y, max.u2) annotation(
    Line(points = {{-74, -44}, {-64, -44}, {-64, -24}, {-92, -24}, {-92, -12}, {-76, -12}}, color = {0, 0, 127}));
  connect(max.y, prescribedTemperature.T) annotation(
    Line(points = {{-52, -6}, {-48, -6}, {-48, -38}, {-36, -38}}, color = {0, 0, 127}));
  connect(const2.y, max1.u1) annotation(
    Line(points = {{4, 70}, {24, 70}, {24, 40}, {48, 40}}, color = {0, 0, 127}));
  connect(latentHeatCalc.massFlow, max1.u2) annotation(
    Line(points = {{18, 12}, {28, 12}, {28, 28}, {48, 28}}, color = {0, 0, 127}));
  connect(max1.y, massFlow) annotation(
    Line(points = {{72, 34}, {80, 34}, {80, 68}, {110, 68}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, max2.u1) annotation(
    Line(points = {{20, -74}, {34, -74}, {34, -80}}, color = {0, 0, 127}));
  connect(const3.y, max2.u2) annotation(
    Line(points = {{6, -86}, {18, -86}, {18, -94}, {34, -94}, {34, -92}}, color = {0, 0, 127}));
  connect(max2.y, latentHeatCalc.heatFlowIn) annotation(
    Line(points = {{58, -86}, {54, -86}, {54, -18}, {6, -18}, {6, 2}}, color = {0, 0, 127}));
  connect(latentHeatCalc.p_diffLH, pressureDifferenceFlow) annotation(
    Line(points = {{16, 8}, {68, 8}, {68, -56}, {100, -56}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  Icon(graphics = {Rectangle(origin = {0, -68}, lineColor = {0, 85, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 32}, {100, -32}}), Ellipse(origin = {26, 48}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-28, 2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-28, 2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-28, 2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-28, 2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-74, -6}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-58, 38}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {48, 2}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {14, -22}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-62, -32}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {86, -32}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {72, 76}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {-24, 60}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {6, 16}, fillColor = {0, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-12, 12}, {12, -12}}), Text(origin = {1, -139}, extent = {{-775, 29}, {775, -29}}, textString = "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  version = "");
end Evaporator;
