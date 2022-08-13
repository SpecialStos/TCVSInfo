Config = {}

--IMPORTANT STUFF--
Config.CheckVersion = true
Config.Framework = "ESX" --Set this to your framework. "ESX" - "QBUS" - "NONE"
Config.Database = "OXMYSQL" --MYSQLA for MySqlAsync, GHMATTI for ghmattimysql, OXMYSQL  for oxMySQL
Config.DespawnCheck = false --Set only true to QBCore. This should be enabled only if you have vehicles despawning.
Config.DebugPolyZones = false --Enable/Disable to see the debug grid of all Polyzones. Insurance, impound, and garages.

Config.DiscordLogsEnabled = false --COMMING SOON
Config.DiscordLogsColour = "red" --COMMING SOON, Possible colours: blue, green, white, black, red, orange, lightrgreen, yellow, turqois, pink.
--IMPORTANT STUFF--
Config.DiscordLogsLinks = {
    GarageLogs = "Change-Me-With-Your-Discord-Webhook-Link", --COMMING SOON
    ImpoundLogs = "Change-Me-With-Your-Discord-Webhook-Link", --COMMING SOON
    InsuranceLogs = "Change-Me-With-Your-Discord-Webhook-Link", --COMMING SOON
    vehicleUpdatesLogs = "Change-Me-With-Your-Discord-Webhook-Link", --COMMING SOON
    CheatingLogs = "Change-Me-With-Your-Discord-Webhook-Link", --COMMING SOON
}
Config.SQLUpdateTime = 60000 -- Updates database every 60 seconds. Only for vehicles with new values, for optimization.
Config.CustomIdentifier = false --Set this to true if you want to add custom identifiers (Multicharacter support), check frameworks.lua in serverside identifier function.
Config.WhitelistedJobs = {
    "police",
    "police2", --Add as many jobs you want, used for /impound.
}

--IMPORTANT STUFF--

