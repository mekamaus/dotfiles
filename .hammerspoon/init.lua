-- Sends "escape" if "caps lock" is held for less than .2 seconds, and no other keys are pressed.

local modifier_delay = 0.2

local send_escape = false
local ctrl_pressed = false
local control_timer = hs.timer.delayed.new(modifier_delay, function()
  send_escape = false
end)


function onCtrlPressed()
  send_escape = true
  control_timer:start()
end

function onCtrlReleased()
  if send_escape then
    hs.eventtap.event.newKeyEvent('escape', true):post()
    hs.eventtap.event.newKeyEvent('escape', false):post()
  end
  control_timer:stop()
end

hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(evt)
  local new_ctrl_pressed = evt:getFlags()["ctrl"]
  if ctrl_pressed == new_ctrl_pressed then
    return false
  end
  ctrl_pressed = new_ctrl_pressed
  if ctrl_pressed then
    onCtrlPressed()
  else
    onCtrlReleased()
  end
  return false
end):start()

hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
  send_escape = false
  return false
end):start()

-- Hyper key F18

hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is released
function exitHyperMode()
  hyper:exit()
--  if not hyper.triggered then
--    hs.eventtap.keyStroke({}, 'ESCAPE')
--  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

hyper:bind({}, 't', function()
  hs.application.open('iTerm')
end)

hyper:bind({}, 'b', function()
  hs.application.open('Google Chrome')
end)

hyper:bind({}, 'i', function()
  hs.application.open('Signal')
end)

hyper:bind({}, 's', function()
  hs.application.open('Slack')
end)

hyper:bind({}, 'x', function()
  hs.application.open('System Preferences')
end)

hyper:bind({}, 'g', function()
  hs.application.open('GoLand')
end)
