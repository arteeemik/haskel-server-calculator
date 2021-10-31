{-# LANGUAGE OverloadedStrings #-}
module Div
    ( div_
    ) where

import qualified Web.Scotty as Sc
import qualified Data.Text.Lazy as TL
import qualified Data.Aeson as Ae
import qualified Network.HTTP.Types.Status as St

div_ = do
  x     <- Sc.param "x" :: Sc.ActionM Double
  y     <- Sc.param "y" :: Sc.ActionM Double
  if y == 0
    then Sc.json $ Ae.object [
        ("operator", Ae.toJSON ("div" :: String)),
        ("arguments", Ae.toJSON [x, y]),
        ("result", Ae.Null),
        ("error", Ae.toJSON ("Division by zero" :: String))
        ]
    else
        Sc.json $ Ae.object [
            ("operator", Ae.toJSON ("div" :: String)),
            ("arguments", Ae.toJSON [x, y]),
            ("result", Ae.toJSON (x / y)),
            ("error", Ae.Null)
            ]
