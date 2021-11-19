#!/bin/bash

# title: copy_without_linebreaks
# author: Glutanimate (github.com/glutanimate)
# modifier: Siddharth (github.com/SidMan2001)
# license: MIT license

# Parses currently selected text and removes
# newlines

while /home/bs/scripts/clipboard_rm_dollar/clipnotify;
do
  SelectedText="$(xsel)"
  CopiedText="$(xsel -b)"
  ModifiedTextPrimary="$(echo "$SelectedText" | sed 's/^\$ //')"
  echo -n "$ModifiedTextPrimary" | xsel -i
  ModifiedTextClipboard="$(echo "$CopiedText" | sed 's/^\$ //')"
  echo -n "$ModifiedTextClipboard" | xsel -bi
done

