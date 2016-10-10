<notification-settings-table>
  <table class="ui celled table">
    <thead>
      <tr>
        <th width="25%">
          Notification Method
        </th>
        <th width="50%">
          Recepient(s)
        </th>
        <th width="25%">
          Actions
        </th>
      </tr>
    </thead>

    <tbody>

      <tr>
        <td>
          E-mail
        </td>
        <td>
          { opts.email }
          (<a class="right floated" href="#">configure...</a>)
        </td>
        <td>
          <div class="ui fitted toggle checkbox">
            <input type="checkbox" checked disabled/>
            <label></label>
          </div>
        </td>
      </tr>

      <tr>
        <td>
          SMS
        </td>
        <td class="disabled">
          Not available yet...
        </td>
        <td>
        </td>
      </tr>

      <tr>
        <td>
          Human Intelligence
        </td>
        <td class="disabled">
          Not available yet...
        </td>
        <td>
        </td>
      </tr>

    </tbody>
  </table>

  <script>
  </script>

</notification-settings-table>
