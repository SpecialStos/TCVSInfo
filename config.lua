Config = {}

--IMPORTANT STUFF--
Config.CheckVersion = true
Config.Framework = "QBUS" --Set this to your framework. "ESX" - "QBUS" - "NONE"
Config.Database = "OXMYSQL" --MYSQLA for MySqlAsync, GHMATTI for ghmattimysql, OXMYSQL  for oxMySQL
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
Config.CustomIdentifier = true --Set this to true if you want to add custom identifiers (Multicharacter support), check frameworks.lua in serverside identifier function.
Config.WhitelistedImpoundJobs = {
    "police",
    "police2", --Add as many jobs you want, used for /impound.
}

Config.VehicleJobs = {
    "police",
    "ambulance", --Add as many jobs you want, used for shared vehicles among the job.
}
Config.DespawnCheck = true --Checks if any vehicles were despawned and respawns them. Set to true only for QBCore servers. If you do not have any despawn issues just set this to false.
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

    --Normal crash is when body health of crash is from 10-19, if it is more then it is considered as a big crash. Change the values from here depending on your server's handlings.
    BodyHealthLostToBeConsideredAsSmallCrash = 10,
    BodyHealthLostToBeConsideredAsBigCrash = 20,
    
    EngineCrashChance = 20, --I turned this off since gta itself fucks up your engine, enable it if you want faster crashing
    EngineCrashMultiplier = { [1] = 100, [2] = 300 },
    EngineBigCrashMultiplier = {[1] = 300, [2] = 500},

    RadiatorCrashChance = 30,
    RadiatorCrashMultiplier = { [1] = 100, [2] = 200 },
    RadiatorBigCrashMultiplier = {[1] = 300, [2] = 500},

    GearboxCrashChance = 20,
    GearboxCrashMultiplier = { [1] = 100, [2] = 300 },
    GearboxBigCrashMultiplier = {[1] = 300, [2] = 500},

    TyresCrashChance = 10,
    TyresCrashMultiplier = { [1] = 1, [2] = 5 },
    TyresBigCrashMultiplier = {[1] = 5, [2] = 50},

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

    FuelTankCrashChance = 15,
    FuelTankCrashMultiplier = { [1] = 1, [2] = 50 },
    FuelTankBigCrashMultiplier = {[1] = 25, [2] = 100},

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

