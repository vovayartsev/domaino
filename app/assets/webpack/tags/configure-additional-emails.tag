<configure-additional-emails>
  <a href="javascript: void(0);" onclick={ onclick }>configure...</a>

  <div class="ui modal">
    <i class="close icon"></i>
    <div class="header">
      Additional e-mail addresses
    </div>
    <div class="content">
      <div class="ui form">
        <div class="field">
          <label>Recepients</label>
          <input type="text" name="input" placeholder="Space-separated list of emails">
        </div>
      </div>
    </div>
    <div class="actions">
      <div class="ui cancel button">Cancel</div>
      <div class="ui ok button">OK</div>
    </div>
  </div>

  <script>
  import $ from '../jq'
  import {settingsSelector} from '../selectors'
  import {updateSettings} from '../actions'

  this.subscribe(settingsSelector)
  this.dispatchify({updateSettings})

  const onApprove = () => {
    this.updateSettings({customEmails: this.input.value})
  }

  this.onclick = function() {
    this.input.value = this.customEmails;
    $('.ui.modal', this.root)
      .modal({detachable: false, onApprove})
      .modal('show')
  }
  </script>
</configure-additional-emails>
