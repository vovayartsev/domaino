import { combineReducers } from 'redux';
import { merge, pick } from 'ramda';
import { DOMAINS_LOADED } from './actions';

const DEFAULT_DOMAINS_STATE = {
  loaded: false,
  list: []
}

function domainsReducer(state = DEFAULT_DOMAINS_STATE, action) {
  switch (action.type) {
    case DOMAINS_LOADED:
      return merge(state, {list: action.list, loaded: true})
    default:
      return state;
  }
}

export default combineReducers({
  domains: domainsReducer
})
