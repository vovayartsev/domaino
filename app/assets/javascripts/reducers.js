import { combineReducers } from 'redux';
import { merge, pick } from 'ramda';
import { DOMAINS_LIST_CHANNEL, SETTINGS_CHANNEL } from './actions';

const DEFAULT_DOMAINS_STATE = {
  loaded: false,
  list: []
}

const DEFAULT_SETTINGS_STATE = {
  herokuEmailNotifications: true,
  customEmails: "",
  loaded: false
}

function domainsReducer(state = DEFAULT_DOMAINS_STATE, action) {
  switch (action.type) {
    case DOMAINS_LIST_CHANNEL:
      return merge(state, {list: action.representation.list, loaded: true})
    default:
      return state;
  }
}

function settingsReducer(state = DEFAULT_SETTINGS_STATE, action) {
  switch (action.type) {
    case SETTINGS_CHANNEL:
      return merge(state, {loaded: true, ...action.representation})
    default:
      return state;
  }
}

export default combineReducers({
  domains: domainsReducer,
  settings: settingsReducer
})
