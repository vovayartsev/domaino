<rescan-domains-button>
  <button class="ui mini basic blue button">
    <i class="icon refresh"></i>
    Scan Domains
  </button>

  <script>
    import $ from '../jq';
    import { apiError } from '../utils/notify';

    this.on('mount', function(){
      $('button', this.root).api({
        url: '/scans.json',
        method: 'POST',
        onFailure: apiError
      })
    })
  </script>
</rescan-domains-button>
