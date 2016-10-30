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
          Heroku e-mail
        </td>
        <td>
          { opts.email }
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
          Additional e-mails
        </td>
        <td class="disabled">
          Not configured
        </td>
        <td>
          <a href="#">configure...</a>
        </td>
      </tr>

      <tr>
        <td>
          SMS
        </td>
        <td class="disabled">
          Not configured
        </td>
        <td>
          <a href="#">configure...</a>
        </td>
      </tr>

      <tr>
        <td>
          Human Intelligence
        </td>
        <td class="disabled">
          Not configured
        </td>
        <td>
          <a href="#">configure...</a>
        </td>
      </tr>

    </tbody>
  </table>

  <script>
  </script>

</notification-settings-table>
