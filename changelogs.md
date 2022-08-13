## V1.0.1

1) Fixed some general issues with MySQLAsync
2) Fixed some typos.
3) Fixed hasMoney function. (Forgot to add price sending)
4) Decrypted bunch of code you would need.

## V1.0.2

1) Fixed hasMoney function again, for some reason sometimes the value was a string.
2) Added Y button for Engine on/off, Disable from Config.

## V1.0.3
1) Fixed Hotwire text when someone crashes into you
3) Added functionality for Drift Tyres. New native for game build 2699.

## V1.0.4
1) Added full compatibility for both QbCore and ESX, so basically this is a drag and drop resource now.
1) Added Blip syncing when someone purchases a garage.

## V1.0.5
1) Fixed minor bugs with commands. You need to update because givegaragekeys won't work. (I swear building something big, every single small bit of code can break anything, my old gaming company always used to say this to me lol.)
2) Fixed some SQL queries.
3) Updates garages.lua,locksystem.lua minor bug.
4) Added on player loaded event. client/frameworks.lua

## V1.0.6
1) Removed timer since we are using on player load

## V1.0.7
1) Added Loading Timers to ensure nothing will bug out server side.
2) Rewrote code for vehicle plate finder. (Supports spaces in-between the text now.)

## V1.0.8
1) Changed GetVehicleInDirection() function.
2) Changed impound,vehiclekeys,givevehiclekeys command. Gets the closest vehicle now, not in direction.
3) Fixed a weird bug with driving distance not bringing back value of 0.01, but it was bringing back 0.00999
4) Fixed some CSS (Thanks to iSentrie)
5) Added some more things into vehicle syncing.
6) Added on resource restart for the data to come again.
7) Fixed hotwiring not popping up on second attempt

## V1.0.9
1) Fixed an issue with plates having spaces. Some servers worked some not, added a fix
2) Added 2 methods of getting closest vehicles for locksystem.
3) Added a new export for getting vehicle data client sided.
4) Added Config.DespawnCheck if vehicles despawn. Used mostly for QBCore

## V1.1.0
1) Added Config.UseParts, to disable/enable parts.
2) Added a new export exports['realisticVehicleSystem']:giveVehicleKeysExtra(plate), gives temporarily vehicle keys to player with the car with those plates, can be used anywhere.
3) Fixed some minor bugs, can't even remember. Coding too much.

## V1.1.1
1) Added some more vehicle part fixing export and trigger event.
2) Fixed some minor bugs (getting vehicleID for our table)