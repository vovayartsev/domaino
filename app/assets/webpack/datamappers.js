// DNS or SSL item can have one of these statuses:
const OK = 'ok'
const WARNING = 'warning'
const EXPIRED = 'expired'
const NA = 'na'

export function mapDomainsTableCell(cell) {
  console.log(cell.status)
  switch(cell.status){
    case OK:
      return {
        class: 'positive',
        message: `Valid until ${cell.expiration}`
      }

    case WARNING:
      return {
        class: 'warning',
        message: `Expires on ${cell.expiration}`
      }

    case EXPIRED:
      return {
        class: 'error',
        message: `Expired on ${cell.expiration}`
      }

    case NA:
      return {
        class: 'disabled',
        message: 'N/A'
      }

    default:
      console.error(`mapDomainsTableCell(): Invalid cell status: ${cell.status}`)
  }
}
