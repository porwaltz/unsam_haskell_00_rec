module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

-- 1)
data Postre = Postre {
    peso :: Number,
    temperatura :: Number,
    sabores :: [String]
} deriving Show

bizcochoBorracho = Postre{ peso = 100, temperatura = 25, sabores = ["fruta", "crema"]}


-- 2)

type Hechizo = Postre -> Postre

perderPeso :: Number -> Postre -> Postre
perderPeso porcentaje postre = Postre{
    peso = (peso postre) / 100 * (100 - porcentaje),
    temperatura = (temperatura postre),
    sabores = sabores postre
}

calentar :: Number -> Postre -> Postre
calentar grados postre = Postre{
    peso = (peso postre),
    temperatura = (temperatura postre) + grados,
    sabores = (sabores postre)
}

sinSabor :: Postre -> Postre
sinSabor postre = Postre{
    peso = (peso postre),
    temperatura = (temperatura postre),
    sabores = [" "]
}

agregarSabor :: String -> Postre -> Postre
agregarSabor sabor postre = Postre{
    peso = (peso postre),
    temperatura = (temperatura postre),
    sabores = (sabores postre) ++ sabor
}

incendio :: Hechizo
incendio postre = perderPeso 5 (calentar 1 postre)

immobulus :: Hechizo
immobulus postre = Postre{
    peso = (peso pastel),
    temperatura = 0,
    sabores = (sabores pastel)
}

wingardiumLeviosa :: Hechizo
wingardiumLeviosa postre = perderPeso 10 (agregarSabor "concentrado" postre)

diffindo :: Number -> Hechizo
diffindo porcentaje postre =  perderPeso porcentaje postre
-- Se puede hacer algo del estilo diffindo = perderPeso ?

riddikulus :: String -> Hechizo
riddikulus sabor postre = agregarSabor (reverse sabor) postre

avadaKedavra :: Hechizo
avadaKedavra postre = sinSabor (immobulus postre)

