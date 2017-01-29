<configuration-form>
  <a href="javascript: void(0);" onclick={ onclick }>configure...</a>

  <div class="ui modal">
    <i class="close icon"></i>
    <div class="header">
      { opts.title }
    </div>

    <div class="content" name="content"/>

    <div class="actions">
      <div class="ui cancel button">Cancel</div>
      <div class="ui confirmation button">OK</div>
    </div>
  </div>

  <script>
  import $ from '../jq'

  const fetchHtml = (url) => {
    return fetch(url, {credentials: 'same-origin'}).then(r => r.text());
  }

  this.onclick = function() {
    this.content.innerHTML = "Loading..."

    // loading the FORM from the server
    fetchHtml(`/settings/${this.opts.cell}/edit`).then(html => {
      this.content.innerHTML = html

      // clicking ENTER within the form should not result in a regular POST
      $("form", this.content).submit((e) => {
        e.preventDefault();
        $('.ui.confirmation.button', this.root).click();
      })
    });

    $('.ui.modal', this.root).modal({detachable: false}).modal('show');

    // "OK" button handler
    $('.ui.confirmation.button', this.root).api({
      url: `/settings/${this.opts.cell}`,
      method: 'PUT',
      beforeSend: (settings) => {
        settings.data = $('form', this.content).serialize();
        return settings;
      },
      onFailure: (html) => {
        this.content.innerHTML = html
      },
      onSuccess: () => {
        $('.ui.modal', this.root).modal('hide')
      }
    })
  }
  </script>
</configuration-form>
