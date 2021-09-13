{-
 - Libraries
 -}

import System.IO

import XMonad
import XMonad.ManageHook
import qualified XMonad.StackSet as W

-- XMonad-Contrib
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.ResizableTile
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.WindowNavigation
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

{-
 - Parameters
 -}

myGap = 3
myFont = "xft:Noto Sans:size=8"
myActiveColor = "#268bd2"
myInactiveColor = "#002b36"

myBrowser = "firefox"
myTerminal = "alacritty"
myStatusBar = "xmobar $HOME/.xmonad/xmobar.conf"

{-
 - Main
 -}

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad
        $ docks -- XMonad.Hooks.ManageDocks
        $ myConfig xmproc
        `additionalKeysP` myKeys

myConfig p = def
    { modMask = mod4Mask
    , terminal = myTerminal
    , focusedBorderColor = myActiveColor
    , layoutHook = myLayout
    , logHook = myLogHook p
    , manageHook = myManageHook <+> namedScratchpadManageHook scratchpads <+> manageHook def
    , normalBorderColor = myInactiveColor
    , borderWidth = 3
    }

{-
 - Bindings
 -}

myKeys =
    [ ("M-<Return>", spawn myTerminal)
    , ("M-f", spawn myBrowser)
    , ("M-q", kill)
    , ("M-a", sendMessage MirrorShrink)
    , ("M-x", sendMessage MirrorExpand)
    , ("M-e", sendMessage Expand)
    , ("M-s", sendMessage Shrink)
    , ("M-m", withFocused $ sendMessage . MergeAll)
    , ("M-u", withFocused $ sendMessage . UnMerge)
    , ("M-h", sendMessage $ Go L)
    , ("M-l", sendMessage $ Go R)
    , ("M-k", sendMessage $ Go U)
    , ("M-j", sendMessage $ Go D)
    , ("M-;", onGroup W.focusUp')
    , ("M-C-h", sendMessage $ Swap L)
    , ("M-C-l", sendMessage $ Swap R)
    , ("M-C-k", sendMessage $ Swap U)
    , ("M-C-j", sendMessage $ Swap D)
    , ("M-S-h", sendMessage $ pullGroup L)
    , ("M-S-l", sendMessage $ pullGroup R)
    , ("M-S-k", sendMessage $ pullGroup U)
    , ("M-S-j", sendMessage $ pullGroup D)
    , ("M-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-z", namedScratchpadAction scratchpads "htop")
    , ("M-g", spawnSelected' myAppGrid )
    ]

{-
 - Layout
 -}

myTabTheme = def
    { inactiveBorderColor = myInactiveColor
    , inactiveColor       = myInactiveColor
    , inactiveTextColor   = myInactiveColor
    , activeBorderColor = myActiveColor
    , activeColor       = myActiveColor
    , activeTextColor   = myActiveColor
    , decoHeight = 10
    , fontName = myFont }
addTopBar = noFrillsDeco shrinkText myTabTheme

myLayout =
    avoidStruts
    $ smartBorders
    $ windowNavigation
    $ addTopBar
    $ addTabs shrinkText myTabTheme
    $ subLayout [] Simplest
    $ spacingRaw False (Border 0 0 0 0) True (Border myGap myGap myGap myGap) True
    $ ResizableTall 1 (3/100) (5/9) []

{-
 - Log Hook
 -}

myLogHook p = dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn p
    , ppTitle = xmobarColor "green" "" . shorten 50
    }

{-
 - Manage Hook
 -}

myManageHook :: ManageHook
myManageHook = composeAll
    [ (className /=? "Alacritty") <&&> (className /=? "firefox") --> doFloat ]

{-
 - GridSelect
 -}

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
    where conf = def
            { gs_cellheight   = 40
            , gs_cellwidth    = 200
            , gs_cellpadding  = 6
            , gs_originFractX = 0.5
            , gs_originFractY = 0.5
            , gs_font         = myFont
            }

myAppGrid =
    [ ("Alacritty", "alacritty")
    , ("Firefox", "firefox")
    , ("PCManFM", "pcmanfm")
    , ("ArchVM", "VBoxManage startvm Arch")
    , ("SaveWallpaper", "cp $HOME/.cache/unsplash_nature_on_boot.jpg $HOME/Images/wallpapers/unsplash_nature.$(date +%F-%H-%M-%S).jpg")
    ]

{-
 - Scratchpads
 -}

scratchpads = [
    NS "htop" "alacritty -t htop -e htop" (title =? "htop")
            (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
    ] where role = stringProperty "WM_WINDOW_ROLE"
