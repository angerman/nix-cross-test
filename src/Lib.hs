{-# language TemplateHaskell #-}
module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn $([| "hello World" |])
