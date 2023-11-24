Config = {}

--===================
--==    General    ==
--===================
--[[
    Distancen på hvor tæt på du skal være på en marker før den vises
    OBS: Skal være et decimal tal
    f.eks 25.0 - for 25
]]
Config.DrawDistance = 25.0

-- RGBA farve for markers
Config.MarkerColor = {20, 170, 20, 200}

--[[
    Angiv om du bruger vores bandesystem
    Link: https://identity.tebex.io/package/5026176
]]
Config.UsingGangSystem = false

--================
--==    Field   ==
--================
Config.Field = {}

-- Det maximale antal af marker man kan have "kørende" på samme tid.
Config.Field.maxFields = 4

--[[
    De forskellige steder man kan plante stoffer
    [pos]: Er koordinaterne til locationen
    [drugs]: Er hvilke drugs man skal kunne plante der. Dette gøres i et array, så du kan vælge flere forskellige stoffer samme sted
        f.eks. {'weed', 'heroin'} - for at du enten kan plante weed eller heroin på lokationen
]]
Config.Field.locations = {
    {pos = vector3(2233.4768, 5578.4531, 53.5), drugs = {'weed'}},
    {pos = vector3(2233.7534, 5574.2397, 53.5), drugs = {'weed'}},
    {pos = vector3(2231.5642, 5574.5884, 53.5), drugs = {'weed'}},
    {pos = vector3(2230.7798, 5578.6216, 53.5), drugs = {'weed'}},
    {pos = vector3(1937.66, 4819.76, 44.0), drugs = {'coke'}},
    {pos = vector3(1934.85, 4822.57, 44.80), drugs = {'coke'}},
    {pos = vector3(1937.85, 4825.92, 44.76), drugs = {'coke'}},
    {pos = vector3(1941.88, 4822.21, 44.0), drugs = {'coke'}},
    {pos = vector3(-1306.53, 4434.53, 23.0), drugs = {'heroin'}},
    {pos = vector3(-1301.34, 4447.57, 20.20), drugs = {'heroin'}},
    {pos = vector3(-1297.2, 4440.8, 20.0), drugs = {'heroin'}},
    {pos = vector3(-1289.49, 4443.95, 18.0), drugs = {'heroin'}},
}

--================
--==    Crop    ==
--================
Config.Crop = {}

--[[
    Liste over hvilke stoffer man kan lave og indstillingerne på stoffet
    [items]: Itemname på de forskellige ting
        seed: Det frø item man planter
        product: Det item du får når du høster
        cleaned: Det item du får når du "renser" stoffet
        packed: Det item du får når du har "pakket" stoffet
    [maxSeeds]: Det maksimale antal af seeds du kan plante på ét sted
    [fertilizeMultiplier]: Hvor meget eksta man skal få hvis man gøder (I procent - 0 = 0% | 100 = 100%)
    [productPerSeed]: Det antal af items du får pr. seed
        f.eks. hvis du har plantet 3 seeds og den er sat til 5 vil du få 15 items når du høster
    [growTime]: Hvor lang tid det skal tage for planten at komme op på stadie 1 (I minutter)
    [cleaning]: Indstillinger for "rensning"
        [items]: De items du skal bruge til at "rense" stoffet med (lad tablet være tomt hvis, der ikke skal bruges nogle items)
        [minItems]: Det antal stoffer du skal have på dig for at kunne "rense"
        [cleanedItems]: Det antal items du skal have tilbage når du er færdig med at "rense"
        [time]: Den tid det tager at køre en "rense" cyklus (I sekunder)
    [packing]: Indstillinger for "pakning"
        [items]: De items du skal bruge til at "pakke" stoffet med (lad tablet være tomt hvis, der ikke skal bruges nogle items)
        [minItems]: Det antal stoffer du skal have på dig for at kunne "pakke"
        [packedItems]: Det antal items du skal have tilbage når du er færdig med at "pakke"
        [time]: Den tid det tager at køre en "pakke" cyklus (I sekunder)
]]
Config.Crop.drugs = {
    ['weed'] = {
        items = {
            seed = 'weed_seed',
            product = 'weed_uncleaned',
            cleaned = 'weed',
            packed = 'weed_packed',
        },
        maxSeeds = 25,
        fertilizeMultiplier = 50,
        productPerSeed = 13.32,
        growTime = 30,
        cleaning = {
            items = {
                {itemName = 'jointpapir', amount = 5}
            },
            minItems = 10,
            cleanedItems = 5,
            time = 15,
        },
        packing = {
            items = {
                {itemName = 'plastic_bag', amount = 10}
            },
            minItems = 20,
            packedItems = 10,
            time = 15,
        }
    },
    ['coke'] = {
        items = {
            seed = 'coke_seed',
            product = 'coke_uncleaned',
            cleaned = 'coke',
            packed = 'coke_packed',
        },
        maxSeeds = 25,
        fertilizeMultiplier = 50,
        productPerSeed = 13.32,
        growTime = 1,
        cleaning = {
            items = {
                {itemName = 'chemicals', amount = 5}
            },
            minItems = 10,
            cleanedItems = 5,
            time = 15,
        },
        packing = {
            items = {
                {itemName = 'plastic_bag', amount = 10}
            },
            minItems = 20,
            packedItems = 10,
            time = 15,
        }
    },
    ['heroin'] = {
        items = {
            seed = 'heroin_seed',
            product = 'heroin_uncleaned',
            cleaned = 'heroin',
            packed = 'heroin_packed',
        },
        maxSeeds = 25,
        fertilizeMultiplier = 50,
        productPerSeed = 13.32,
        growTime = 30,
        cleaning = {
            items = {
                {itemName = 'kanyle', amount = 5}
            },
            minItems = 10,
            cleanedItems = 5,
            time = 15,
        },
        packing = {
            items = {
                {itemName = 'plastic_bag', amount = 10}
            },
            minItems = 20,
            packedItems = 10,
            time = 15,
        }
    },
}

