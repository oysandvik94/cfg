# Vim

## Search and replace in workspace

### Telescope 

Live grep to find results, add all to quicklist with `ctrl-q`.

Update all occurences with: ‘:cdo s/StringOne/StringTwo/g | update’

### Vimgrep

:vimgrep /Neovim/gj **/*

Specify filetype after gj.

## Capture groups (fighting one eyed kirby)

Capture group is: 

```regex
    \(.*\)
```

Use capture group with \1 and \2

Below command: 

`%s/ReplaceThis\(.*\).andThis\(.*\)/WithThis\1.andAlsoThis\2/g`

Turns this: 

ReplaceThis(one).withThis(foo)
ReplaceThis(two).withThis(bar)

Into this:

WithThis(one).andAlsoThis(foo)
WithThis(two).andAlsoThis(bar)

