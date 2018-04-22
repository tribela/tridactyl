/** Find the first parent element of the current selection that can be scrolled
    in the direction and axis specified or a sensible default if none can be
    found.

    @param dir
        direction in which to scroll. Used to ensure that the returned element
        can still be scrolled in the desired direction.
*/
export function findScrollable(dir = 0, horizontal = false) {
    /* let pos = "scrollTop", maxPos = "scrollTopMax", clientSize = "clientHeight"; */
    /* if (horizontal) */
    /*     pos = "scrollLeft", maxPos = "scrollLeftMax", clientSize = "clientWidth"; */

    /* function find(elem): HTMLElement | undefined { */
    /*     if (elem && !(elem instanceof Element)) */
    /*         elem = elem.parentNode; */

    /*     for (; elem && elem.parentNode instanceof Element; elem = elem.parentNode) { */
    /*         if (elem[clientSize] == 0) */
    /*             continue; */
    /*         if (dir < 0 && elem[pos] > 0 || dir > 0 && elem[pos] < elem[maxPos] || dir == 0 && elem[maxPos] > 0) */
    /*             break; */
    /*     } */
    /*     return elem; */
    /* } */

    /* let win = this.focusedWindow; */
    /* if (win.getSelection().rangeCount) */
    /*     var elem = find(win.getSelection().getRangeAt(0).startContainer); */
    /* if (!(elem instanceof Element)) { */
    /*     let doc = Buffer.findScrollableWindow().document; */
    /*     elem = find(doc.body || doc.getElementsByTagName("body")[0] || */
    /*                 doc.documentElement); */
    /* } */
    /* return elem; */
}
