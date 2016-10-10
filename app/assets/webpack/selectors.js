import { createSelector } from 'reselect'

export const domainsSelector = createSelector(
  (state) => state.domains,
  (domains) => domains
)
