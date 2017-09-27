module Main where


import Servant.Client
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Lib

main :: IO ()
main = do
  man <- newManager tlsManagerSettings
  let ce = ClientEnv man (BaseUrl Https "gitlab.com" 443 "/api/v4/projects/inkscape%2Finkscape")
  runClientM getBranches ce >>= print