-- Hvor mange procent af planterne der skal overleve, hvis man ikke vander (0 = 0% | 100 = 100%)
Config.Crop.survive = 25

--[[
    Hvor mange procent af planterne der skal overleve hhv. hvor meget man vander
        [Antal vandinger] = procent der overlever
            f.eks. [1] = 34 - vander man én gang vil 34% af planterne overleve
]]
Config.Crop.waterMultiplier = {
    [1] = 65,
    [2] = 100
}

-- Cooldown på hvornår man kan vande igen (I minutter)
Config.Crop.waterTime = 55

-- Itemname på det item man vander med
Config.Crop.waterItem = 'watering_can'

--[[
    Liste over plante stadier
        [stadie] = hvor lang tid det tager at komme på det stadie (I minutter)
            f.eks. [2] = 60 - Det tager 60 min at komme op på stadie 2
    
    Det næst sidste stadie er der hvor planten kan høstes
    Det sidste stadie er det stadie hvor planten er visnet

    OBS: Der skal være minimum 3 stadier!
]]
Config.Crop.growthStates = {
    [1] = 30, -- Hvis `growTime` ikke er angivet under `Config.Crop.drugs` vil den bruge denne tid
    [2] = 1,
    [3] = 2,
    [4] = 1, -- Høst stadie
    [5] = 15, -- Visnet stadie
}

-- Itemname på det item man gøder med
Config.Crop.fertilizeItem = 'fertilize_bag'

--[[
    Det stadie man kan gøde planten på
    OBS: Der kan KUN gødes på dette stadie
]]
Config.Crop.fertilizeState = 2

--====================
--==    Cleaning    ==
--====================
Config.Cleaning = {}

--[[
    De forskellige steder man kan "rense" stoffer
    [pos]: Er koordinaterne til locationen
    [drugs]: Er hvilke drugs man skal kunne "rense" der. Dette gøres i et array, så du kan vælge flere forskellige stoffer samme sted
        f.eks. {'weed', 'heroin'} - for at du enten kan "rense" weed eller heroin på lokationen
]]
Config.Cleaning.locations = {
    {pos = vector3(2193.3416, 3304.1067, 45.3331), products = {'coke'}},
    {pos = vector3(2433.6423, 4968.9678, 41.3476), products = {'heroin'}},
    {pos = vector3(1943.6548, 4657.8062, 39.5756), products = {'weed'}}
}
--====================
--==    Packing     ==
--====================
Config.Packing = {}

--[[
    De forskellige steder man kan "pakke" stoffer
    [pos]: Er koordinaterne til locationen
    [drugs]: Er hvilke drugs man skal kunne "pakke" der. Dette gøres i et array, så du kan vælge flere forskellige stoffer samme sted
        f.eks. {'weed', 'heroin'} - for at du enten kan "pakke" weed eller heroin på lokationen
]]
Config.Packing.locations = {
    {pos = vector3(2174.7769, 3384.2922, 44.4449), products = {'coke'}},
    {pos = vector3(1389.5955, 3608.6462, 37.9419), products = {'heroin'}},
    {pos = vector3(1342.1899, 4386.3838, 43.3438), products = {'weed'}}
}

--[[
    Angiv om det kun er bander der skal kunne "pakke" stoffer.
    OBS: Kræver du har vores bandesystem og har sat `Config.UsingGangSystem` til `true`
]]
Config.Packing.gangOnly = false