Config.UsePublicGarages = true
Config.PublicGarages = {
    [1] = {
        type = "ground-vehicle", --City, legion square.
        location = {
            putInMarkerLocation = vector3(213.34, -795.86, 30.86),
            takeOutMarkerLocation = vector3(215.26, -809.97, 30.74),
            spawnLocations = {
                [1] = {location = vector4(216.72, -801.96, 30.79, 67.37)},
                [2] = {location = vector4(218.75, -796.99, 30.76, 69.54)},
                [3] = {location = vector4(220.7, -792.02, 30.75, 67.33)},
                [4] = {location = vector4(222.16, -786.73, 30.77, 68.64)},
                [5] = {location = vector4(223.85, -781.76, 30.76, 67.67)},
                [6] = {location = vector4(225.82, -776.75, 30.77, 68.0)},
                [7] = {location = vector4(227.49, -771.52, 30.78, 69.0)},
                [8] = {location = vector4(232.81, -773.66, 30.74, 249.73)},
                [9] = {location = vector4(231.03, -778.82, 30.71, 248.7)},
                [10] = {location = vector4(229.01, -783.87, 30.71, 246.81)},
                [11] = {location = vector4(227.47, -789.03, 30.69, 250.53)},
                [12] = {location = vector4(225.6, -794.06, 30.67, 247.21)},
                [13] = {location = vector4(223.97, -799.25, 30.66, 254.86)},
                [14] = {location = vector4(221.89, -804.06, 30.68, 250.21)}
            },
            minZ = 28.00,
            maxZ = 37.50,
            garagePoly = {
                [1] = vector2(239.88, -820.42),
                [2] = vector2(200.06, -805.74),
                [3] = vector2(230.57, -725.11),
                [4] = vector2(273.99, -739.98),
            }
        },
    },
    [2] = {
        type = "ground-vehicle", --City, close to pacific bank
        location = {
            putInMarkerLocation = vector3(363.38, 284.58, 103.39),
            takeOutMarkerLocation = vector3(363.92, 297.93, 103.5),
            spawnLocations = {
                [1] = {location = vector4(371.06, 284.27, 103.25, 342.52)},
                [2] = {location = vector4(374.68, 283.06, 103.18, 337.73)},
                [3] = {location = vector4(378.65, 281.69, 103.11, 339.75)},
                [4] = {location = vector4(392.65, 280.2, 102.99, 66.88)},
                [5] = {location = vector4(391.2, 276.66, 103.0, 67.64)},
                [6] = {location = vector4(389.79, 272.94, 103.0, 65.43)},
                [7] = {location = vector4(388.56, 269.39, 103.01, 69.52)},
                [8] = {location = vector4(379.01, 264.26, 103.01, 338.0)}
            },
            minZ = 102.0,
            maxZ = 107.5,
            garagePoly = {
                [1] = vector2(387.77, 257.74),
                [2] = vector2(399.81, 290.78),
                [3] = vector2(358.64, 302.27),
                [4] = vector2(349.74, 271.67),
            }
        },
    },
    [3] = {
        type = "ground-vehicle", --Sandy
        location = {
            putInMarkerLocation = vector3(1561.78, 3792.08, 34.11),
            takeOutMarkerLocation = vector3(1537.62, 3780.15, 34.58),
            spawnLocations = {
                [1] = {location = vector4(1546.17, 3782.35, 34.06, 208.09)},
                [2] = {location = vector4(1542.69, 3780.58, 34.05, 205.52)},
                [3] = {location = vector4(1523.5, 3767.27, 34.05, 220.78)},
                [4] = {location = vector4(1516.87, 3762.87, 34.03, 201.16)},
                [5] = {location = vector4(223.85, -781.76, 30.76, 67.67)}
            },
            minZ = 28.00,
            maxZ = 37.50,
            garagePoly = {
                [1] = vector2(1568.83, 3810.35),
                [2] = vector2(1580.98, 3791.72),
                [3] = vector2(1446.42, 3711.5),
                [4] = vector2(1438.47, 3732.44),
            }
        },
    },
    [4] = {
        type = "ground-vehicle", --Paleto
        location = {
            putInMarkerLocation = vector3(-144.06, 6354.59, 31.49),
            takeOutMarkerLocation = vector3(-136.54, 6357.24, 31.49),
            spawnLocations = {
                [1] = {location = vector4(-150.01, 6362.12, 31.49, 226.62)},
                [2] = {location = vector4(-152.41, 6359.65, 31.49, 227.08)},
                [3] = {location = vector4(-136.06, 6346.42, 31.49, 50.72)},
                [4] = {location = vector4(-133.7, 6349.0, 31.49, 46.17)}
            },
            minZ = 28.00,
            maxZ = 37.50,
            garagePoly = {
                [1] = vector2(-140.73, 6338.8),
                [2] = vector2(-128.39, 6350.46),
                [3] = vector2(-144.97, 6371.91),
                [4] = vector2(-159.33, 6357.65),
            }
        },
    },
    [5] = {
        type = "helicopter-vehicle", --Helipads on ls airport
        location = {
            putInMarkerLocation = vector3(-1112.39, -2883.75, 13.95),
            takeOutMarkerLocation = vector3(-1134.0, -2871.42, 13.95),
            spawnLocations = {
                [1] = {location = vector4(-1145.99, -2864.48, 13.95, 149.74)},
                [2] = {location = vector4(-1178.4, -2845.72, 13.95, 152.06)},
            },
            minZ = 12.00,
            maxZ = 20.50,
            garagePoly = {
                [1] = vector2(-1106.1, -2904.94),
                [2] = vector2(-1200.56, -2856.52),
                [3] = vector2(-1183.28, -2826.12),
                [4] = vector2(-1090.85, -2877.95),
            }
        },
    },
    [6] = {
        type = "aircraft-vehicle", --Hangar at ls airport
        location = {
            putInMarkerLocation = vector3(-1260.96, -3362.08, 13.95),
            takeOutMarkerLocation = vector3(-1238.7, -3387.7, 13.94),
            spawnLocations = {
                [1] = {location = vector4(-1271.3, -3380.55, 13.94, 328.4)}
            },
            minZ = 12.00,
            maxZ = 25.50,
            garagePoly = {
                [1] = vector2(-1210.09, -3355.09),
                [2] = vector2(-1273.24, -3318.69),
                [3] = vector2(-1315.39, -3402.47),
                [4] = vector2(-1267.22, -3430.84),
            }
        },
    },
    [7] = {
        type = "boat-vehicle", --Normal docks. Close to pier
        location = {
            putInMarkerLocation = vector3(-857.04, -1371.9, 1.1),
            takeOutMarkerLocation = vector3(-843.95, -1366.79, 1.61),
            spawnLocations = {
                [1] = {location = vector4(-844.67, -1361.32, 0.00, 111.07)},
                [2] = {location = vector4(-840.77, -1371.06, 0.00, 110.05)},
            },
            minZ = 0.00,
            maxZ = 10.00,
            garagePoly = {
                [1] = vector2(-893.4, -1336.92),
                [2] = vector2(-861.72, -1424.83),
                [3] = vector2(-816.23, -1410.11),
                [4] = vector2(-849.67, -1316.42),
            }
        },
    },
    [8] = {
        type = "helicopter-vehicle", --Sandy Shores airport
        location = {
            putInMarkerLocation = vector3(1770.47, 3239.86, 42.13),
            takeOutMarkerLocation = vector3(1763.47, 3229.51, 42.41),
            spawnLocations = {
                [1] = {location = vector4(1770.47, 3239.86, 42.13, 101.31)}
            },
            minZ = 39.00,
            maxZ = 47.00,
            garagePoly = {
                [1] = vector2(1781.17, 3231.89),
                [2] = vector2(1776.44, 3251.01),
                [3] = vector2(1758.27, 3247.14),
                [4] = vector2(1758.81, 3225.77),
            }
        },
    },
    [9] = {
        type = "aircraft-vehicle", --Sandy Shores airport
        location = {
            putInMarkerLocation = vector3(1736.43, 3291.25, 41.15),
            takeOutMarkerLocation = vector3(1723.09, 3306.59, 41.22),
            spawnLocations = {
                [1] = {location = vector4(1731.72, 3309.15, 41.22, 194.66)}
            },
            minZ = 39.00,
            maxZ = 47.00,
            garagePoly = {
                [1] = vector2(1727.36, 3274.98),
                [2] = vector2(1754.76, 3282.29),
                [3] = vector2(1740.25, 3332.11),
                [4] = vector2(1713.05, 3324.89),
            }
        },
    },
}

