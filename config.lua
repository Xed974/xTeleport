Teleport = {}

Teleport = {
    MarkerType = 23, -- Pour voir les diff rents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.3, -- Largeur du marker
    MarkerSizeEpaisseur = 0.3, --  paisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 2.0, -- Distane de visibiliter du marker (1.0 = 1 m tre)
    MarkerColorR = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacit  du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)

    --

    { -- Copier coller et changer les informations afin d'avoir plusieurs point de TP
        Message = "Apppuyez sur ~INPUT_CONTEXT~ pour entrer dans le batiment.",
        Position_marker = {vector3(-74.65, -823.94, 326.18)},
        Destination = vector3(-72.06, -820.83, 326.18),
        -- Item
        ItemRequired = true,
        ItemName = 'clevigneronboss',
        ItemMessageErreur = "Vous devez avoir une ~r~clé~s~.",
        ItemAnim = false,
        -- Job
        JobRequired = false,
        JobName = 'ltd',
        JobMessageErreur = "Vous devez ~r~travailler ici pour pouvoir entrer~s~.",
        GradeRequired = false,
        gradeName = {'boss', 'recrut'},
        GradeMessageErreur = "Vous n\'avez ~r~pas le grade requis~s~.",
        -- Job2
        Job2Required = false,
        Job2Name = 'bloods',
        Job2MessageErreur = "Vous devez ~r~être du quartier pouvoir entrer~s~.",
        Grade2Required = false,
        grade2Name = {'tog', 'og'},
        Grade2MessageErreur = "Vous n\'avez ~r~pas le grade requis~s~.",
    },
}

--- Xed#1188