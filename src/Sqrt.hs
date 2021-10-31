{-# LANGUAGE OverloadedStrings #-}
module Sqrt
    ( sqrt_
    ) where

import qualified Web.Scotty as Sc
import qualified Data.Text.Lazy as TL
import qualified Data.Aeson as Ae
import qualified Network.HTTP.Types.Status as St

sqrt_ = do
  x     <- Sc.param "x" :: Sc.ActionM Double
  if x < 0
    then Sc.json $ Ae.object [
        ("operator", Ae.toJSON ("sqrt" :: String)),
        ("arguments", Ae.toJSON [x]),
        ("result", Ae.Null),
        ("error", Ae.toJSON ("Taking the root of a negative number" :: String))
        ]
    else
        Sc.json $ Ae.object [
            ("operator", Ae.toJSON ("sqrt" :: String)),
            ("arguments", Ae.toJSON [x]),
            ("result", Ae.toJSON (sqrt x)),
            ("error", Ae.Null)
            ]
