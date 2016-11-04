#!/usr/bin/env bash

# --------------------------------------------- #
# | Transmission
# --------------------------------------------- #
print_info_secondary "Transmission"

execute 'defaults write org.m0k.transmission DeleteOriginalTorrent -bool true' \
'Delete the original torrent files'

execute 'defaults write org.m0k.transmission DownloadChoice -string "Constant" &&
  defaults write org.m0k.transmission DownloadFolder -string "$HOME/torrents"' \
'Use "~/torrents" to store complete downloads'

execute 'defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true &&
  defaults write org.m0k.transmission IncompleteDownloadFolder -string "$HOME/torrents/queued"' \
'Use "~/torrents/queued" to store incomplete downloads'

execute 'defaults write org.m0k.transmission WarningDonate -bool false' \
'Hide the donate message'

execute 'defaults write org.m0k.transmission WarningLegal -bool false' \
'Hide the legal disclaimer'

# --------------------------------------------- #
# | Google Chrome
# --------------------------------------------- #
print_info_secondary "Google Chrome"

execute 'defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false' \
'Disable backswipe'

execute 'defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true' \
'Expand print dialog by default'

execute 'defaults write com.google.Chrome DisablePrintPreview -bool true' \
'Use system-native print preview dialog'

# --------------------------------------------- #
# | iTerm2
# --------------------------------------------- #
print_info_secondary "iTerm2"

execute 'defaults write com.googlecode.iterm2 PromptOnQuit -bool false' \
'Don’t display the annoying prompt when quitting iTerm'
