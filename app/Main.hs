{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Web.Scotty as Sc
import Add
import Div
import Mul
import Pow
import Sqrt
import Sub


main :: IO ()
main = Sc.scotty 8000 $ do
    Sc.get    "/add/:x/:y" (add_)
    Sc.get    "/sub/:x/:y" (sub_)
    Sc.get    "/mul/:x/:y" (mul_)
    Sc.get    "/div/:x/:y" (div_)
    Sc.get    "/sqrt/:x" (sqrt_)
    Sc.get    "/pow/:x/:n" (pow_)