Config.UsePrivateGarages = true
Config.PrivateGarages = { --FOR NEW GARAGES, only add them here through config! If you want to check the boxes and play around with them, simply enable debug grid.
    [1] = {
        price = 100, --Price for the garage
        polyzone = {coords=vector4(-353.65, 6263.19, 31.49, 135.0), p1=0.7, p2=0.6, p3 = 0.5, maxZ = 1.5, minZ = 1.5, distanceBelow = 20.0}, --Okay so, we are using vector 4 coords for x,y,z and heading. p1,p2,p3 are responsible for the box dimensions. MaxZ is how taller the box will be from the vector4.z value. minZ same logic, and lastly distance below is how far below the garage shell will spawn.
        shell = "shell_garagem",
        shellLocation = vector3(-443.82, 8715.47, 589.76),
        vehicleShellOffset = vector3(0.0, 0.0, 0.0), --This is used 
        onFootShellOffset = vector3(13.5, 1.64, 0.0),
    },
    [2] ={
        price = 100, --Price for the garage
        polyzone = {coords=vector4(-341.76, 6241.19, 31.49, 220.0), p1=0.7, p2=0.6, p3 = 0.5, maxZ = 1.5, minZ = 1.5, distanceBelow = 20.0},
        shell = "shell_garagem",
        shellLocation = vector3(-443.82, 8715.47, 589.76),
        vehicleShellOffset = vector3(0.0, 0.0, 0.0), --This is used 
        onFootShellOffset = vector3(13.5, 1.64, 0.0),
    },
}

