import XMonad
import Control.Monad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Decoration -- themes, decorated layouts
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Image
import System.IO
import XMonad.Config.Xfce

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified GHC.IO.Handle.Types as H			

myWorkspace	:: [String]
myWorkspace	= clickable . (map dzenEscape) $ ["  戦  場  ", "  調  達  ", "  伝  令  ", "  平  和  ", "  休  息  "]
	where clickable l = [ "^ca(1,xdotool key super+" ++show (n) ++ ")" ++ ws ++ "^ca()" |
			      (i,ws) <- zip [1..] l,
			      let n = i ]

warnaBG         = "#303030"
warnaPutih      = "#ebebeb"
warnaMerah      = "#c3134b"
warnaAbu        = "#545454"
warnaAbuGelap   = "#353535"

-- myLayout = simplestFloat
wallPaperSetUp :: X()
wallPaperSetUp = do
   spawn "hsetroot -solid '#ffffff' -full Pictures/43023995.png -blur 2"

mpdStartup :: X()
mpdStartup = do
    spawn "mpd"

startUp :: X()
startUp = do
	  spawn "compton"

main = do
	bar <- spawnPipe status
	bottom <- spawnPipe "sh /home/tkyshm/scripts/dzenbottom.sh"
	corner <- spawnPipe "sh /home/tkyshm/scripts/dzencorner.sh"
	top <- spawnPipe "sh /home/tkyshm/scripts/dzentop.sh"
 -- top <- spawnPipe "sh /home/tkyshm/scripts/bar.sh"
	-- mid <- spawnPipe "sh /home/tkyshm/scripts/midbar.sh"
	-- tim <- spawnPipe "sh /home/tkyshm/scripts/tim.sh"
	xmonad $ defaultConfig
	--xmonad $ gnomeConfig
		--{ manageHook = manageDocks <+> manageHook gnomeConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, startupHook = startUp <+> wallPaperSetUp <+> mpdStartup <+> setWMName "xmonad"
  , borderWidth = 1
		, focusedBorderColor = "#427de7"
		, normalBorderColor = "#404040"
		, terminal = "gnome-terminal"
		, workspaces = myWorkspace
	 , modMask = mod4Mask
  --, modMask = controlMask
		, layoutHook = avoidStruts $ spacing 3 $ Tall 1 (3/100) (1/2)
		--, logHook = myLogHook gnomeConfig
		, logHook = myLogHook bar
		} `additionalKeys` myKeys
		  where status 	= "dzen2 -ta l -fn '"
				  ++ font ++
				  "' -w 860 -bg '#101010' -h 22 -e 'button3='"
		        font	= "M+ 2p-7"	

play		= "^ca(1,mpc toggle)^i(/home/tkyshm/.icons/xbm8x8/play.xbm)^ca()"
next		= "^ca(1,mpc next)^i(/home/tkyshm/.icons/xbm8x8/fwd.xbm)^ca()"
prev		= "^ca(1,mpc prev)^i(/home/tkyshm/.icons/xbm8x8/rwd.xbm)^ca()"
stop		= "^ca(1,mpc stop)^i(/home/tkyshm/.icons/xbm8x8/stop.xbm)^ca()"

myKeys = 
	[ ((controlMask, xK_9), spawn "dmenu_run")
	, ((mod4Mask, xK_Return), spawn "terminator")
	, ((0, xK_Print), spawn "terminator")
	]

myLogHook h = dynamicLogWithPP $ myDzenPP { ppOutput = hPutStrLn h }

myDzenPP = dzenPP
	{ ppCurrent		= wrap cur end
	, ppHidden		= wrap cui end
	, ppHiddenNoWindows	= wrap cua end
	, ppSep			= "   ^fg(#FF6E84)^i(/home/tkyshm/.icons/xbm8x8/arrow_mini_02.xbm)^fg() "
	, ppWsSep 		= ""
	, ppTitle		= \t -> "^fg(#49C259) " ++ prev ++ " " ++ play ++ " " ++ stop ++ " " ++ next ++ " ^fg()"
	, ppLayout		= \l -> ""
	, ppOrder		= \(ws:_:t:_) -> [ws,t]
	} where	cur	= " ^fg(#5DBFFF)^r(48x14)^fg()^p(-44)^ib(1)^fg(#151515) "
		cua	= " ^fg(#444444)^r(48x14)^fg()^p(-44)^ib(1)^fg(#151515) "
		cui 	= " ^fg(#E65C73)^r(48x14)^fg()^p(-44)^ib(1)^fg(#fbfbfb) "
		end	= " ^fg() "
