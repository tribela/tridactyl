import {hasModifiers} from '../keyseq'

// Placeholder - should be moved into generic parser
export function parser(keys){
    const response = {keys: [], ex_str: undefined}
    if (! hasModifiers(keys[0])) {
        if (keys[0].key === 'Escape' || (keys[0].key === '[' && keys[0].ctrlKey === true)) {
            return {keys: [], ex_str: 'unfocus'}
        }
    }
    return {keys: [], ex_str: undefined}
}
