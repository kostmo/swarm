-- |
-- SPDX-License-Identifier: BSD-3-Clause
--
-- Render the @swarm-docs@ command-line option grammar as a railroad (syntax)
-- diagram, by feeding its 'Swarm.Doc.CLI.cliParser' to the optparse-applicative
-- front end of the @connectors-diagrams@ package and writing the result as SVG.
module Main where

import Railroad.Backend.Diagrams (writeRailroadSVG)
import Railroad.OptParse (parserToRail)
import Swarm.Doc.CLI (cliParser)
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory)

outputPath :: FilePath
outputPath = "output/swarm-cli-args.svg"

main :: IO ()
main = do
  createDirectoryIfMissing True (takeDirectory outputPath)
  writeRailroadSVG outputPath 1200 (parserToRail cliParser)
  putStrLn ("Wrote " ++ outputPath)
