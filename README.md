# Love Project

## Ting jeg har lært:
- Brug en .luarc.json to define global libraries og andre indstillinger for lua-language-server

- Positions systemet i Love (X og Y) starter i toppen af venstre side
    - Positiv Y-værdi går nedad på skærmen
    - Positiv X-værdi går til højre på skærmen
    - Et billede bliver derfor også renderet med samme logik

## Lua som OOP
I Lua kan man lave OOP med tables. Definer et tomt table i starten af en fil. Med love2d kan man lave en "__init__" med og hertil metoder med:
```lua 
table = {}
function table:load() end

function table:someMethod() end
```
