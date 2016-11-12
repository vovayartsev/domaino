import { createSelector } from 'reselect'

export const domainsSelector = createSelector(
  (state) => state.domains,
  (domains) => domains
)

export const settingsSelector = createSelector(
  (state) => state.settings,
  (settings) => settings
)