--Vehicle Parts--
Config.UseParts = true --Set this to off if you do not want to have parts.
Config.Parts = {
    MetricSystem = "KM", --COMING SOON, Switch this between ("KM" for kilometres - "MP" for miles)

    --Engine Stuff--
    OilChange = 1000, --How many km or miles till the car needs to change oil. On change oil the maths are Parts.DrivingDistance + Config.Parts.OilChange. So if you have 450.32 km already, next oil change will be at 1450.32
    EarlyOilProblems = 200, --How many km or miles till early oil heating can occur and degrade engine faster, chance below as well. Example if you have this 200 and oilchange 1000, early oil problems will start from 800.
    LateOilProblems = 200, --How many km or miles till very bad problems occur to the engine's vehicle. (Oil spillage, intense overheating, possible explosion of vehicle when vehicle is super overheated)
    OilProblemsOilSpillageChance = 5, --Chance %, default set to 5%. Chances of vehicle catching fire after late oil problems.
    OilProblemsFireChance = 5, --Chance %, default set to 5%. Chances of vehicle catching fire after late oil problems, will only occur if car does overheat at maximum and has a oil spillage.

    NotWarmedUpEngineDamageChance = 5, --Chance %, if the vehicle hasn't warmed up and the person drives then there's a chance the vehicle can be damaged completely. This chance maximum value is now set 1% despite of it being 5%. Just some math bs i did. The higher the temperature the less the chance of this happening. This is only for second and third faze of RPM! So basically if you rev it up like an asshole withour warming it up. 

    --THIS ARE RPM PHASES, NOT ACTUAL DAMAGE!-- WE HAVE 3 PHASES
    EngineDegradation1stPhaseRPM = 0.50, --Light damage on engine. Minimum 0.0, Maximum 1.0. Car idling on the road is 0.2. So reconsider if you want lower than 0.3
    EngineDegradation2ndPhaseRPM = 0.65, --Medium damage on engine.
    EngineDegradation3rdPhaseRPM = 0.80, --Maximum damage on engine.

    --DAMAGE BASED ON RPM PHASES HERE!
    EngineDegradation1stPhaseValue = 0.005, --Light damage on engine based on the RPM above. This runs every second. Don't set it to high or everyone's car will just need servicing
    EngineDegradation2ndPhaseValue = 0.025, --Medium damage on engine based on the RPM above.
    EngineDegradation3rdPhaseValue = 0.050, --Maximum damage on engine based on the RPM above.

    EarlyOilProblemsExtraEngineDegradation = 0.010, --Extra damage on engine if you haven't changed oil. Early stage. oil change distance needed - 200
    OilProblemsExtraEngineDegradation = 0.050, -- Extra damage again, oil change distance needed + 0-199
    LateOilProblemsExtraEngineDegradation = 0.500, --Extra damage on engine if you haven't changed oil. Last stage, oil change distance needed + 200
    --Engine Stuff--

    --GEARBOX STUFF--
    EarlyGearboxProblemsChance = 5, --Chance of gearbox getting stuck. only when gearbox reaches 300 hp.
    --GEARBOX STUFF--

    --BATTERY STUFF-
    BatteryWearEvery10XYZDistance = 0.015, 
    BatteryMalfunctionChance = 5, --Chance of battery issues. only when battery reaches 300 hp.
    --BATTERY STUFF

    --TYRE STUFF--
    TyreWearEvery10XYZDistance = 0.005, --Tyres degrade on XYZ distance, slowly slowly grip goes down unless less than 300 hp.
    TyreBurstChance = 5, --You get the idea here. below 150 hp.
    --TYRE STUFF--

    --BRAKE STUFF--
    BrakeWearEvery10XYZDistance = 0.003,
    --BRAKE STUFF--

    --CATALYST STUFF--
    CatalystWearEvery10XYZDistance = 0.001,
    --CATALYST STUFF--

    --RADIATOR STUFF--
    RadiatorWearEvery10XYZDistance = 0.003,
    --CRASH VALUES--

    --Normal crash is when body health of crash is from 20-60, if it is more then it is considered as a big crash.

    EngineCrashChance = 0, --I turned this off since gta itself fucks up your engine, enable it if you want faster crashing
    EngineCrashMultiplier = { [1] = 100, [2] = 300 },
    EngineBigCrashMultiplier = {[1] = 300, [2] = 500},

    RadiatorCrashChance = 100,
    RadiatorCrashMultiplier = { [1] = 100, [2] = 200 },
    RadiatorBigCrashMultiplier = {[1] = 300, [2] = 500},

    GearboxCrashChance = 20,
    GearboxCrashMultiplier = { [1] = 100, [2] = 300 },
    GearboxBigCrashMultiplier = {[1] = 300, [2] = 500},

    TyresCrashChance = 10,
    TyresCrashMultiplier = { [1] = 1, [2] = 5 },
    TyresBigCrashMultiplier = {[1] = 5, [2] = 10},

    AxleCrashChance = 50,
    AxleCrashMultiplier = { [1] = 100, [2] = 200 },
    AxleBigCrashMultiplier = {[1] = 300, [2] = 500},

    BrakesCrashChance = 10,
    BrakesCrashMultiplier = { [1] = 50, [2] = 75 },
    BrakesBigCrashMultiplier = {[1] = 300, [2] = 500},

    CatalystCrashChance = 10,
    CatalystCrashMultiplier = { [1] = 100, [2] = 300 },
    CatalystBigCrashMultiplier = {[1] = 300, [2] = 500},

    SuspensionCrashChance = 20,
    SuspensionCrashMultiplier = { [1] = 100, [2] = 300 },
    SuspensionBigCrashMultiplier = {[1] = 300, [2] = 500},

    FuelTankCrashChance = 5,
    FuelTankCrashMultiplier = { [1] = 1, [2] = 5 },
    FuelTankBigCrashMultiplier = {[1] = 5, [2] = 20},

    BatteryCrashChance = 25,
    BatteryCrashMultiplier = { [1] = 100, [2] = 300 },
    BatteryBigCrashMultiplier = {[1] = 300, [2] = 500},
    --CRASH VALUES--
}
--Vehicle Parts--

