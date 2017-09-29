<jumbo-message>
    <div class="ui massive { color } icon message" if={ status }>
        <i class="{ icon } icon"></i>
        <div class="content">
            <div class="header">{ header }</div>
            <p><raw html="{ message }"></raw></p>
        </div>
    </div>
    <script>
      import {jumboMessage} from '../selectors'
      this.subscribe(jumboMessage)
    </script>
</jumbo-message>
