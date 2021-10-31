{-# LANGUAGE OverloadedStrings #-}
module Pow
    ( pow_
    ) where

import qualified Web.Scotty as Sc
import qualified Data.Text.Lazy as TL
import qualified Data.Aeson as Ae
import qualified Network.HTTP.Types.Status as St

pow_ = do
  x     <- Sc.param "x" :: Sc.ActionM Double
  n     <- Sc.param "n" :: Sc.ActionM Double
  if n < 0 && x == 0
    then Sc.json $ Ae.object [
        ("operator", Ae.toJSON ("pow" :: String)),
        ("arguments", Ae.toJSON [x, n]),
        ("result", Ae.Null),
        ("error", Ae.toJSON ("Raising to the negative power of zero" :: String))
        ]
    else
        Sc.json $ Ae.object [
            ("operator", Ae.toJSON ("pow" :: String)),
            ("arguments", Ae.toJSON [x, n]),
            ("result", Ae.toJSON (x**n)),
            ("error", Ae.Null)
            ]
