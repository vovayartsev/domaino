import { combineReducers } from 'redux';
import { merge, pick } from 'ramda';
import { DOMAINS_LOADED, UPDATE_SETTINGS } from './actions';

const DEFAULT_DOMAINS_STATE = {
  loaded: false,
  list: []
}

const DEFAULT_SETTINGS_STATE = {
  herokuEmailNotifications: true,
  customEmails: ""
}

function domainsReducer(state = DEFAULT_DOMAINS_STATE, action) {
  switch (action.type) {
    case DOMAINS_LOADED:
      return merge(state, {list: action.list, loaded: true})
    default:
      return state;
  }
}

function settingsReducer(state = DEFAULT_SETTINGS_STATE, action) {
  switch (action.type) {
    case UPDATE_SETTINGS:
      return merge(state, action.patch)
    default:
      return state;
  }
}

export default combineReducers({
  domains: domainsReducer,
  settings: settingsReducer
})
