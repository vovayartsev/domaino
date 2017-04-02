import { createSelector } from 'reselect'
import { merge } from 'ramda'

export const domainsSelector = createSelector(
  (state) => state.domains,
  (domains) => domains
)

export const settingsSelector = createSelector(
  (state) => state.settings,
  (settings) => settings
)


const JUMBO_STYLES = {
  ok: {
    icon: "check circle",
    color: 'green',
  },
  warning: {
    icon: "alarm outline",
    color: 'orange'
  },
  expired: {
    icon: "fire",
    color: 'red'
  },
  not_configured: {
    icon: "wizard",
    color: 'disabled'
  },
  na: {
    icon: "ban",
    color: 'disabled'
  }
}


export const jumboMessage = createSelector(
  (state) => state.summary,
  (summary) => merge(summary, JUMBO_STYLES[summary.status])
)
