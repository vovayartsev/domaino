<rescan-domains-button>
  <button class="ui mini basic blue button">
    <i class="icon refresh"></i>
    Scan Domains
  </button>

  <script>
    import $ from '../jq';

    this.on('mount', function(){
      $('button', this.root).api({
        url: '/scans.json',
        method: 'POST'
      })
    })
  </script>
</rescan-domains-button>
