import { take, call, put, fork, select } from 'redux-saga/effects'
import { takeLatest, delay, eventChannel } from 'redux-saga'
import {DOMAINS_LOADED} from './actions'
import cableSaga from './sagas/cable'

const SAMPLE_LIST = [
  {
    name: 'google.com',
    ssl: {
      status: 'ok',
      expiration: '2017-01-01'
    },
    dns: {
      status: 'warning',
      expiration: '2016-10-01'
    }
  },
  {
    name: 'apple.com',
    ssl: {
      status: 'na'
    },
    dns: {
      status: 'expired',
      expiration: '2016-05-01'
    }
  }
]

// function* domainsSaga() {
//   yield delay(2000)
//   yield put({type: DOMAINS_LOADED, list: SAMPLE_LIST})
//   console.log('DONE')
// }

export default function* () {
  // yield fork(domainsSaga)
  yield fork(cableSaga)
}