Config.Impound = {
    [1] = { --Main City impound lot. At that PD that is made out of bricks.
        type = "ground-vehicles",
        blip = vector3(410.66049194336,-1638.5622558594,29.291938781738),
        location = {
            markerLocation = vector3(409.38,-1623.08,29.29),
            minZ = 28.00,
            maxZ = 31.50,
            impoundPoly = {
                [1] = vector2(409.56, -1615.87),
                [2] = vector2(388.13, -1641.94),
                [3] = vector2(410.95, -1660.62),
                [4] = vector2(428.79, -1636.22)
            }
        },
        ImpoundRetrieverLocations = {
            [1] = {
                location = vector4(410.75, -1636.66, 29.19, 230.00),
            },
            [2] = {
                location = vector4(409.14, -1639.11, 29.19, 230.00),
            },
            [3] = {
                location = vector4(395.79, -1644.79 ,29.19, 320.00),
            },
            [4] = {
                location = vector4(398.26,-1646.80,29.19, 320.00),
            },
            [5] = {
                location = vector4(401.01,-1648.64,29.19, 320.00),
            },
            [6] = {
                location = vector4(403.51,-1650.50,29.19, 320.00),
            },
            [7] = {
                location = vector4(405.94,-1652.52,29.19, 320.00),
            },
        }
    },
    [2] = {
        type = "ground-vehicles",
        blip = vector3(1856.22, 3715.43, 33.2),
        location = {
            markerLocation = vector3(1853.1, 3706.68, 33.19),
            minZ = 32.00,
            maxZ = 36.50,
            impoundPoly = {
                [1] = vector2(1866.5, 3707.56),
                [2] = vector2(1838.18, 3691.55),
                [3] = vector2(1832.09, 3706.14),
                [4] = vector2(1859.44, 3721.27)
            }
        },
        ImpoundRetrieverLocations = {
            [1] = {
                location = vector4(1856.68, 3715.09, 33.24, 28.73),
            },
            [2] = {
                location = vector4(1862.03, 3705.84, 33.38, 29.99),
            }
        }
    },
    [3] = {
        type = "aircraft-vehicles",
        blip = vector3(-941.35, -2955.01, 13.95),
        location = {
            markerLocation = vector3(-941.35, -2955.01, 13.95),
            minZ = 12.00,
            maxZ = 27.50,
            impoundPoly = {
                [1] = vector2(-956.76, -2967.29),
                [2] = vector2(-947.24, -2949.5),
                [3] = vector2(-938.17, -2956.09),
                [4] = vector2(-940.85, -2974.86)
            }
        },
        ImpoundRetrieverLocations = {
            [1] = {
                location = vector4(-944.81, -2976.22, 13.1, 150.37)
            },
        }
    },
    [4] = {
        type = "boat-vehicles",
        blip = vector3(-773.56, -1493.71, 2.88),
        location = {
            markerLocation = vector3(-773.56, -1493.71, 2.88),
            minZ = 0.00,
            maxZ = 8.50,
            impoundPoly = {
                [1] = vector2(-769.2, -1473.85),
                [2] = vector2(-755.1, -1509.99),
                [3] = vector2(-780.7, -1515.55),
                [4] = vector2(-790.34, -1481.52)
            }
        },
        ImpoundRetrieverLocations = {
            [1] = {
                location = vector4(-962.9, -2966.06, 13.95, 151.55),
            },
            [2] = {
                location = vector4(-962.25, -3006.43, 13.95, 329.64),
            },
            [3] = {
                location = vector4(-979.27, -2996.26, 13.95, 325.65),
            } 
        }
    },
    [5] = {
        type = "ground-vehicles",
        blip = vector3(-458.93, 6033.93, 31.34),
        location = {
            markerLocation = vector3(-458.93, 6033.93, 31.34),
            minZ = 30.00,
            maxZ = 35.50,
            impoundPoly = {
                [1] = vector2(-478.87, 6014.82),
                [2] = vector2(-450.46, 6041.35),
                [3] = vector2(-460.89, 6051.86),
                [4] = vector2(-488.3, 6024.39)
            }
        },
        ImpoundRetrieverLocations = {
            [1] = {
                location = vector4(-469.18, 6039.03, 31.34, 228.31),
            },
            [2] = {
                location = vector4(-472.48, 6035.34, 31.34, 220.41),
            },
            [3] = {
                location = vector4(-476.26, 6031.89, 31.34, 191.2),
            } 
        }
    },
}

Config.Insurance = {
    [1] = {
        blip = vector3(-837.11,-273.56,38.80),
        standardPrice = 1000.00,
        location = {
            markerLocation = vector3(-837.11,-273.56,38.80),
            minZ = 35.50,
            maxZ = 42.00,
            insurancePoly = {
                [1] = vector2(-836.63, -284.19),
                [2] = vector2(-849.19, -276.22),
                [3] = vector2(-840.36, -269.41),
                [4] = vector2(-832.27, -275.8)
            },
        },
        InsuranceRetrieverLocations = {
            [1] = {
                location = vector4(-859.26, -265.32, 39.34, 150.00),
            },
            [2] = {
                location = vector4(-863.41, -263.29, 39.45, 133.50),
            },
        }
    },
    [2] = {
        blip = vector3(-988.71, -3030.7, 13.95),
        standardPrice = 1000.00,
        location = {
            markerLocation = vector3(-988.71, -3030.7, 13.95),
            minZ = 12.00,
            maxZ = 27.50,
            insurancePoly = {
                [1] = vector2(-975.34, -3023.49),
                [2] = vector2(-989.27, -3015.37),
                [3] = vector2(-999.43, -3031.14),
                [4] = vector2(-985.22, -3039.06)
            },
        },
        InsuranceRetrieverLocations = {
            [1] = {
                location = vector4(-980.0, -2996.38, 13.1, 333.04),
            },

            [2] = {
                location = vector4(-962.09, -3006.41, 13.1, 347.48),
            },
        }
    },
    [3] = {
        blip = vector3(-850.69, -1498.46, 1.63),
        standardPrice = 1000.00,
        location = {
            markerLocation = vector3(-850.69, -1498.46, 1.63),
            minZ = 0.00,
            maxZ = 07.00,
            insurancePoly = {
                [1] = vector2(-862.02, -1511.12),
                [2] = vector2(-875.59, -1475.1),
                [3] = vector2(-856.35, -1465.1),
                [4] = vector2(-842.69, -1498.94)
            },
        },
        InsuranceRetrieverLocations = {
            [1] = {
                location = vector4(-851.38, -1493.21, 0.1, 291.52)
            }
        }
    }
}