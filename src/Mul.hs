{-# LANGUAGE OverloadedStrings #-}
module Mul
    ( mul_
    ) where

import qualified Web.Scotty as Sc
import qualified Data.Text.Lazy as TL
import qualified Data.Aeson as Ae
import qualified Network.HTTP.Types.Status as St

mul_ = do
  x     <- Sc.param "x" :: Sc.ActionM Double
  y     <- Sc.param "y" :: Sc.ActionM Double
  let res = x * y
  Sc.json $ Ae.object [
        ("operator", Ae.toJSON ("mull" :: String)),
        ("arguments", Ae.toJSON [x, y]),
        ("result", Ae.toJSON res),
        ("error", Ae.Null)
        ]
