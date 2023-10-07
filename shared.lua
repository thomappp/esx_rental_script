Config = {

    Control = {
       controlId = 38,
       controlName = "~INPUT_PICKUP~"
    },

    Blip = {
        sprite = 280,
        scale = 1.0,
        color = 69
    },

    Locations = {
        {
            Spawner = {
                model = "a_m_y_ktown_01",
                coords = vector3(-1023.87, -2695.02, 12.9),
                heading = 187.33
            },

            SpawnPoints = {
                { coords = vector3(-1028.88, -2660.93, 12.22), heading = 150.55, radius = 4.0 },
                { coords = vector3(-1035.01, -2657.34, 12.22), heading = 150.24, radius = 4.0 },
                { coords = vector3(-1040.71, -2653.96, 12.22), heading = 150.12, radius = 4.0 }
            },

            Vehicles = {
                { label = "Blista", model = "blista", price = 150 },
                { label = "Sultan", model = "sultan", price = 350 },
            }
        },

        {
            Spawner = {
                model = "a_m_y_vindouche_01",
                coords = vector3(-211.85, 6205.4, 30.49),
                heading = 268.24
            },

            SpawnPoints = {
                { coords = vector3(-207.79, 6220.09, 29.96), heading = 223.31, radius = 4.0 },
                { coords = vector3(-203.29, 6224.76, 29.88), heading = 224.29, radius = 4.0 },
                { coords = vector3(-198.19, 6229.35, 29.89), heading = 225.1, radius = 4.0 }
            },

            Vehicles = {
                { label = "Sanchez", model = "sanchez", price = 250 },
                { label = "Quad", model = "blazer", price = 400 },
                { label = "Injection Off Road", model = "bfinjection", price = 900 }
            }
        }
    }
}