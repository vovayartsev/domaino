import ActionCable from 'actioncable'
import { take, call, put, fork, select } from 'redux-saga/effects'
import { takeLatest, delay, eventChannel } from 'redux-saga'

const cable = ActionCable.createConsumer('/cable')

function subscribe(channel) {
  return eventChannel((emit) => {
    cable.subscriptions.create(channel, { received: emit })
  })
}

export default function* cableSaga() {
  const channel = subscribe("PortalChannel")
  yield takeLatest(channel, put)
}
