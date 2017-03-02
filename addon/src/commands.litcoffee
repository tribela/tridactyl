# tridactyl.commands module

This module contains functions that implement each ex command in tridactyl. The name of the function should match the ex command, where possible.

The following is an attempt at namespacing in CoffeeScript. The `__init__` function defines all the functions in the module and allocates them as this.blah. The fat arrows, `=>`, binds the value of `this` whenever the function is called to whatever it was at the time of the function's creation, which, in this case is `tridactyl.commands`. So functions in the same module can call each other with `@funcname` safely.

    tridactyl = {}

    tridactyl.commands = {}
    tridactyl.commands.__init__ = ->

        @tabfocus = (id) =>
            browser.tabs.update(id,{active:true})

        @tabinc = (inc) =>
            try
                window = await browser.windows.getCurrent()
                tabs = await browser.tabs.query({windowId:window.id})
                activeTab = (tab for tab in tabs when tab.active)[0]
                desiredIndex = (activeTab.index + inc).mod(tabs.length)
                desiredTab = (tab for tab in tabs when tab.index == desiredIndex)[0]
                @tabfocus(desiredTab.id)
            catch error
                console.error(error)

## First attempt at message parsing wrapper to avoid duplication of code

The following functions all talk to the content.js script to perform functions that need to operate on, e.g., the `window.history` object.

        @historyinc = @forward = (n) =>
            tridactyl.internals.sendMessageToActiveTab({command:"history", number:n})

        @back = (n) =>
            @historyinc(n*-1)

        @scroll = goScroll = (n) =>
            tridactyl.internals.sendMessageToActiveTab({command:"scroll",number:n})

    tridactyl.commands.__init__()

