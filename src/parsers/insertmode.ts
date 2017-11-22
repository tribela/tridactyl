import {hasModifiers} from '../keyseq'

// Placeholder - should be moved into generic parser
export function parser(keys){
    const response = {keys: [], ex_str: undefined}
    if (! hasModifiers(keys[0])) {
        if (keys[0].key === 'Escape') {
            return {keys: [], ex_str: 'unfocus'}
        }
    } else if (keys[0].ctrlKey && (keys[0].key == "e")) {
        return {keys: [], ex_str: 'codemirrorhere'}
    }
    return {keys: [], ex_str: undefined}
}
