## The Complete Vehicle System by Cisoko (Voxit)

Firstly thanks for purchasing this resource, this Markdown file will help you install it properly, but it doesn't require any special knowledge.

1) Run the SQL files into your database.
2) Setup the config accordingly.
3) If you do want Multicharacter support, please head over into server/frameworks.lua and add in the identifier functions your code, i do have an example there for QBUS.
4) IN CASE YOU ARE USING OXMYSQL OR MYSQLASYNC DON'T FORGET TO ADD THIS in fxmanifest.lua in server-scripts
    '@oxmysql/lib/MySQL.lua', -- for OXMYSQL
    '@mysql-async/lib/MySQL.lua', --for MYSQLASYNC
5)Download PolyZones and meta_libs from https://github.com/meta-hub

BTW GARAGES ARE CREATED FROM CONFIG! No need to add them by yourself into the database unless you know exactly what you are doing, you can edit my code on server/database.lua

That's it for setting it up. Here's some useful information you can use for Vehicle Shop and Mechanic Shops.

When purchasing a vehicle you do need to trigger this event, this event will add the vehicle into the database will all values and will spawn the vehicle at coords given.

## TriggerServerEvent("realisticVehicleSystem:server:addVehicle", `baller2`, vector4(coords.x, coords.y, coords.z, heading), identifier)

So, send first the hash of the vehicle, in this case i am getting the hash by doing `baller2`, this automatically gives me the hash for the vehicle baller 2.
You may as well just use GetHashKey("baller2").

Second we have vector 4 values. x,y,z is the location the vehicle will spawn, and heading for the vehicle (direction which the vehicle will be facing)

Third identifier. YOU DO NOT NEED TO SEND AN IDENTIFIER IF YOU ARE SENDING IT FROM CLIENT!!! It does it automatically so if you don't know what you're doing exactly just use this trigger event on vehicle purchase: 

## TriggerServerEvent("realisticVehicleSystem:server:addVehicle", `baller2`, vector4(coords.x, coords.y, coords.z, heading))

Okay, lets move now into fixing parts themselves. So basically we have a built in function, with an export (Export allows you to call the function from any resource).

In case you do want to fix a part of the vehicle just add this function into your code.

##  exports['realisticVehicleSystem']:fixPart(partName, newHP, respawnVehicle)

So basically partName should be the part of the vehicle, IT MUST BE A STRING!
Second the new HP the part should have. From 0-1000, it is better to use decimals as well. So for example 1000.000 (3 decimals)
And lastly respawnVehicle, this is a boolean. Set this to true if you do want on fixing parts to fix handlings of the vehicle. You will not see any effect on respawning as
it happens instantly.

Example for function:
## exports['realisticVehicleSystem']:fixPart("engine", 1000.000, true)

If you want to see the fix part function, you may find it inside configs/functions.lua

So that's basically it regarding the vehicle system. If you do have any issues, please hop up into our discord server: https://discord.com/invite/MhPdedxY7y

My Personal Discord is: Cisoko#0001

## I left 5 vehicles spawned at popular garage in legion square. Here's the coords: 225.66 -803.8 29.97
## As well 2 garages.

Thanks a lot again, have fun and stay safe!

New resources are coming out very very soon! Even more revolutionary ones.

