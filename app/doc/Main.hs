-- |
-- SPDX-License-Identifier: BSD-3-Clause
module Main where

import Options.Applicative (execParser)
import Swarm.Doc.CLI (cliInfo)
import Swarm.Doc.Gen (generateDocs)

main :: IO ()
main = generateDocs =<< execParser cliInfo
