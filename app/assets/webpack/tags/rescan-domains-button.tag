<rescan-domains-button>
  <button class="ui mini basic blue button">
    <i class="icon refresh"></i>
    Scan Domains
  </button>

  <script>
    import $ from 'jquery';
    const api = require('semantic-ui-api');

    this.on('mount', function(){
      const button = $('button', this.root);
      api.call(button, {
        url: '/scans.json',
        method: 'POST'
      });
    })
  </script>
</rescan-domains-button>
