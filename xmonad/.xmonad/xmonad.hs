import XMonad

import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Util.Cursor
import XMonad.Util.Paste
import XMonad.Util.Run(spawnPipe)
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import Graphics.X11.ExtraTypes.XF86
import System.IO

import qualified Data.Map as M
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

-- based off of (read: stolen from) https://github.com/bdowning/dotfiles/tree/master/host-firnen/xmonad

myLauncher = "rofi -show"

myManageHook = composeAll
  [ className =? "Squeak" --> doFloat
  , className =? "Plugin-container" --> doFloat
  , isDialog --> doCenterFloat
  , isFullscreen --> doFullFloat
  ]

layout = avoidStruts (tiled ||| three ||| Mirror tiled ||| Full)
  where
     tiled   = Tall nmaster delta (1/2)
     three   = ThreeCol nmaster delta (1/3)
     nmaster = 1
     delta   = 3/100

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_c), kill)
    , ((modm, xK_Escape), toggleWS)
    , ((modm .|. controlMask .|. shiftMask, xK_l), spawn "xset s activate")
    , ((0, xF86XK_AudioMute), spawn "amixer -q set Master toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 5%+ unmute")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 5%- unmute")
    , ((shiftMask, xK_Insert), pasteSelection)
    , ((modm, xK_p ), spawn myLauncher )
    , ((modm, xK_Return ), spawn "termite" )
    , ((modm .|. shiftMask, xK_Return ), spawn "termite -d $(xcwd)" )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    , ((modm, xK_q                   ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


main = do
  xmonad $ ewmh defaultConfig {
    terminal = "termite",
    keys = myKeys,
    workspaces = ["1", "2", "3", "4", "5", "6"],
    manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
    layoutHook = smartBorders $ layout,
    borderWidth        = 10,
    normalBorderColor  = "#1e1c31",
    focusedBorderColor = "#aaffe4",
    modMask = mod1Mask,
    handleEventHook = fullscreenEventHook <+> docksEventHook,
    startupHook = spawn "setxkbmap -option caps:ctrl_modifier"
        <+> spawn "/home/ad/.fehbg"
        <+> spawn "xsetroot -cursor_name left_ptr"
    }
