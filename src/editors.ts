import * as ace from 'brace';
import 'brace/mode/javascript';
import 'brace/theme/monokai';


export function aceme(){
    let textarea = document.activeElement as HTMLTextAreaElement
    let rect = textarea.getClientRects()[0]
    let editdiv = html`<div position='absolute' width=${rect.width}, height=${rect.height}>`
    editdiv.insertBefore(textarea,null)
    // textarea.css("hidden")
    const editor = ace.edit(editdiv)
    editor.getSession().setMode('ace/mode/javascript');
    editor.setTheme('ace/theme/monokai');
}
