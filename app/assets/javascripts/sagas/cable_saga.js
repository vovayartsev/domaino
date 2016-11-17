import ActionCable from 'actioncable'
import { take, call, put, fork, select } from 'redux-saga/effects'
import { takeLatest, delay, eventChannel } from 'redux-saga'

const cable = ActionCable.createConsumer('/cable')

function subscribe(channel) {
  return eventChannel((emit) => {
    cable.subscriptions.create(channel, { received: emit })
  })
}

function* plugIntoRedux(name) {
  yield takeLatest(subscribe(name), put)
}

export default function* cableSaga(channels) {
  for (let i = 0; i < channels.length; ++i) {
    yield fork(plugIntoRedux, channels[i]);
  }
}
