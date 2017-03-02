# tridactyl.internals module

Mostly helper functions for tridactyl.commands?

    tridactyl.internals = {}
    tridactyl.internals.__init__ = ->

        @sendMessageToActiveTab = (message) =>
            @sendMessageToFilteredTabs({active:true},message)

        @sendMessageToFilteredTabs = (filter,message) =>
            filtTabs = await browser.tabs.query(filter)
            browser.tabs.sendMessage(tab.id,message) for tab in filtTabs

        @doArbitraryCodeInWindow = (object, args) =>
            @sendMessageToActiveTab({command:"arbitrary",object,args})
            # example: doArbitraryCodeInWindow("scrollBy",[0,100])

## Regex test

Adapted from http://www.dustindiaz.com/autocomplete-fuzzy-matching

        tridactyl.mystrings = ["colin", "olie", "jake", "harri"]
        @matchString = (input) =>
            search = new RegExp(input.split('').join('\\w*').replace(/\W/, ""), 'i')
            tridactyl.mystrings.filter((string) ->
                if string.match(search)
                    return string
            )

## Finish the Tridactyl namespace and initialise it

    tridactyl.internals.__init__()
