// Here you can use ES6 "import" syntax
// Just remember to install the corresponding NPM package ;)

import 'babel-polyfill'
import 'semantic-ui-css/semantic.css';
import './tags'  // riot

import $ from 'jquery'

import riot from 'riot'
import { createStore, applyMiddleware } from 'redux'
import createSagaMiddleware from 'redux-saga'
import riotReduxMixin from 'riot-redux-mixin';

import rootReducer from './reducers'
import rootSaga from './sagas'

const sagaMiddleware = createSagaMiddleware()

const store = createStore(
  rootReducer,
  applyMiddleware(sagaMiddleware)
)

// window.store = store;

sagaMiddleware.run(rootSaga)

riot.mixin(riotReduxMixin(store));

$(() => {riot.mount('*')});
