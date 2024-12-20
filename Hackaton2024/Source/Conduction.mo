within Hackaton2024.Source;

model Conduction "conduction model, which uses heat transfer coefficient and area, to determine heat flow rate"
  import Modelica.Units.SI;
  type HeatTransferCoeff = Real(unit="W/(m2.K)");
  parameter Real alpha=4;
  parameter SI.Area A=5;
  extends Modelica.Thermal.HeatTransfer.Components.ThermalConductor(G=alpha*A);
end Conduction;