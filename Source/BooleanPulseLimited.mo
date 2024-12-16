within Hackaton2024.Source;
block BooleanPulseLimited
  parameter Real startTime;
  parameter Real dutyCycle;
  parameter Real period;
  parameter Integer nPulses;

  Real timeSinceStart;
//  Integer pulseCounter(start = 0);
  Boolean pulseState(start = false);
  Real endTime;
  Modelica.Blocks.Interfaces.BooleanOutput y annotation(
    Placement(transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {40, 2}, extent = {{-10, -10}, {10, 10}})));
  
  
equation
  endTime = startTime + nPulses * period - ((1-dutyCycle)/2) * period;
  timeSinceStart = time - startTime;
  if time <= startTime then
    pulseState = false;
  elseif time >= endTime then
    pulseState = false; 
  elseif mod(timeSinceStart, period) < dutyCycle * period then
      pulseState=true;
  else
      pulseState=false;
  end if;
    
  y = pulseState;
  
annotation(
    Diagram(graphics = {Rectangle(origin = {2, 1}, extent = {{-32, 37}, {32, -37}})}),
    Icon(graphics = {Rectangle(extent = {{-40, 40}, {40, -40}})}),
    uses(Modelica(version = "4.0.0")));
end BooleanPulseLimited;
