within Hackaton2024.Source;

model kondukce
  import Modelica.Units.SI;
  type HeatTransferCoeff = Real(unit="W/(m2.K)");
  parameter Real alpha=4;
  parameter SI.Area A=5;
  extends Modelica.Thermal.HeatTransfer.Components.ThermalConductor(G=alpha*A);
end kondukce;
