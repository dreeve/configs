--
-- An example, simple ~/.xmonad/xmonad.hs file.
-- It overrides a few basic settings, reusing all the other defaults.
--

import XMonad



import Data.Monoid
import System.Exit
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M


newKeys x = foldr M.delete (keys defaultConfig x) (keysToRemove x)

keysToRemove :: XConfig Layout -> [(KeyMask, KeySym)]
keysToRemove x =
         [ (modMask x, xK_w),
           (modMask x, xK_m)
         ]


main = xmonad $ defaultConfig
    { borderWidth        = 0
    , modMask = mod4Mask
    , keys = newKeys }

