
## Remove top tabs
Add the following to userChrome.css in order to remove the tabs from the top of firefox.

```
@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

#TabsToolbar {
  visibility: collapse !important;
}

#sidebar {
  min-width:0px !important;
  max-width:none !important;
}

*:-moz-list-bullet, *:-moz-list-number {font-size: 1em;}
*|*:-moz-list-bullet, *|*:-moz-list-number {font-size: 1em;}
```

## Addons
Install:
- treetabs
