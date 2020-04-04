module MalRepl (malRead, malEval, malPrint, malREP) where

import System.IO
import System.Console.Readline

type MalStr = String

malRead :: String -> MalStr
malRead = id

malEval :: MalStr -> MalStr
malEval = id

malPrint :: MalStr -> String
malPrint = id

malREP :: String -> String
malREP = malPrint . malEval . malRead

malRepl :: IO (Maybe String)
malRepl = hFlush stdout
        >> readline "user> "

main :: IO ()
main = do
  input <- malRepl
  case input of
    Nothing -> do putStrLn ""
                  return ()
    Just ":quit" -> return ()
    Just "" -> main
    Just line -> do addHistory line
                    putStrLn $ malREP line
                    main

  

  
