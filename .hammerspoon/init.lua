hs.window.animationDuration = 0

-- Hyper key F18

hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper) is released
function exitHyperMode()
  hyper:exit()
--  if not hyper.triggered then
--    hs.eventtap.keyStroke({}, 'ESCAPE')
--  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

shortcuts = {
  ['a'] = 'App Store',
  ['b'] = 'Google Chrome',
  ['c'] = 'Activity Monitor',
  ['e'] = 'Equator',
  ['f'] = 'Figma',
  ['g'] = 'GoLand',
  ['i'] = 'Signal',
  ['j'] = 'IntelliJ IDEA',
  ['k'] = 'Karabiner-Elements',
  ['m'] = 'Messenger',
  ['o'] = 'Microsoft Teams',
  ['r'] = 'Kindle',
  ['s'] = 'Slack',
  ['t'] = 'iTerm',
  ['w'] = 'WhatsApp',
  ['x'] = 'System Preferences',
  ['z'] = 'zoom.us',
}

function __genOrderedIndex( t )
  local orderedIndex = {}
  for key in pairs(t) do
      table.insert( orderedIndex, key )
  end
  table.sort( orderedIndex )
  return orderedIndex
end

function orderedNext(t, state)
  local key = nil
  if state == nil then
    t.__orderedIndex = __genOrderedIndex( t )
    key = t.__orderedIndex[1]
  else
    for i = 1,table.getn(t.__orderedIndex) do
      if t.__orderedIndex[i] == state then
        key = t.__orderedIndex[i+1]
      end
    end
  end
  if key then
    return key, t[key]
  end
  t.__orderedIndex = nil
  return
end

function orderedPairs(t)
  return orderedNext, t, nil
end

for key, program in pairs(shortcuts) do
  hyper:bind({}, key, function()
    hs.application.open(program)
  end)
  hyper:bind({'shift'}, key, function()
    hs.application(program):kill()
  end)
end

hyper:bind({}, '/', function()
  message = ''
  for key, program in orderedPairs(shortcuts) do
    message = message .. key .. ': ' .. program .. '\n'
  end
  hs.alert(message)
end)

