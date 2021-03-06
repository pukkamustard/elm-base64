module Test.Base64 (tests) where

import Base64
import ElmTest exposing (Test, assertEqual, defaultTest, suite)


encodeTest : (String, String) -> Test
encodeTest (string, base64) =
  defaultTest (assertEqual  (Result.Ok base64) (Base64.encode string))


decodeTest : (String, String) -> Test
decodeTest (string, base64) =
  defaultTest (assertEqual (Result.Ok string) (Base64.decode base64))


examples =
  [ ("aaa", "YWFh")
  , ("my updated file contents", "bXkgdXBkYXRlZCBmaWxlIGNvbnRlbnRz")
  , ("a", "YQ==")
  , ("aa", "YWE=")
  , ("Elm is Cool", "RWxtIGlzIENvb2w=")
  ]


tests : Test
tests =
  suite "Base64" [ suite "encode" <| List.map encodeTest examples
                 , suite "decode" <| List.map decodeTest examples
                 ]
