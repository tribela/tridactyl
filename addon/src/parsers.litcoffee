    tridactyl.parsers = {}
    tridactyl.parsers.__init__ = ->

TODO: See if `this` can be fixed in below.

        ParserController = ->
            # Loop forever
            loop
                # Receive keys until mode parser tells us to handle an ex_str
                loop
                    keys = []
                    ex_str = ""

                    # Pause until someone calls parserController.next
                    keys.push(yield)

                    # Mode parsers return an object with either a `keys` or an
                    # `ex_str` property.
                    
                    # If `.keys` exists it is a mapping of keys to continue to
                    # append to and resend (the mapping was not terminal, send
                    # me these keys again). `.keys` may differ from the passed
                    # value.
                    # If `.ex_str`, the mapping was terminal: drop all the keys
                    # you have now and break to handle the ex_str.
                    response = normal_mode_parser(keys)

                    if response.keys != undefined
                        keys = response.keys
                    else
                        ex_str = response.ex_str
                        break

                # Both the exStrParser and functionExecutor may throw Errors.
                try
                    # Parse the ex_str into a function and command to run
                    [func, args] = tridactyl.parsers.exStrParser(ex_str)
                    # Run whatever functions we get given.
                    tridactyl.parsers.functionExecutor(func, args)
                catch e
                    # TODO: replace this with a call to the UI error bar.
                    console.log(e)
            
        # Create the generator object
        @parserController = ParserController()
        # Bind the .next function so it won't do anything crazy.
        @parserController.next = @parserController.next.bind(parserController)

        # Run the parserController until the first yield
        @parserController.next()

We should specify the function signature here, with types and do all the simple input validation in one place, maybe?

commands should move somewhere else and be automatically generated, eventually.

        @commands = {
            "tabfocus": tridactyl.commands.tabfocus
        }

        @exStrParser = (str) =>
            strArray = str.split(" ")
            command = strArray[0]
            func = @commands[command]
            if func == undefined
                throw new Error(":#{command} not defined!")
            args = strArray[1]
            # Number(<some string>) returns either a number or NaN. NaN and 0
            # are both falsy, so need to test for NaN explicitly.
            args = ((if not Number.isNaN(Number(a)) then Number(a) else a) for a in args)
            return {func, args}

Takes functions from parser controller and calls them. Eventually, this will get more complicated to allow command chaining (e.g. `scroll 30|hint`)

        @functionExecutor = (command,args) =>
            command(args...) # ... is unpacks the list

Example use: call `var x = exStrParser("tabfocus 1"); funcParser(x.func,x.args)` in the Firefox addon console

    tridactyl.parsers.__init__()
