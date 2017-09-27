{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Data.Text
import Servant.API
import GHC.Generics
import Servant.Client
import Data.Proxy
import Data.Aeson

glapi :: Proxy GLAPI
glapi = Proxy

getBranches :: ClientM [BranchInfo]
getBranches =  client glapi

type GLAPI =
  "repository" :> "branches" :> Get '[JSON] [BranchInfo]

data BranchInfo = BranchInfo {
    name :: Text
  , merged :: Bool
  , protected :: Bool
  } deriving (Eq, Show, Generic)

instance FromJSON BranchInfo
