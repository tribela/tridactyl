import { getContext } from "./webext"
import {
    addListener,
    attributeCaller,
    message,
    messageActiveTab,
} from "../messaging"

/** Runtime function dispatcher.

    Give any function that you want to be available in both foreground and
    background to one of background, content, or dispatch. Wrapped functions
    must have a name, though this could be changed.

    Import the same source file into content and background.

    At execution time, each decorated function will be returned as-is or
    wrapped with a messaging call to the background/content (on activeTab)
    version of the same script.

    Limitations:

        - Helper functions that should be available on only one side can't be
          expressed.
        - It's a bit clumsy to write:
            `export const foo = d.background(function foo(bar) {`

    Advantages:

        - Modules that involve a lot of communication between bg and content
          will be simpler to read and write.

    @param modName: the name of the module we're dispatching for.
*/
export default class Dispatcher {
    private context
    private ourFuncs = Object.create(null)

    constructor(private modName) {
        this.context = getContext()
        addListener(modName, attributeCaller(this.ourFuncs))
    }

    background<T extends Function>(func: T): T {
        return this.dispatch(undefined, func)
    }

    content<T extends Function>(func: T): T {
        return this.dispatch(func, undefined)
    }

    dispatch<T extends Function>(contentFun: T, backgroundFun: T): T {
        if (this.context == "background") {
            if (backgroundFun) {
                this.ourFuncs[backgroundFun.name] = backgroundFun
                return backgroundFun
            } else {
                return this.wrapContent(contentFun)
            }
        } else {
            if (contentFun) {
                this.ourFuncs[contentFun.name] = contentFun
                return contentFun
            } else {
                return this.wrapBackground(backgroundFun)
            }
        }
    }

    /* private wrap(func) { */
    /*     let fn */
    /*     if (this.context == 'background') { */
    /*         fn = (...args) => message(this.type, func.name, args) */
    /*     } else { */
    /*         fn = (...args) => messageActiveTab(this.type, func.name, args) */
    /*     } */
    /*     Object.defineProperty(fn, 'name', {value: func.name}) */
    /*     return fn */
    /* } */

    private wrapBackground(func): any {
        return (...args) => message(this.modName, func.name, args)
    }

    private wrapContent(func): any {
        return (...args) => messageActiveTab(this.modName, func.name, args)
    }
}
