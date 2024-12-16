within Hackaton2024.Source;
block BooleanPulseSuperpolated

  parameter Real startTime;
  parameter Real dutyCycleShort;
  parameter Real periodShort;
  parameter Integer nPulsesShort;
  parameter Real dutyCycleLong;
  parameter Real periodLong;
  parameter Integer nPulsesLong;

  Real timeSinceStartShort;
//  Integer pulseCounter(start = 0);
  Boolean pulseState(start = false);
  Real endTimeShort;
  Real timeSinceStartLong;
  Real endTimeLong;
  Boolean pulseStateLong(start = false);
  Modelica.Blocks.Interfaces.BooleanOutput y annotation(
    Placement(transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {40, 2}, extent = {{-10, -10}, {10, 10}})));
  
  
equation
  endTimeShort = startTime + nPulsesShort * periodShort - ((1-dutyCycleShort)/2) * periodShort;
  endTimeLong = startTime + nPulsesLong * periodLong - ((1-dutyCycleLong)/2) * periodLong;
  timeSinceStartShort = time - startTime;
  timeSinceStartLong = time - startTime;
  if time <= startTime then
    pulseState = false;
  elseif time >= endTimeShort then
    pulseState = false; 
  elseif mod(timeSinceStartShort, periodShort) < dutyCycleShort * periodShort then
      pulseState=true;
  else
      pulseState=false;
  end if;
  
  if time <= startTime then
    pulseStateLong = false;
  elseif time >= endTimeLong then
    pulseStateLong = false; 
  elseif mod(timeSinceStartLong, periodLong) < dutyCycleLong * periodLong then
      pulseStateLong=true;
  else
      pulseStateLong=false;
  end if;
    
  if pulseState and pulseStateLong then
    y = true;
  else
    y = false;
  end if;
  
annotation(
    Diagram(graphics = {Rectangle(origin = {2, 1}, extent = {{-32, 37}, {32, -37}})}),
    Icon(graphics = {Rectangle(extent = {{-40, 40}, {40, -40}})}),
    uses(Modelica(version = "4.0.0")));

end BooleanPulseSuperpolated;
