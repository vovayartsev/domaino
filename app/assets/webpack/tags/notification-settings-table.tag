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
          { opts.email } TODO: merge with Additional
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
        <td class={ disabled: !customEmails } >
          { customEmails || "Not configured" }
        </td>
        <td>
          <configure-additional-emails/>
        </td>
      </tr>

      <tr>
        <td>
          SMS
        </td>
        <td class={ disabled: !sms_recepient }>
          { sms_recepient || "Not configured" }
        </td>
        <td>
          <configuration-form title="SMS Settings"/>
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
  import {settingsSelector} from '../selectors'
  this.subscribe(settingsSelector)
  </script>

</notification-settings-table>
