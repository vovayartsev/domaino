// Here you can use ES6 "import" syntax
// Just remember to install the corresponding NPM package ;)

import 'babel-polyfill'
import 'whatwg-fetch'

import 'semantic-ui-css/semantic.css';
import './tags'  // riot

// used for Gauge
window.Raphael = require('raphael');
require('justgage');

import $ from './jq' // custom jQuery + plugins

import riot from 'riot'
import { createStore, applyMiddleware } from 'redux'
import createSagaMiddleware from 'redux-saga'
import riotReduxMixin from 'riot-redux-mixin';

import rootReducer from './reducers'
import rootSaga from './sagas'

const sagaMiddleware = createSagaMiddleware()

const store = createStore(
  rootReducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(sagaMiddleware)
)

// window.store = store;

sagaMiddleware.run(rootSaga)

riot.mixin(riotReduxMixin(store));

$(() => {riot.mount('*')});
