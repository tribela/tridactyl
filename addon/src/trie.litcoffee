Simple implementation of a prefix tree, or trie. Inspired by http://odhyan.com/blog/2010/11/trie-implementation-in-javascript/

   # p = Proxy.create({ # p["yes"] returns "Hello, yes"
   #     get: (proxy, name)  ->
   #         return 'Hello, '+ name
   # })

    console.log("loaded trie")


    class Trie
        constructor: () -> # this makes name an instance variable
            @words = 0
            @prefixes = 0
            @children = {}
            @object = {}

        insert: (obj, pos=0) ->
            str = obj.str
            if str.length == 0
                return
            if pos == str.length
                @words++
                @object = obj
                return
            @prefixes++
            k = str[pos]
            @children[k] ?= new Trie()
            child = @children[k]
            child.insert(obj, pos + 1)

        getObj: (str, pos=0) ->
            if pos == str.length
                return (if Object.keys(@children).length == 0 then @object else @children)
            else
                k = str[pos]
                return child = @children[k].getObj(str, pos + 1)

        find: (str, pos=0) ->
            if pos == str.length
                if Object.keys(@children).length == 0
                    false
                else
                    for s in Object.keys(@children)
                        str + s
            else
                k = str[pos]
                return child = @children[k].find(str, pos + 1)

        getAllChildren: (str="") ->
            result = []
            if @words > 0 then result.push(str)
            for k in Object.keys(@children)
                child = @children[k]
                result = result.concat(child.getAllChildren(str + k))
            return result

        getChildren: (str, pos=0) ->
            if str.length == 0
                return []
            k = str[pos]
            child = @children[k]
            if child == undefined
                return []
            if pos == str.length - 1
                child.getAllChildren(str)
            return child.getChildren(str, pos + 1)

        myLoop: (str) ->
            (s for s in @find(str) when s != false)


        # subTrie(str) gets the subtree whose root corresponds to str, or undefined.
        subTrie: (str) ->
            initial = @getObj(str)