Config.KeepEngineRunning = true --Leaves the engine running when you get outside of the vehicle.
Config.ToggleEngine = true
Config.ToggleEngineButton = 'Y'
Config.LockButton = 'U' --We are using commands for this. So default is U, it is controller friendly.
Config.HotwiringSpeed = {0.3, 1.1} --Ou lala, hotwiring speed. Basically this is how fast hotwire process is, just make the values bigger if you want a faster hotwiring.
Config.HotwiringSpeedAccelerator = {30.0, 150.0} --THIS IS A BOOST! On key pressed (W) you get a boost in the hotwiring process. Downside is if they spam it there is a small chance the vehicle explodes, hh.

Config.Garages = { --FOR NEW GARAGES, only add them here through config! If you want to check the boxes and play around with them, simply enable debug grid.
    [1] = {
        price = 100, --Price for the garage
        polyzone = {coords=vector4(-353.65, 6263.19, 31.49, 135.0), p1=0.7, p2=0.6, p3 = 0.5, maxZ = 1.5, minZ = 1.5, distanceBelow = 20.0}, --Okay so, we are using vector 4 coords for x,y,z and heading. p1,p2,p3 are responsible for the box dimensions. MaxZ is how taller the box will be from the vector4.z value. minZ same logic, and lastly distance below is how far below the garage shell will spawn.
        taken = false
    },
    [2] ={
        price = 100, --Price for the garage
        polyzone = {coords=vector4(-341.76, 6241.19, 31.49, 220.0), p1=0.7, p2=0.6, p3 = 0.5, maxZ = 1.5, minZ = 1.5, distanceBelow = 20.0},
        taken = false
    }
}

Config.Impound = {
    blip = vector3(410.66049194336,-1638.5622558594,29.291938781738),
    location = {
        markerLocation = vector3(409.38,-1623.08,29.29),
        minZ = 28.00,
        maxZ = 31.50,
        impoundPoly = {
            [1] = vector2(388.09405517578,-1641.9825439453),
            [2] = vector2(408.11010742188,-1617.8790283203),
            [3] = vector2(422.52017211914,-1628.6279296875),
            [4] = vector2(422.48126220703,-1644.8558349609),
            [5] = vector2(409.98333740234,-1659.3662109375)
        }
    },
    ImpoundRetrieverLocations = {
        [1] = {
            location = vector4(410.75, -1636.66, 29.19, 230.00),
            isUsed = false
        },
        [2] = {
            location = vector4(409.14, -1639.11, 29.19, 230.00),
            isUsed = false
        },
        [3] = {
            location = vector4(395.79, -1644.79 ,29.19, 320.00),
            isUsed = false
        },
        [4] = {
            location = vector4(398.26,-1646.80,29.19, 320.00),
            isUsed = false
        },
        [5] = {
            location = vector4(401.01,-1648.64,29.19, 320.00),
            isUsed = false
        },
        [6] = {
            location = vector4(403.51,-1650.50,29.19, 320.00),
            isUsed = false
        },
        [7] = {
            location = vector4(405.94,-1652.52,29.19, 320.00),
            isUsed = false
        },
    }
}

Config.Insurance = {
    blip = vector3(-837.11,-273.56,38.80),
    standardPrice = 1000.00,
    location = {
        markerLocation = vector3(-837.11,-273.56,38.80),
        minZ = 35.50,
        maxZ = 42.00,
        insurancePoly = {
            [1] = vector2(-819.77899169922,-288.01638793945),
            [2] = vector2(-809.41369628906,-279.53735351563),
            [3] = vector2(-825.23651123047,-248.90631103516),
            [4] = vector2(-869.95056152344,-234.01103210449),
            [5] = vector2(-849.47595214844,-275.17581176758)
        },
    },
    InsuranceRetrieverLocations = {
        [1] = {
            location = vector4(-859.26, -265.32, 39.34, 150.00),
            isUsed = false
        },
        [2] = {
            location = vector4(-863.41, -263.29, 39.45, 133.50),
            isUsed = false
        },
    }
}