#!/usr/bin/env osascript

------------------------------------------------------------
-- 参考サイト
-- https://maku77.github.io/mac/applescript/terminal.html
------------------------------------------------------------

------------------------------------------------------------
-- roswell実行スクリプト
------------------------------------------------------------
-- -- roswellが用意したswank起動スクリプトを使用する
-- "ros run --load $HOME/.roswell/lisp/slime/2018.03.28/start-swank.lisp"
-- -- slimvが用意したswank起動スクリプトを使用する
-- "ros run --load $HOME/.vim/bundle/slimv/slime/start-swank.lisp"

------------------------------------------------------------
-- スクリプトのエントリポイント
------------------------------------------------------------
on run
	set cmd to "ros run --load $HOME/.roswell/lisp/slime/2018.03.28/start-swank.lisp"
    my newTab(cmd)
end run

------------------------------------------------------------
-- 新規ウィンドウでスクリプト実行
------------------------------------------------------------
-- 新しいタブを開いてコマンドを実行する
on newTab(command)
    -- Open a new tab and wait a little
    tell application "System Events"
        keystroke "t" using command down
        delay 0.5
    end tell

    -- Run the command in the new tab
    tell application "Terminal"
        do script command in front window
    end tell
end newTab

------------------------------------------------------------
-- 新規タブでスクリプト実行
------------------------------------------------------------
on newWindow(command)
	tell application "Terminal"
		do script command
	end tell
end newWindow

