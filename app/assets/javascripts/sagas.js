import { take, call, put, fork, select } from 'redux-saga/effects'
import { takeLatest, delay, eventChannel } from 'redux-saga'
import {DOMAINS_LOADED} from './actions'
import cableSaga from './sagas/cable_saga'

export default function* () {
  yield fork(cableSaga, ["DomainsListChannel", "SettingsChannel", "SummaryChannel"])
}
