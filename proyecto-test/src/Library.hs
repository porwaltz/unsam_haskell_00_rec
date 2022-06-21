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
tartaDeMelaza = Postre{ peso = 50, temperatura = 0 , sabores = ["melaza"] }

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
    sabores = []
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


-- 3)

mesa = [bizcochoBorracho, tartaDeMelaza]

listo :: Postre -> Bool
listo postre = (peso postre > 0) && (temperatura postre > 0) && (length sabores postre > 0)

listosTrasHechizo :: [Postre] -> Hechizo -> Bool
listosTrasHechizo postres hechizo = all (\x -> listo hechizo x ) postres

-- 4)
extraerPeso p _ _ = p

pesoPromedio :: [Postre] -> Number
pesoPromedio postres = (foldr (+) 0 (map (extraerPeso) postres)) / (length postres)

-- 5)