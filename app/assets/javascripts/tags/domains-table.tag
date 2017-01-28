<domains-table>
  <table class="ui celled table">
    <thead>
      <tr>
        <th width="33%">
          Domain Name
        </th>
        <th width="33%">
          DNS Status
        </th>
        <th width="33%">
          SSL Status
        </th>
      </tr>
    </thead>

    <tbody if={ !loaded }>
      <tr> <td colspan="3" style="height: 140px; text-align: center">
        <div class="ui text inline loader {active: !loaded}">Loading</div>
      </td> </tr>
    </tbody>

    <tbody if={ loaded }>
      <tr each={ preprocess(list) }>
        <td>
          <a href="http://{name}/" target='_blank'>{ name }</a>
        </td>
        <td class={ dns.class }>
          { dns.message }
          <div class="ui centered inline active mini loader" if={ dns.loading }/>
        </td>
        <td class={ ssl.class }>
          { ssl.message }
          <div class="ui centered inline active mini loader" if={ ssl.loading }/>
        </td>
      </tr>
    </tbody>
  </table>

  <script>
  import { domainsSelector } from '../selectors'
  import { mapDomainsTableCell } from '../datamappers'
  import { map } from 'ramda'

  this.subscribe(domainsSelector); // connect REDUX

  // UI logic: mapping state to UI classes
  this.preprocess = map((item) => {
    console.log(item)
    return {
      name: item.name,
      dns: mapDomainsTableCell(item.dns),
      ssl: mapDomainsTableCell(item.ssl)
    };
  })

  </script>

</domains-table>
