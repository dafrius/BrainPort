joy = HebiJoystick(1);
while true
  [axes, buttons, povs] = read(joy);
  if any(buttons)
    disp(['Pressed buttons: ' num2str(find(buttons))]);
  end
  pause(0.1);
end