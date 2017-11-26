import {hasModifiers} from '../keyseq'

// Placeholder - should be moved into generic parser
export function parser(keys){
    const response = {keys: [], ex_str: undefined}
    if (! hasModifiers(keys[0])) {
        if (keys[0].key === 'Escape') {
            return {keys: [], ex_str: 'unfocus'}
        }
    }
    else if (keys[0].ctrlKey && (keys[0].key == "e")){
        console.log("I GOT CALLED")
        return {keys: [], ex_str: 'acehere'}
    }
    return {keys: [], ex_str: undefined}
}
