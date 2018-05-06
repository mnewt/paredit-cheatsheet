Paredit Cheat Sheet
===================

# Build

    bundle install
    bundle exec cheatset generate paredit.rb

# Test in a web browser

    open paredit_cheatsheet.docset/Contents/Resources/Documents/index.html

# Add to Dash

1. Open Dash
2. Preferences
3. +
4. Add Local Docset
5. Point it to `paredit_cheatsheet.docset`

# Dash Cheat Sheets 

All the [Dash](https://kapeli.com/dash) cheat sheets that can be installed from Preferences > Downloads > Cheat Sheets can be found in this repo. You can modify them or add new ones using pull requests.

The cheat sheets are also available online at https://kapeli.com/cheatsheets.

# Make Your Own

Cheat sheets are generated using [cheatset](https://github.com/Kapeli/cheatset#readme). Check out cheatset's [README](https://github.com/Kapeli/cheatset#readme) for instructions on how to make your own cheat sheet.

To modify an existing cheet sheet, simply fork this repo and look inside the "cheatsheets" folder. The [format](https://github.com/Kapeli/cheatset#readme) used to define a cheat sheet is quite simple, so don't be afraid to jump right in.

# Guidelines

**1. Naming**

All the `categories`, `commands` and `names` in your cheat sheet will be inserted in the search index and will be searchable within Dash. Try to keep these entries as concise as possible and complement them with `notes` if more details are required.

**2. Title Case**

Try to use [Title Case](http://en.wikipedia.org/wiki/Letter_case#Title_case) only for `categories`. Anything else should be [Normal/Sentence case](http://en.wikipedia.org/wiki/Letter_case#Sentence_case). This also applies to menu item names, which should be converted to [Normal/Sentence case](http://en.wikipedia.org/wiki/Letter_case#Sentence_case).

**3. Keyboard shortcuts (if any)**

Try not to include really common keyboard shortcuts (e.g. Copy, Paste, Undo, Select All).

Keyboard modifiers should be listed in this order: `CMD+CTRL+ALT+SHIFT`.
