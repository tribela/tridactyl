Crap: if we send the events to the background script, we can't then preventDefault them...

We can preventDefault them on the content script side and then the background can message us later and tell us to dispatch a similar event. Don't know what the lag on that is going to be. *Woops:*: See [note](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent#Auto-repeat_handling_prior_to_Gecko_5.0) just below anchor. KeyboardEvents dispatched by scripts do not trigger "default events", like putting text into input boxes.

So we can still do it, depending on what "default events" means. We could check if the target is an input field, maybe? Security issue seems like a bizarre reason, given that we can just edit the value of the input fields. If we want an Insert mode, we can just cancel all events and then edit the input field value?

    tridactyl.messaging = {}

    tridactyl.messaging.__init__ = ->

        # Return a Port object to feed key events.
        # Protocol is: just send key events.
        @contentKeyEventTransmitter = ->
            browser.runtime.connect({name:'key_events'})

        # KeyEvent objects can't be copied, so just send the bits we need.
        @contentKeyEventWrapper = (ev) ->
            bits_we_need = ["key", "altKey", "timestamp", "metaKey"]

        @backgroundOnConnectHandler = (port) =>
            switch(port.name)
                when "key_events"
                    port.onMessage.addListener(console.log)
                else
                    console.error("What's this!?", port)

    tridactyl.messaging.__init__()
