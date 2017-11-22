import * as CodeMirror from 'codemirror'
import 'codemirror/lib/codemirror.css'
import 'codemirror/theme/monokai.css'

export function codemirrorme(){
    CodeMirror.fromTextArea(document.activeElement as HTMLTextAreaElement)
    // CodeMirror(document.body, {value: "function myScript(){return 100;}\n", mode: "javascript"})
}
