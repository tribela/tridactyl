![Tridactyl logo](logo/Tridactyl_100px.png)

# Tridactyl REPLACE_ME_WITH_THE_VERSION_USING_SED

Tridactyl has to override your new tab page due to WebExtension limitations. You can learn how to change it at the bottom of the page, otherwise please read on for some tips and tricks.

-   You can view the main help page by typing [`:help`][help], and access the tutorial with [`:tutor`][tutor].

-   You can view your current configuration with `:viewconfig`.

-   Upcoming **userChrome.css** changes: Mozilla is going to require a preference to be set to true from Firefox 68 to read userChrome. See [this issue](https://github.com/tridactyl/tridactyl/issues/1572).

-   **Tridactyl retreat** 👀: 4 of the core Tridactyl developers met up in the real world to work on Tridactyl from 24th May - 1st June in the Peak District, UK. [Donate using this link](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7JQHV4N2YZCTY) if you'd like to contribute to our travel, accommodation and subsistence costs, which costed about £2,300. As of June 3rd, we have so far raised ~£800, so thanks to all of you who have donated.

-   Tridactyl retreat dev diary:

    -   Day -1: Azk arrives; cmcaine, bovine3dom, azk go for a curry, have an accidental pilgrimage to Stephenson's Rocket, and trek to the Peak District.
    -   Day 0: cmcaine & bovine3dom went for a walk. Azk did some work. glacambre arrived. Hugh Jackman visits Piccadilly Gardens the day after us, proving once again our trend-setting abilities.
    -   Day 1:
        -   We all looked at the most-thumbed-up issues to help organise our priorities and thumbed our noses at them; our main aim for the retreat is to reduce jank and have a more consistent UX
        -   cmcaine worked on a functional version of Tridactyl's state considering immutable.js, meoisis, and immer.js [link](https://github.com/cmcaine/tridactyl-2-experiments)
        -   azk discovered that hiding our iframe in a shadow DOM doesn't solve the page-refresh-loop bug. azk then ran some experiments with MithrilJS and began reimplementing the commandline
        -   bovine3dom started looking through the backlog of issues, closing a few, updating others
        -   We moved the keyboard API to the Tridactyl organisation; bovine3dom started rewriting it to comply with the current WebExtension experiment requirements
            -   The plan is to first make a Firefox Developer Edition only Tridactyl build that comes with the keyboard API to prevent us getting bored of waiting for Mozilla (and vice versa)
            -   But the WebExtension Experiment API has changed enough that we're currently in build-tool hell with the keyboard-api
        -   glacambre fixed a bunch of issues with scrolling and focusing events, thanks glacambre!
    -   Day 2:
        -   azk and cmcaine continued work on the commandline and state redesign based off saulrh's earlier work. The current focus is on getting the CLI up and running, making the statusbar work and defining the states and the RPC communication between them.
        -   bovine3dom went over old issues, fixing some, closing others, and accepting a few PRs. He also bashed his head against WebExtension Experiments for the keyboard API but didn't make any progress.
        -   glacambre fixed some issues from the backlog and started work on turning hintmode into a real mode with user-configurable binds.
    -   Day 3:
        -   azk, cmcaine and saulrh continued work on the commandline/state redesign. cmcaine wrote some RPC stuff he was happy with. saulrh got Mithril working with iframes.
        -   bovine3dom closed/fixed some more issues and made it harder to add undocumented config settings.
        -   glacambre finished hint mode and got it merged; he also fixed our find mode up a little bit.
        -   All of us went out for a curry, partially subsidised by our donors - so thanks!
    -   Day 4:
        -   azk and cmcaine got an input box working in an iframe under Mithril. They're confident that they'll be able to get a little bit of Tridactyl working with it soon.
        -   bovine3dom kept working through the backlog, closing duplicate issues and fixing easy ones. Particularly, error messages will no longer steal focus from the page.
        -   bovine3dom and cmcaine looked at the keyboard API again; we've changed a few things and now we get different error messages.
        -   In total, we closed 27 issues today.
        -   glacambre worked on find mode to the point where it's quite useable now; he's also been experimenting with new ways of doing ex-commands such that they can be created at runtime.
    -   Day 5:
        -   azk, cmcaine kept working on the iframe / commandline
        -   bovine3dom kept working through the backlog, closing duplicate issues and fixing easy ones. He also added `keyfeed` and user-definable modes.
        -   glacambre fixed smooth scrolling a bit, and made find mode a little better.
        -   In total, we closed 4 issues today (but they were harder :()
        -   nmx nqqrq ebg13 naq grkg.ebg13
            -   bound to `g?` by default; text mode version is not bound.
        -   glacambre, cmcaine and bovine3dom went for a walk up Higger Tor.
    -   Day 6:
        -   glacambre made some progress towards allowing us to remove our python macro script, replacing it with the TypeScript compiler
        -   glacambre fixed the find mode up a little more; it now focuses elements you select with it amongst other things
        -   bovine3dom added some kind of rudimentary version checking to `nativeinstall` to allow us to make breaking changes to the native messenger without breaking all old versions of Tridactyl forever - untested on Windows, so please poke us if it seems to be broken
        -   cmcaine fixed and broke numeric prefixes an odd number of times
        -   cmcaine swapped npm out for yarn as we were all fed up of npm making random changes to package-lock.json
        -   antonva looked at the keyboard-api and WebExtension experiments and got nowhere (like the rest of us :( )
        -   All of us went out for a Chinese meal - again subsidised by donors, so thanks!
    -   Day 7:
        -   glacambre left :(
        -   antonva fixed up and finished `mktridactylrc`
        -   bovine3dom investigated `keyup` binds and TreeStyleTab integration and opened draft PRs for both
        -   cmcaine played with iframes and the shadow DOM some more
    -   Day 8 - the final day:
        -   antonva left :(
        -   antonva fixed `set findcase smart` after leaving
        -   bovine3dom merged `:mktridactylrc`
        -   bovine3dom started to make a Sankey diagram accounting the funding and costs of the retreat for funsies

*   If Tridactyl breaks a website or is broken by a website, trying the steps in the [troubleshooting guide](https://github.com/tridactyl/tridactyl/blob/master/doc/troubleshooting.md) might help.

*   You can contact the developers, other users and contributors for support or whatever on [Matrix][matrix-link], [Gitter][gitter-link], or [IRC][freenode-link].

*   If you're enjoying Tridactyl (or not), please leave a review on [addons.mozilla.org][amo].

REPLACE_ME_WITH_THE_CHANGE_LOG_USING_SED

## Highlighted features:

-   `f`/`F` — enter the "hint mode" to select a link to follow. `F` to open it in a background tab. (Note: hint characters should be typed in lowercase.)
-   `Shift` + `Insert` — enter "ignore mode" to send all key presses to the web page you are on. Press `Shift` + `Insert` again to return to the highly productive "normal mode".
-   `H`/`L` — go back/forward in the history.
-   `o`/`O` — open a URL in this tab (`O` to pre-load current URL).
-   `t`/`T` — open a URL in a new tab (`T` to pre-load current URL).
-   `gt`/`gT` — go to the next/previous tab.
-   `d` — close the current tab.
-   `/` — open the find search box. Use <kbd>ctrl</kbd> + g/G to cycle through search results.
-   `A` — bookmark the current page
-   `b` — bring up a list of open tabs in the current window.
-   `s` — if you want to search for something that looks like a domain name or URL.
-   `gi` — scroll to and focus the last-used input on the page.
-   `gr` — open Firefox reader mode (note: Tridactyl will not work in this mode).
-   Bind your own commands with, e.g., `:bind J tabprev`. Type `:help bind` to see help on custom binds.
-   `yy` — copy the current page URL to your clipboard.
-   `[[`/`]]` — navigate forward/backward though paginated pages.
-   `ZZ` — close all tabs and windows, but it will only "save" them if your about:preferences are set to "show your tabs and windows from last time".
-   [`:help hint`][help-hint] to see all the other useful hint modes (this is the `f` magic. :) ).
-   `:help <keybinding>` to learn more about what a specific key binding does.

## Important limitations due to WebExtensions

-   You can only navigate to most about: and file: pages if you have Tridactyl's native executable installed.
-   Firefox will not load Tridactyl on about:\*, some file:\* URIs, view-source:\*, or data:\*. On these pages Ctrl-L (or F6), Ctrl-Tab and Ctrl-W are your escape hatches.
-   You can change the Firefox GUI with `guiset` (e.g. `guiset gui none` and then `restart`) if you have the native messenger installed, or you can do it yourself by changing your userChrome.
-   Tridactyl cannot capture key presses until web pages are loaded. You can use `:reloadall` to reload all tabs to make life more bearable, or flip `browser.sessionstore.restore_tabs_lazily` to false in `about:config`.

## Why do I see this here?

Tridactyl overrides your newtab page because it cannot insert its content script on the default about:newtab. Without the content script, our shortcuts won't work, even if you're just passing through the page. We're working with Firefox on improvements to the WebExtension APIs that will remove this restriction.

### How can I get rid of it?

-   `:set newtab [URL]`
    -   e.g, `:set newtab about:blank`

Also, if you want to use a new tab page provided by another extension, make sure to install said extension after Tridactyl. Uninstalling and re-installing the other extension should work too.

Alternatively, if you don't need Tridactyl to work on the new tab page, you can install the beta build without new tab page. You can get it [here][nonewtablink]. To migrate your configuration across builds, see [this comment][migratelink] or [this issue](https://github.com/tridactyl/tridactyl/issues/1353#issuecomment-463094704).

## FAQ

You have more questions? Have a look at our [FAQ][faq-link].

[1]: https://github.com/tridactyl/tridactyl/issues

<div class="align-left">
[1]: https://github.com/tridactyl/tridactyl/issues<br />
</div>

[faq-link]: https://github.com/tridactyl/tridactyl#frequently-asked-questions
[help]: /static/docs/modules/_src_excmds_.html
[tutor]: /static/clippy/1-tutor.html
[help-hint]: /static/docs/modules/_src_excmds_.html#hint
[gitter-badge]: /static/badges/gitter-badge.svg
[gitter-link]: https://gitter.im/tridactyl/Lobby
[freenode-badge]: /static/badges/freenode-badge.svg
[freenode-link]: ircs://chat.freenode.net/tridactyl
[matrix-badge]: https://matrix.to/img/matrix-badge.svg
[matrix-link]: https://riot.im/app/#/room/#tridactyl:matrix.org
[amo]: https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/reviews/
[nonewtablink]: https://tridactyl.cmcaine.co.uk/betas/nonewtab/tridactyl_no_new_tab_beta-latest.xpi
[migratelink]: https://github.com/tridactyl/tridactyl/issues/79#issuecomment-351132451
